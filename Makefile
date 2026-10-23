GAME = krakout

ORG  = 16384    # $4000
SIZE = 48796    # $4000-$FE9B
PC   = 35752    # $8BA8, where the loader stub jumps
SP   = 65535    # the game's own LD SP,65535
RELOC_FLOOR = 0x5B00

SKILL ?= $(HOME)/.agents/skills/zx-game-disasm
SITE_DIR = vendor/zx-game-disasm
DEV_MK = $(SKILL)/tools/disassembly.mk

-include $(SITE_DIR)/site.mk
ifneq ($(wildcard $(DEV_MK)),)
    include $(DEV_MK)
else ifndef SITE_HOME
    $(error $(SITE_DIR)/site.mk not found, and no skill at $(SKILL) to vendor it from)
else
    $(info $(DEV_MK) not found: only the site build is available)
endif

# Each stamp stands in for 100 renders.
STAMPS = $(BUILD)/stamps
LEVEL_RENDERS = $(STAMPS)/levels-krakout.stamp

$(LEVEL_RENDERS): tools/render_levels.py $(BIN)
	@mkdir -p $(dir $@)
	python3 tools/render_levels.py $(BIN) $(SITE_RENDERS)/levels/krakout
	@touch $@

KRAKOUT_II_T2S = $(SRC)/krakout-ii.t2s
KRAKOUT_II_Z80 = $(BUILD)/krakout-ii.z80
KRAKOUT_II_BIN = $(BUILD)/krakout-ii.bin
KRAKOUT_II_LEVEL_RENDERS = $(STAMPS)/levels-krakout-ii.stamp

$(KRAKOUT_II_Z80): $(KRAKOUT_II_T2S)
	@mkdir -p $(dir $@)
	$(TAP2SNA) @$(KRAKOUT_II_T2S) $@

# Extracted at the game image's ORG and SIZE, so tools/render_levels.py reads
# Krakout II's tables at Krakout's addresses.
$(KRAKOUT_II_BIN): $(KRAKOUT_II_Z80)
	$(SITE_HOME)/extract_bytes.py $(KRAKOUT_II_Z80) $(ORG) $(SIZE) $@

$(KRAKOUT_II_LEVEL_RENDERS): tools/render_levels.py $(KRAKOUT_II_BIN)
	@mkdir -p $(dir $@)
	python3 tools/render_levels.py $(KRAKOUT_II_BIN) $(SITE_RENDERS)/levels/krakout-ii
	@touch $@

KRAKOUT_II_SCREEN = $(SITE_RENDERS)/krakout-ii-loading-screen.png

$(KRAKOUT_II_SCREEN): $(KRAKOUT_II_Z80)
	@mkdir -p $(dir $@)
	sna2img.py -e 'SCR2,tindex=1,alpha=0' $(KRAKOUT_II_Z80) $@

KRAKOUT_II_ICON = $(SITE_RENDERS)/krakout-ii-icon.png

# The "II" of the loading screen's title.
$(KRAKOUT_II_ICON): $(KRAKOUT_II_BIN)
	@mkdir -p $(dir $@)
	$(SITE_HOME)/render/screen_cells.py $(KRAKOUT_II_BIN) $@ --org $(ORG) --cells 25,4,6,6 --trim

PAGE_FRAME = $(SITE_RENDERS)/page-frame.png $(SITE_RENDERS)/page-frame-wall.png

$(PAGE_FRAME) &: tools/build_frame.py src/graphics.ref $(BIN)
	@mkdir -p $(SITE_RENDERS)
	python3 tools/build_frame.py $(BIN) src/graphics.ref $(SITE_RENDERS)

FONT = $(SITE_RENDERS)/krakout-font.ttf $(SITE_RENDERS)/krakout-font.woff2

# --first and --last bound the game's glyphs, which run from code $20 at $8FB9.
# Lower codes would read other entries, and code $5B reads the brick attribute
# table at $9191.
$(FONT) &: $(BIN)
	@mkdir -p $(SITE_RENDERS)
	$(SITE_HOME)/render/font.py $(BIN) --org $(ORG) --base 0x8EB9 \
	    --first 0x20 --last 0x5A --family Krakout \
	    --id 'Krakout;Gremlin Graphics 1987;extracted' --out $(SITE_RENDERS)/krakout-font

# The rendered site files, which the framework's stamp rule does not list.
$(HTML_DIR)/.stamp: $(FONT) $(PAGE_FRAME) $(LEVEL_RENDERS) $(KRAKOUT_II_LEVEL_RENDERS) \
             $(KRAKOUT_II_ICON) $(KRAKOUT_II_SCREEN)

ifdef SKILL_HOME
# The build half of the relocation proof, over the permutes in tools/reloc.toml.
# For the runtime half, make a snapshot of the baseline and each variant with
# bin2sna.py, run `$(SCRIPTS)/reloc/oracle.py <snapshot.z80> <image> <dump>
# --config tools/reloc.toml --script long --org $(ORG)` on each, and compare each
# pair with `$(SCRIPTS)/reloc/compare.py <a> <b> --config tools/reloc.toml`.
RELOC_CONFIG = tools/reloc.toml
RELOC_VARIANT = $(BUILD)/reloc/krakout.perm.bin
RELOC_SPAWN = $(BUILD)/reloc/krakout.perm-spawn.bin
RELOC_ARGS = --config $(RELOC_CONFIG) --floor $(RELOC_FLOOR) --org $(ORG)

.PHONY: reloc
reloc: $(ASM) $(ASM_BIN) $(RELOC_CONFIG)
	@mkdir -p $(dir $(RELOC_VARIANT))
	$(SCRIPTS)/reloc/permute.py $(ASM) $(ASM_BIN) $(RELOC_VARIANT) $(RELOC_ARGS) --permute tune
	$(SCRIPTS)/reloc/permute.py $(ASM) $(ASM_BIN) $(RELOC_SPAWN) $(RELOC_ARGS) --permute spawn
endif
