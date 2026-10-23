# Krakout Disassembly

This project reverse engineers [Krakout](https://spectrumcomputing.co.uk/entry/2768/ZX-Spectrum/Krakout), a game for the ZX Spectrum 48K published by Gremlin Graphics in 1987, from the original tape image using [SkoolKit](https://skoolkit.ca).

<p align="center">
    <img src="resources/loading-screen.png" width="512" height="384" alt="The Krakout loading screen">
</p>

## Building the Disassembly

1. Install the [`zx-game-disasm`](https://github.com/morozov/zx-spectrum-skills/tree/main/zx-game-disasm) skill and its requirements.
2. Install the Python packages in `tools/requirements.txt`.
3. Build the disassembly by running `make`. If the skill is not in `~/.agents/skills/zx-game-disasm`, run `make SKILL=<path to the skill>`. The build downloads the Krakout and Krakout II tape images from Spectrum Computing.

The HTML disassembly is written to `build/html/krakout/`, and the assembly source to `build/krakout.asm`.
