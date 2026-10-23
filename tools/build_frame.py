#!/usr/bin/env python3
"""Compose the site's page-frame PNGs from Krakout's own border tiles.

Usage: build_frame.py IMAGE REF OUTDIR. IMAGE is the program image based at
$4000, REF is the .ref file that holds the border renders, and OUTDIR receives
page-frame.png and page-frame-wall.png.

page-frame.png is the 9-slice `border-image`:

    +--------+----+--------+
    | tl     | p  |     tr |   corners: 2x2 tiles each
    +--------+----+--------+   p: the strip's plain cell
    |        |    |        |   left/right middle: transparent
    |        |    |        |
    +--------+----+--------+
    | bl     | p  |     br |
    +--------+----+--------+

page-frame-wall.png is the side wall's 8-row period.

Tile codes come from the game's tables in the program image, which hold each
band whole. The wall's render in REF shows one period, and a period is found
only where it repeats, so the render cannot supply the tiles. Colors come
from the `#UDGARRAY` macros in REF, each checked to show a run of its
table's tiles. corner_tl's color stands for all four corners, because the game
paints them alike.
"""

import os
import re
import sys

from PIL import Image

ORG = 0x4000
SCALE = 2

# The glyph for tile code n is at TILEGFX_BASE + n*8.
TILEGFX_BASE = 0xD800

# Tile-code tables, as (address, count, width).
WALL_TABLE = (0x97BD, 36, 2)
STRIP_TABLE = (0x97E1, 56, 28)
CORNER_TABLES = {"tl": 0x9819, "tr": 0x9821, "bl": 0x981D, "br": 0x9825}

NORMAL, BRIGHT = 0xCD, 0xFF

TRANSPARENT = (0, 0, 0, 0)


def zx_rgba(index, bright):
    """RGBA for a 3-bit ZX color index (bit0=blue, bit1=red, bit2=green)."""
    level = BRIGHT if bright else NORMAL
    return (
        level if index & 2 else 0,   # red
        level if index & 4 else 0,   # green
        level if index & 1 else 0,   # blue
        255,
    )


def parse_udgarray(text, name):
    """Return (width, [(addr, attr), ...]) for the #UDGARRAY macro named `name`.

    Raises SystemExit when the macro is absent or a UDG spec does not parse.
    """
    m = re.search(
        r"#UDGARRAY(\d+),(\d+)(?:,[\w=]+)*\(([^()]*)\)\(" + name + r"\)", text)
    if not m:
        raise SystemExit(f"{name} UDGARRAY macro not found")
    width = int(m.group(1))
    default_attr = int(m.group(2))
    udgs = []
    for spec in m.group(3).split(";"):
        sm = re.match(r"\$([0-9A-Fa-f]+)(?:,(\d+))?$", spec.strip())
        if not sm:
            raise SystemExit(f"unparseable UDG spec in {name}: {spec}")
        attr = int(sm.group(2)) if sm.group(2) else default_attr
        udgs.append((int(sm.group(1), 16), attr))
    return width, udgs


def table_addrs(data, table):
    """Return the glyph addresses of one tile-code table, laid out in rows."""
    addr, count, width = table
    codes = data[addr - ORG:addr - ORG + count]
    if len(codes) != count:
        raise SystemExit(f"tile table at {addr:#06x} runs past the image")
    glyphs = [TILEGFX_BASE + code * 8 for code in codes]
    return [glyphs[i:i + width] for i in range(0, count, width)]


def check_sample(name, sample_rows, band_rows):
    """Exit unless a catalog render shows a consecutive run of its table's band."""
    if len(sample_rows) > len(band_rows):
        raise SystemExit(f"{name}: render is longer than its table")
    across = len(sample_rows) == len(band_rows)
    # A render as tall as its band is a run of columns (the strip); a shorter one
    # is a run of rows (the wall).
    if across:
        w = len(sample_rows[0])
        windows = [[row[i:i + w] for row in band_rows]
                   for i in range(len(band_rows[0]) - w + 1)]
    else:
        n = len(sample_rows)
        windows = [band_rows[i:i + n] for i in range(len(band_rows) - n + 1)]
    if sample_rows not in windows:
        raise SystemExit(f"{name}: render tiles are not a run of its table")


