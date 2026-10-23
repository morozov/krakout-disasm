#!/usr/bin/env python3
"""Render each level's 9x9 brick field to a PNG, with its spawn cells outlined.

Usage: render_levels.py IMAGE OUTDIR. IMAGE is a program image based at $4000.

Writes OUTDIR/level-index-NN.png for level index NN, 0-99, with the bat on the
right. Level index NN is LEVEL NN+1 on the first lap.
"""

import os
import sys
from PIL import Image

ORG = 0x4000

LEVEL_LAYOUTS = 0x6754   # 81 bytes per level index
SPAWN_CELLS = 0x86F8     # four candidate spawn cells per level index
BRICK_ATTRS = 0x9191     # one attribute byte per slot code
BRICK_TILE_GROUPS = 0x921A  # four tile codes per slot code
TILEGFX_BASE = 0xD800    # a tile code's glyph sits at TILEGFX_BASE + code*8

LEVELS = 100
GRID = 9                 # cells per row and per column
CELL_TILES = 2           # a cell is 2x2 character tiles
SCALE = 1                # one image pixel per game pixel
MARGIN = 1               # transparent pixels around the field

NORMAL, BRIGHT = 0xCD, 0xFF

SPAWN_MARK = (0xFF, 0xFF, 0xFF, 0xFF)
SHADE = 35                # percent of a pixel's brightness left beside the outline


def zx_rgb(index, bright):
    """RGB for a 3-bit ZX color index (bit0=blue, bit1=red, bit2=green)."""
    level = BRIGHT if bright else NORMAL
    return (
        level if index & 2 else 0,   # red
        level if index & 4 else 0,   # green
        level if index & 1 else 0,   # blue
    )


def cell_image(data, code):
    """Return the 16x16 RGB image of one brick slot code."""
    attr = data[BRICK_ATTRS - ORG + code]
    group = data[BRICK_TILE_GROUPS - ORG + code * 4:
                 BRICK_TILE_GROUPS - ORG + code * 4 + 4]
    ink = zx_rgb(attr & 7, attr & 0x40) + (255,)
    # Transparent paper: the page background is not pure black.
    paper = zx_rgb((attr >> 3) & 7, attr & 0x40) + (0,)

    img = Image.new("RGBA", (8 * CELL_TILES, 8 * CELL_TILES), paper)
    px = img.load()
    for i, tile in enumerate(group):
        tx, ty = (i % CELL_TILES) * 8, (i // CELL_TILES) * 8
        glyph = data[TILEGFX_BASE - ORG + tile * 8:
                     TILEGFX_BASE - ORG + tile * 8 + 8]
        for r, byte in enumerate(glyph):
            for c in range(8):
                px[tx + c, ty + r] = ink if byte & (1 << (7 - c)) else paper
    return img


def mark_spawn_cells(img, data, index, footprint):
    """Outline the level's four candidate spawn cells on its field.

    Each byte is a cell as row*9 + column, as $C5C4 decodes it. The outline runs
    one pixel outside the bricks' footprint, dashed 2 px on and 1 px off, and
    dims the pixels on either side of it.
    """
    px = img.load()
    span = 8 * CELL_TILES
    left, top, right, bottom = footprint
    for byte in data[SPAWN_CELLS - ORG + index * 4:
                     SPAWN_CELLS - ORG + index * 4 + 4]:
        row, col = divmod(byte, GRID)
        if row >= GRID:
            continue
        x0 = MARGIN + col * span + left - 1
        y0 = MARGIN + row * span + top - 1
        x1 = MARGIN + col * span + right
        y1 = MARGIN + row * span + bottom
        track = ([(x, y) for x in range(x0, x1 + 1) for y in (y0, y1)] +
                 [(x, y) for y in range(y0, y1 + 1) for x in (x0, x1)])
        on_track = set(track)
        for x, y in track:
            for dx in (-1, 0, 1):
                for dy in (-1, 0, 1):
                    if (x + dx, y + dy) not in on_track:
                        shade(px, img.size, x + dx, y + dy)
        for x in range(x0, x1 + 1):
            if dash(x - x0, x1 - x0 + 1):
                px[x, y0] = px[x, y1] = SPAWN_MARK
        for y in range(y0, y1 + 1):
            if dash(y - y0, y1 - y0 + 1):
                px[x0, y] = px[x1, y] = SPAWN_MARK


def dash(i, length):
    """True where a dashed edge of `length` pixels is lit at pixel `i`."""
    assert length % 3 == 2, f"a {length} px edge cannot start and end on a dash"
    return i % 3 != 2


def shade(px, size, x, y):
    """Dim one pixel of the field to SHADE of its brightness; paper stays."""
    if 0 <= x < size[0] and 0 <= y < size[1]:
        r, g, b, a = px[x, y]
        if a:
            px[x, y] = (r * SHADE // 100, g * SHADE // 100, b * SHADE // 100, a)


def level_image(data, index, cells, footprint):
    """Return the RGBA image of one level index's brick field, inside a
    transparent MARGIN that holds the spawn outlines of edge cells."""
    side = GRID * 8 * CELL_TILES + 2 * MARGIN
    img = Image.new("RGBA", (side, side), (0, 0, 0, 0))
    layout = data[LEVEL_LAYOUTS - ORG + index * GRID * GRID:
                  LEVEL_LAYOUTS - ORG + (index + 1) * GRID * GRID]
    for slot, code in enumerate(layout):
        row, col = divmod(slot, GRID)
        img.paste(cells[code], (MARGIN + col * 8 * CELL_TILES,
                                MARGIN + row * 8 * CELL_TILES))
    mark_spawn_cells(img, data, index, footprint)
    return img


def main():
    if len(sys.argv) != 3:
        raise SystemExit("usage: render_levels.py IMAGE OUTDIR")
    src, outdir = sys.argv[1:3]
    data = open(src, "rb").read()
    os.makedirs(outdir, exist_ok=True)

    codes = set()
    for index in range(LEVELS):
        base = LEVEL_LAYOUTS - ORG + index * GRID * GRID
        codes.update(data[base:base + GRID * GRID])
    cells = {code: cell_image(data, code) for code in codes}

    # The union of the lit pixels of every placed slot code, as (left, top,
    # right, bottom) with right and bottom exclusive.
    boxes = [img.getchannel("A").getbbox() for img in cells.values()]
    boxes = [box for box in boxes if box]
    footprint = (min(b[0] for b in boxes), min(b[1] for b in boxes),
                 max(b[2] for b in boxes), max(b[3] for b in boxes))

    for index in range(LEVELS):
        img = level_image(data, index, cells, footprint)
        if SCALE != 1:
            img = img.resize((img.width * SCALE, img.height * SCALE),
                             Image.NEAREST)
        img.save(os.path.join(outdir, f"level-index-{index:02d}.png"))

    print(f"Wrote {LEVELS} level renders to {outdir}/: "
          f"{GRID}x{GRID} cells, {(GRID * 8 * CELL_TILES + 2 * MARGIN) * SCALE} px square, "
          f"{len(cells)} distinct slot codes placed")


if __name__ == "__main__":
    main()