def wall_period(rows):
    """Return the smallest p for which `rows` is p rows repeated end to end.

    The period fits at least twice, and the rows after its last whole repeat may
    be a partial one. Returns None when no period fits.
    """
    for p in range(1, len(rows) // 2 + 1):
        if all(rows[i] == rows[i % p] for i in range(len(rows))):
            return p
    return None


def longest_run(cells):
    """Return (cell, length) for the longest run of one repeated cell."""
    best_len, best = 0, cells[0]
    i = 0
    while i < len(cells):
        j = i
        while j + 1 < len(cells) and cells[j + 1] == cells[i]:
            j += 1
        if j - i + 1 > best_len:
            best_len, best = j - i + 1, cells[i]
        i = j + 1
    return best, best_len


def paint(img, data, col, row, addr, attr):
    """Draw one 8x8 UDG at tile position (col, row), leaving paper transparent."""
    glyph = data[addr - ORG:addr - ORG + 8]
    ink = zx_rgba(attr & 7, attr & 0x40)
    px = img.load()
    for r, byte in enumerate(glyph):
        for c in range(8):
            if not byte & (1 << (7 - c)):
                continue
            x0 = (col * 8 + c) * SCALE
            y0 = (row * 8 + r) * SCALE
            for dy in range(SCALE):
                for dx in range(SCALE):
                    px[x0 + dx, y0 + dy] = ink


def main():
    if len(sys.argv) != 4:
        raise SystemExit("usage: build_frame.py IMAGE REF OUTDIR")
    src, ref, outdir = sys.argv[1:4]
    out = os.path.join(outdir, "page-frame.png")
    wall_out = os.path.join(outdir, "page-frame-wall.png")
    data = open(src, "rb").read()
    text = open(ref).read()

    wall_band = table_addrs(data, WALL_TABLE)
    wall_w, wall_udgs = parse_udgarray(text, "side_wall")
    check_sample("side_wall",
                 [[a for a, _ in wall_udgs[i:i + wall_w]]
                  for i in range(0, len(wall_udgs), wall_w)], wall_band)
    # One attribute per wall column.
    wall_attr = [attr for _, attr in wall_udgs[:wall_w]]
    period = wall_period(wall_band)
    if period is None:
        raise SystemExit("side wall table shows no repeating row period")

    strip_band = table_addrs(data, STRIP_TABLE)
    strip_w, strip_udgs = parse_udgarray(text, "border_strip")
    check_sample("border_strip",
                 [[a for a, _ in strip_udgs[i:i + strip_w]]
                  for i in range(0, len(strip_udgs), strip_w)], strip_band)
    # One attribute per strip row, so the render must carry both rows, which
    # check_sample does not require.
    if len(strip_udgs) < strip_w * 2:
        raise SystemExit("border_strip: render must carry both rows")
    strip_attr = [strip_udgs[0][1], strip_udgs[strip_w][1]]
    strip_cells = list(zip(*strip_band))
    plain, run = longest_run(strip_cells)

    corner_attr = parse_udgarray(text, "corner_tl")[1][0][1]
    corners = {}
    for name, addr in CORNER_TABLES.items():
        band = table_addrs(data, (addr, 4, 2))
        check_sample("corner_" + name,
                     [[a for a, _ in parse_udgarray(text, "corner_" + name)[1][i:i + 2]]
                      for i in range(0, 4, 2)], band)
        corners[name] = [a for row in band for a in row]

    # Tile grid: corner | edge | corner, both ways.
    cols = 2 * wall_w + 1
    rows = 4 + period

    img = Image.new("RGBA", (cols * 8 * SCALE, rows * 8 * SCALE), TRANSPARENT)
    for i, addr in enumerate(corners["tl"]):
        paint(img, data, i % 2, i // 2, addr, corner_attr)
    for i, addr in enumerate(corners["tr"]):
        paint(img, data, cols - 2 + i % 2, i // 2, addr, corner_attr)
    for i, addr in enumerate(corners["bl"]):
        paint(img, data, i % 2, rows - 2 + i // 2, addr, corner_attr)
    for i, addr in enumerate(corners["br"]):
        paint(img, data, cols - 2 + i % 2, rows - 2 + i // 2, addr, corner_attr)
    for i, addr in enumerate(plain):
        paint(img, data, wall_w, i, addr, strip_attr[i])
        paint(img, data, wall_w, rows - 2 + i, addr, strip_attr[i])
    img.save(out)
    print(f"Wrote {out}: {img.width}x{img.height} "
          f"(slice {2 * 8 * SCALE}, scale {SCALE})")

    wall = Image.new("RGBA", (wall_w * 8 * SCALE, period * 8 * SCALE),
                     TRANSPARENT)
    for r, row in enumerate(wall_band[:period]):
        for c, addr in enumerate(row):
            paint(wall, data, c, r, addr, wall_attr[c])
    wall.save(wall_out)
    print(f"Wrote {wall_out}: {wall.width}x{wall.height}")

    print(f"Side wall: {len(wall_band)} rows, period {period}")
    print(f"Border strip: {len(strip_cells)} cells, "
          f"longest repeated cell run {run}")


if __name__ == "__main__":
    main()
