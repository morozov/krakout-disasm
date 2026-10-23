@ $4000 start
@ $4000 equ=SCREEN_BASE=$4000
@ $4000 equ=SCREEN_SIZE=$1800
@ $4000 equ=ATTR_BASE=$5800
@ $4000 equ=FONT_BASE=font_glyphs-$100
@ $4000 equ=TILEMAP_BASE=tilemap
@ $4000 equ=TILEMAP_SIZE=$0300
@ $4000 equ=BACKBUF_BASE=spr_visor_1
@ $4000 equ=TILEGFX_BASE=tile_glyphs-$100
@ $4000 equ=WORKBUF_FB=workbuf
@ $4000 equ=KBD_ROW_B_SPACE=$7FFE
@ $4000 equ=KBD_ROW_Y_P=$DFFE
@ $4000 equ=KBD_ROW_H_ENTER=$BFFE
@ $4000 equ=KBD_ROW_6_0=$EFFE
@ $4000 equ=KBD_ROW_Q_T=$FBFE
@ $4000 equ=KBD_ROW_1_5=$F7FE
@ $4000 equ=SPEAKER_OUT_OPCODE=$FED3
@ $4000 equ=STACK_TOP=$FFFF
@ $4000 org
@ $4000 label=loading_screen
b $4000 Loading screen
D $4000 The loading screen's display file and attributes. The labeled cells are the fixed screen positions of the score, menu and options text.
N $4000 #UDGTABLE { #SCR2(loading_screen) } TABLE#
B $4000,24
@ $4018 label=score_readout
B $4018,40
  $4018 Start cell of the high-score readout
@ $4040 label=highscore_heading
B $4040,96
  $4040 Start cell of the high-score name-entry screen's heading
@ $40A0 label=opt_bat_side_cell
B $40A0,40
  $40A0 Start cell of the options bat-side line
@ $40C8 label=title_menu_line1
B $40C8,24
  $40C8 Start cell of title-screen menu line 1
@ $40E0 label=opt_sound_cell
B $40E0,1832
  $40E0 Start cell of the options sound line
@ $4808 label=title_menu_line2
B $4808,24
  $4808 Start cell of title-screen menu line 2
@ $4820 label=opt_ball_speed_cell
B $4820,40
  $4820 Start cell of the options ball-speed line
@ $4848 label=title_menu_line3
B $4848,56
  $4848 Start cell of title-screen menu line 3
@ $4880 label=opt_bat_ctrl_head
B $4880,8
  $4880 Start cell of the options BAT CONTROL TYPE header
@ $4888 label=title_menu_line4
B $4888,56
  $4888 Start cell of title-screen menu line 4
@ $48C0 label=opt_bat_ctrl_value
B $48C0,8
  $48C0 Start cell of the options bat-control value line
@ $48C8 label=title_menu_line5
B $48C8,1848
  $48C8 Start cell of title-screen menu line 5
@ $5000 label=opt_press_play_cell
B $5000,8
  $5000 Start cell of the options PRESS PLAY prompt
@ $5008 label=title_menu_line6
B $5008,24
  $5008 Start cell of title-screen menu line 6
@ $5020 label=opt_load_levels_cell
B $5020,2344
  $5020 Start cell of the options LOAD LEVELS prompt
@ $5948 label=title_menu_col8_attr
B $5948,440
  $5948 Start cell of the title menu's column-8 attributes
@ $5B00 label=ball_a_x_accum
g $5B00 Ball A state
D $5B00 Ball A's state record, 16 bytes
B $5B00,1 Ball A X sub-pixel accumulator
@ $5B01 label=ball_a_y_accum
B $5B01,1 Ball A Y sub-pixel accumulator, the same on the Y axis
@ $5B02 label=ball_a_x_threshold
B $5B02,1 Ball A X step threshold: sub-pixel units per pixel step, 0 for no X motion
@ $5B03 label=ball_a_y_threshold
B $5B03,1 Ball A Y step threshold, the same on the Y axis
@ $5B04 label=ball_a_x_dir
B $5B04,1 Ball A X direction: 0 for left, 1 for right
@ $5B05 label=ball_a_y_dir
B $5B05,1 Ball A Y direction: 0 for up, 1 for down
@ $5B06 label=ball_a_speed
B $5B06,1 Ball A speed: move passes per frame
@ $5B07 label=ball_a_move_pass
B $5B07,1 Ball A move passes taken this frame
@ $5B08 label=ball_a_move_gate
B $5B08,1 Ball A re-hit gate: 0 when idle, 1 to 8 while it is armed
@ $5B09 label=ball_a_deflect_cooldown
B $5B09,1 Ball A inhabitant-deflect cooldown: 0 when idle, 1 to 12 while it runs
@ $5B0A label=ball_a_bounce_count
B $5B0A,1 Ball A bounces toward the next rally speed step
@ $5B0B label=ball_a_on_bat
B $5B0B,1 Ball A on the bat: 1 while the bat holds ball A for a serve or a glue catch, 0 otherwise
@ $5B0C label=ball_a_skip_catch
B $5B0C,1 Ball A bat-catch bypass: 1 when the next bat hit is a plain bounce, with no glue catch, combo reset or speed step, 0 otherwise
S $5B0D,3 Ball A record tail. Its last byte is the hold timer, which times both a serve and a glue catch.
@ $5B10 label=ball_b_x_accum
g $5B10 Ball B state
D $5B10 Ball B's state, in the same fields as #R$5B00(ball A's state).
B $5B10,1
@ $5B11 label=ball_b_y_accum
B $5B11,1
@ $5B12 label=ball_b_x_threshold
B $5B12,1
@ $5B13 label=ball_b_y_threshold
B $5B13,1
@ $5B14 label=ball_b_x_dir
B $5B14,1
@ $5B15 label=ball_b_y_dir
B $5B15,1
@ $5B16 label=ball_b_speed
B $5B16,1
@ $5B17 label=ball_b_move_pass
B $5B17,1
@ $5B18 label=ball_b_move_gate
B $5B18,1
@ $5B19 label=ball_b_deflect_cooldown
B $5B19,1
@ $5B1A label=ball_b_bounce_count
B $5B1A,1
@ $5B1B label=ball_b_on_bat
B $5B1B,1
@ $5B1C label=ball_b_skip_catch
B $5B1C,1
S $5B1D,3 Ball B record tail. Its last byte is the hold timer, which times both a serve and a glue catch.
S $5B20,8 Unused
@ $5B28 label=hit_brick_addr
g $5B28 Brick-hit and sweep pointers
W $5B28,2 Tile-map address of the brick last struck, by a ball, an inhabitant or the starburst
@ $5B2A label=scan_cell_ptr
W $5B2A,2 Tile-map address of the sweep's current cell
@ $5B2C label=scan_anim_seq_ptr
W $5B2C,2 Start of the break-animation sequence the sweep plays into its current cell
@ $5B2E label=cluster_center_addr
W $5B2E,2 Tile-map address of the bomb blast's center brick, or of the top-left brick slot of its 3×3 block once the bomb detonates
B $5B30,3 Unused
@ $5B33 label=bounce_axis_count
g $5B33 Bounce codes for the frame
D $5B33 Which axes the ball's move pass bounced on, and the bounce code each produced.
B $5B33,1 Axes the ball bounced on this move: 0 for none, 1 for one, 2 for both at a corner
@ $5B34 label=bounce_x_code
B $5B34,1 X-axis bounce: $FF for none, $00 for a rightward hit, $02 for a leftward hit
@ $5B35 label=bounce_y_code
B $5B35,1 Y-axis bounce: $FF for none, $01 for an upward hit, $03 for a downward hit
B $5B36,1 Unused
@ $5B37 label=active_ball
g $5B37 Ball selector
D $5B37 Which ball the physics act on this frame.
B $5B37,1 0 for ball A, 1 for ball B
@ $5B38 label=ball_b_in_play
g $5B38 Ball-B-live flag and the ball's per-axis step flags
D $5B38 Whether ball B is in play, then the axis-step flags of the ball's current pass.
B $5B38,1 Set while the secondary object carries a ball: the missile shot or a real ball B
B $5B39,1 Unused
@ $5B3A label=x_stepped
B $5B3A,1 Set when the ball's current move pass steps its X
@ $5B3B label=y_stepped
B $5B3B,1 Set when the ball's current move pass steps its Y
@ $5B3C label=unused_5b3c
u $5B3C Unused bytes
S $5B3C,6
@ $5B42 label=overlap_slot_1
g $5B42 Overlap-test operands
D $5B42 The two operands the overlap test compares.
B $5B42,1 First overlap operand: a pool slot
@ $5B43 label=overlap_slot_2
B $5B43,1 Second overlap operand: a pool slot
@ $5B44 label=unused_5b44
u $5B44 Unused bytes
S $5B44,1
@ $5B45 label=bat_impact_side
g $5B45 Bat impact side
B $5B45,1 0 if the ball struck left of the bat's origin, 1 if right of it
@ $5B46 label=glue_active
g $5B46 Prize flags and the struck brick's index
B $5B46,1 Glue active: 1 while the glue prize is in effect, 0 otherwise
S $5B47,7 Unused
@ $5B4E label=hit_brick_index
B $5B4E,1 Offset of the brick last struck into the brick state map: its brick index, column plus row times 9, doubled
@ $5B4F label=expand_active
B $5B4F,1 Expand active: 1 while the expand prize is in effect, 0 otherwise
@ $5B50 label=double_bat_active
B $5B50,1 Double bat active: 1 while the double bat prize is in effect, 0 otherwise
S $5B51,1 Unused
@ $5B52 label=brick_anim_offset
g $5B52 Brick-break and sweep positions
D $5B52 Positions within the break animation and the brick-field sweep
B $5B52,1 Break-animation offset into the cell's sequence, eight bytes per sub-frame
@ $5B53 label=sweep_offset
B $5B53,1 Sweep position, as an offset into the brick state map
@ $5B54 label=sweep_rows_done
B $5B54,1 Rows swept this frame
B $5B55,1 Unused
@ $5B56 label=golden_flash_timer
g $5B56 Golden-twinkle timer
B $5B56,1 Golden twinkle step: 0 when no twinkle runs, otherwise the step it has reached, 1 to 15
B $5B57,1 Unused
@ $5B58 label=missile_shot
g $5B58 Secondary-object and missile-bat state
D $5B58 What the secondary object holds, and whether the missile bat is up.
B $5B58,1 Set when the secondary object holds the missile shot, clear when it holds a real ball B
@ $5B59 label=missile_active
B $5B59,1 Missile active: 1 while the missile prize is in effect, 0 otherwise
S $5B5A,7 Unused
@ $5B61 label=fx_bat_missile_arm
g $5B61 Effect-driver arm flags
D $5B61 One arm flag per effect
B $5B61,1 Swap the bat to the missile sprite
@ $5B62 label=fx_bat_normal_arm
B $5B62,1 Restore the normal bat sprite
@ $5B63 label=fx_retract_arm
B $5B63,1 Retract the secondary object. It also counts the animation's frames, 1 to 16.
@ $5B64 label=fx_grow_arm
B $5B64,1 Grow the expanded bat. It also counts the animation's frames, 1 to 8.
@ $5B65 label=fx_shrink_arm
B $5B65,1 Shrink the expanded bat. It also counts the animation's frames, 1 to 8.
@ $5B66 label=fx_bomb_arm
B $5B66,1 Detonate a bomb. It also counts the blast's frames, 1 to 16.
@ $5B67 label=cluster_brick_index
g $5B67 Blast center, death pause and level-clear state
B $5B67,1 Brick index of the bomb blast's center brick, or of a brick slot in its 3×3 block once the bomb detonates
@ $5B68 label=death_pause_timer
B $5B68,1 Death pause: 0 when no pause runs, otherwise the frame it has reached, 1 to 99
@ $5B69 label=cleared_cell_count
B $5B69,1 Slots cleared in the current sweep
@ $5B6A label=level_cleared
B $5B6A,1 Level-cleared flag
@ $5B6B label=safety_net_fx_phase
g $5B6B Safety net animation state
B $5B6B,1 Safety net flash phase: 0 for no net, 1 when armed, 2 while it brightens, 3 while it holds, 4 while it dims
@ $5B6C label=safety_net_fx_step
B $5B6C,1 Safety net flash step: its place in the current phase, 0 to 23 on a ramp and 0 to 4 in the hold
@ $5B6D label=safety_net_fx_hold
B $5B6D,1 Safety net hold timer: the frame within the current 256-frame step of the hold, 0 to 255
B $5B6E,1 Unused
@ $5B6F label=pending_score
g $5B6F Pending points and combos
D $5B6F The frame's pending points and each ball's combo
B $5B6F,1 Points earned this frame, not yet added to the score
B $5B70,1 Unused
@ $5B71 label=combo_a
@ $5B72 label=combo_b
B $5B71,2,1 Combos of ball A and ball B, in that order: the bricks each ball has hit in a row, up to 25
@ $5B73 label=bat_velocity
g $5B73 Bat movement inputs
B $5B73,1 Inertia accumulator, 0 to 127
@ $5B74 label=bat_move_dir
B $5B74,1 Inertia direction: 1 for up, 2 for down
B $5B75,5 Unused
@ $5B7A label=work_x
g $5B7A Object scratch and step
B $5B7A,1 Work X: the pixel X of the spawn position
@ $5B7B label=work_y
B $5B7B,1 Work Y: the pixel Y of the spawn position
B $5B7C,1 Unused
@ $5B7D label=ball_gem_frame
B $5B7D,1 Ball gem frame: 0 while no ball gem is out, otherwise its animation frame
@ $5B7E label=prize_on_field_latched
B $5B7E,1 The steady copy of the #R$5B83(on-field prize flag), latched at the end of each sweep
B $5B7F,1 Unused
@ $5B80 label=object_step
B $5B80,1 Pixel step of the object in motion: its speed, less 1 above speed 1
@ $5B81 label=probe_block_code
B $5B81,1 Wall-probe result: bit 0 set when the cell ahead is solid, bit 1 set when the second probed cell is
@ $5B82 label=fx_spawn_ball_arm
g $5B82 Prize and despawn requests
B $5B82,1 Spawn ball B. It also counts the spawn animation's frames, 1 to 9.
@ $5B83 label=prize_on_field
B $5B83,1 A bomb, missile or double bat glyph lies on the field.
@ $5B84 label=double_score
B $5B84,1 Double score active
@ $5B85 label=glue_release_req
B $5B85,1 Glue release request
@ $5B86 label=fx_despawn_arm
B $5B86,1 Despawn the secondary object. It also counts the animation's frames, 1 to 16.
B $5B87,1 Unused
@ $5B88 label=capture_active
g $5B88 Ball-capture slide flags
B $5B88,1 Ball captured: 1 from the orb's catch until the capture slide delivers ball A to the losing edge, 0 otherwise
@ $5B89 label=capture_slide
B $5B89,1 Capture slide: 1 while the slide carries ball A to the losing edge, 0 otherwise
@ $5B8A label=hit_params
g $5B8A Brick hit-type code
D $5B8A What struck the brick
B $5B8A,1 0 for a ball, 1 for an inhabitant, 2 for the starburst
@ $5B8B label=step_blocked
g $5B8B Step-collision result
D $5B8B What an inhabitant's attempted step ran into
B $5B8B,1 Set when an inhabitant's step lands on a solid tile, wall or brick
@ $5B8C label=step_hit_wall
B $5B8C,1 Set for a wall or border tile, clear for a brick
@ $5B8D label=spawn_throttle
g $5B8D Wave-script spawn throttle
B $5B8D,1 Wave spawn attempts since the last spawn, the comet's excepted
@ $5B8E label=move_freeze
g $5B8E Global freeze and its counter
B $5B8E,1 Freeze flag: 1 while a freeze runs, 0 otherwise
@ $5B8F label=freeze_timer_lo
@ $5B90 label=freeze_timer_hi
B $5B8F,2,1 Freeze timer, low byte first: the frames since the freeze began, 0 to 511
@ $5B91 label=bat_freeze
g $5B91 Bat freeze and its counter
B $5B91,1 Bat freeze: 1 while the bat is frozen, 0 otherwise
@ $5B92 label=bat_freeze_timer
B $5B92,1 Frames the bat freeze has held
@ $5B93 label=unused_5b93
u $5B93 Unused bytes
S $5B93,1
@ $5B94 label=clone_stack_offset
g $5B94 Spawn parameters
B $5B94,1 Vertical offset of the latest swarm wheel below the wheel that set the swarm trigger, a multiple of 16 px
@ $5B95 label=wheel_swarm_trigger
B $5B95,1 Wheel swarm trigger: 1 from a wheel's spawn until the free inhabitant slots fill with wheels, 0 otherwise
@ $5B96 label=spawn_fixed_pos
B $5B96,1 Spawn at the first table entry when set, at a random one when clear
@ $5B97 label=unused_5b97
u $5B97 Unused bytes
S $5B97,4
@ $5B9B label=bat_sting_freeze
g $5B9B Bat-movement gate
D $5B9B The bee's sting
B $5B9B,1 Sting freeze: 1 while the bat is stung, 0 otherwise
@ $5B9C label=unused_5b9c
u $5B9C Unused bytes
S $5B9C,100
@ $5C00 label=slot_visor_1
s $5C00 Visor and capsule sprite slots at the sprite bank's base
D $5C00 Base of the sprite bank, the 16×16 sprites the game draws from. The #R$8BA8(cold-init copy) fills the bank from the #R$E000(source bank).
D $5C00 The slots here hold the three visor sprites and the first twelve rows of the capsule frame-1 sprite. Their #R$E000(source bitmaps) open the source bank.
N $5C00 Play runs with interrupts off and the stack at the top of RAM. The bank therefore occupies the ZX system-variable area.
N $5C00 Its first eight bytes are the ROM keyboard-state area, which the front end saves and restores around its one HALT. The ninth is the ROM's LAST-K, which it does not restore – see #LINK(Defects#speck)(Defects).
N $5C00 A slot is one 16×16 sprite at 2 bytes per pixel row.
N $5C00 Until the cold-init copy runs, the slots below the #R$5D40(expanded bat's bottom half) hold system RAM. The slots from there up to the #R$6000(inhabitant sprite slots) are zero. The inhabitant sprite slots already hold their sprites.
N $5C00 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E001,,2;$E000,,2;$E011,,2;$E010,,2)(slot_visor_1) } TABLE#
S $5C00,32 Visor frame-1 sprite, copied from #R$E000(its source bitmap)
@ $5C20 label=slot_visor_2
N $5C20 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E021,,2;$E020,,2;$E031,,2;$E030,,2)(slot_visor_2) } TABLE#
S $5C20,32 Visor frame-2 sprite, copied from #R$E020(its source bitmap)
@ $5C40 label=slot_visor_3
N $5C40 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E041,,2;$E040,,2;$E051,,2;$E050,,2)(slot_visor_3) } TABLE#
S $5C40,32 Visor frame-3 sprite, copied from #R$E040(its source bitmap)
@ $5C60 label=slot_capsule_1
N $5C60 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E061,,2;$E060,,2;$E071,,2;$E070,,2)(slot_capsule_1) } TABLE#
S $5C60,24 Capsule frame-1 sprite up to the #R$5C78(ROM FRAMES system variable), copied from #R$E060(its source bitmap). The slot ends in #R$5C7B(its tail rows).
@ $5C78 label=frames_low
g $5C78 ROM FRAMES counter, inside the sprite bank
D $5C78 The ROM FRAMES counter. The sprite bank's #R$5C60(capsule frame-1 slot) runs through these three bytes.
B $5C78,2
@ $5C7A label=frames_high
B $5C7A,1 ROM FRAMES counter, high byte
@ $5C7B label=slot_capsule_1_tail
s $5C7B Capsule sprite slots
D $5C7B The capsule's four sprites, filled by the #R$8BA8(cold-init copy). Their source bitmaps are #R$E060(frame 1), #R$E080(frame 2), #R$E0A0(frame 3) and #R$E0C0(frame 4).
D $5C7B Frame 1 opens in the #R$5C60(bank's base block) and resumes here, because the #R$5C78(ROM FRAMES system variable) lands inside it.
N $5C7B #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E061,,2;$E060,,2;$E071,,2;$E070,,2)(slot_capsule_1) } TABLE#
S $5C7B,5 Tail rows of the #R$5C60(capsule frame-1 slot), which resume where the ROM FRAMES system variable ends
@ $5C80 label=slot_capsule_2
N $5C80 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E081,,2;$E080,,2;$E091,,2;$E090,,2)(slot_capsule_2) } TABLE#
S $5C80,32 Capsule frame-2 sprite, copied from #R$E080(its source bitmap)
@ $5CA0 label=slot_capsule_3
N $5CA0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E0A1,,2;$E0A0,,2;$E0B1,,2;$E0B0,,2)(slot_capsule_3) } TABLE#
S $5CA0,32 Capsule frame-3 sprite, copied from #R$E0A0(its source bitmap)
@ $5CC0 label=slot_capsule_4
N $5CC0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E0C1,,2;$E0C0,,2;$E0D1,,2;$E0D0,,2)(slot_capsule_4) } TABLE#
S $5CC0,32 Capsule frame-4 sprite, copied from #R$E0C0(its source bitmap)
@ $5CE0 label=slot_ball
s $5CE0 Ball sprite slot
D $5CE0 Ball, copied from #R$E0E0(its source bitmap).
N $5CE0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E0E1,,2;$E0E0,,2;$E0F1,,2;$E0F0,,2)(slot_ball) } TABLE#
S $5CE0,32 Ball sprite, copied from #R$E0E0(its source bitmap)
@ $5D00 label=slot_bat_normal
s $5D00 Normal-bat sprite slot
N $5D00 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E101,,2;$E100,,2;$E111,,2;$E110,,2)(slot_bat_normal) } TABLE#
S $5D00,32 Normal bat, copied from #R$E100(its source bitmap)
@ $5D20 label=slot_bat_exp_top
s $5D20 Expanded-bat sprite slots
D $5D20 Expanded bat, top and bottom halves, copied from #R$E120(their source bitmaps).
N $5D20 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E121,,2;$E120,,2;$E131,,2;$E130,,2;$E141,,2;$E140,,2;$E151,,2;$E150,,2)(slot_bat_exp) } TABLE#
S $5D20,32 Expanded bat, top half, copied from #R$E120(its source bitmap)
@ $5D40 label=slot_bat_exp_bottom
S $5D40,32 Expanded bat, bottom half, copied from #R$E140(its source bitmap)
@ $5D60 label=slot_bat_missile
s $5D60 Missile-bat sprite slot
D $5D60 Missile bat, copied from #R$E160(its source bitmap).
N $5D60 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E161,,2;$E160,,2;$E171,,2;$E170,,2)(slot_bat_missile) } TABLE#
S $5D60,32 Missile-bat sprite, copied from #R$E160(its source bitmap)
@ $5D80 label=slot_missile_shot
s $5D80 Missile-shot sprite slots
D $5D80 Missile shot, copied from #R$E180(its source bitmaps).
N $5D80 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E181,,2;$E180,,2;$E191,,2;$E190,,2)(slot_missile_shot) } TABLE#
S $5D80,32 Missile shot sprite, copied from #R$E180(its source bitmap)
N $5DA0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E1A1,,2;$E1A0,,2;$E1B1,,2;$E1B0,,2)(slot_missile_shot_mirror) } TABLE#
S $5DA0,32 Missile shot, mirrored, copied from #R$E1A0(its source bitmap). Nothing draws from it.
@ $5DC0 label=slot_death_burst_1
s $5DC0 Death-burst sprite slots
D $5DC0 Death-burst frames, copied from #R$E1C0(their source bitmaps).
N $5DC0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E1C1,,2;$E1C0,,2;$E1D1,,2;$E1D0,,2)(slot_death_burst_1) } TABLE#
S $5DC0,32 Death-burst frame-1 sprite, copied from #R$E1C0(its source bitmap)
@ $5DE0 label=slot_death_burst_2
N $5DE0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E1E1,,2;$E1E0,,2;$E1F1,,2;$E1F0,,2)(slot_death_burst_2) } TABLE#
S $5DE0,32 Death-burst frame-2 sprite, copied from #R$E1E0(its source bitmap)
@ $5E00 label=slot_death_burst_3
N $5E00 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E201,,2;$E200,,2;$E211,,2;$E210,,2)(slot_death_burst_3) } TABLE#
S $5E00,32 Death-burst frame-3 sprite, copied from #R$E200(its source bitmap)
@ $5E20 label=slot_death_burst_4
N $5E20 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E221,,2;$E220,,2;$E231,,2;$E230,,2)(slot_death_burst_4) } TABLE#
S $5E20,32 Death-burst frame-4 sprite, copied from #R$E220(its source bitmap)
@ $5E40 label=slot_death_burst_5
N $5E40 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E241,,2;$E240,,2;$E251,,2;$E250,,2)(slot_death_burst_5) } TABLE#
S $5E40,32 Death-burst frame-5 sprite, copied from #R$E240(its source bitmap)
@ $5E60 label=slot_death_burst_6
N $5E60 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E261,,2;$E260,,2;$E271,,2;$E270,,2)(slot_death_burst_6) } TABLE#
S $5E60,32 Death-burst frame-6 sprite, copied from #R$E260(its source bitmap)
@ $5E80 label=slot_death_burst_7
N $5E80 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E281,,2;$E280,,2;$E291,,2;$E290,,2)(slot_death_burst_7) } TABLE#
S $5E80,32 Death-burst frame-7 sprite, copied from #R$E280(its source bitmap)
@ $5EA0 label=slot_death_burst_8
N $5EA0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E2A1,,2;$E2A0,,2;$E2B1,,2;$E2B0,,2)(slot_death_burst_8) } TABLE#
S $5EA0,32 Death-burst frame-8 sprite, copied from #R$E2A0(its source bitmap)
@ $5EC0 label=slot_spawn_flash_1
s $5EC0 Spawn-flash sprite slots
D $5EC0 Spawn-flash frames, copied from #R$E2C0(their source bitmaps).
N $5EC0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E2C1,,2;$E2C0,,2;$E2D1,,2;$E2D0,,2)(slot_spawn_flash_1) } TABLE#
S $5EC0,32 Spawn-flash frame-1 sprite, copied from #R$E2C0(its source bitmap)
@ $5EE0 label=slot_spawn_flash_2
N $5EE0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E2E1,,2;$E2E0,,2;$E2F1,,2;$E2F0,,2)(slot_spawn_flash_2) } TABLE#
S $5EE0,32 Spawn-flash frame-2 sprite, copied from #R$E2E0(its source bitmap)
@ $5F00 label=slot_spawn_flash_3
N $5F00 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E301,,2;$E300,,2;$E311,,2;$E310,,2)(slot_spawn_flash_3) } TABLE#
S $5F00,32 Spawn-flash frame-3 sprite, copied from #R$E300(its source bitmap)
@ $5F20 label=slot_spawn_flash_4
N $5F20 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E321,,2;$E320,,2;$E331,,2;$E330,,2)(slot_spawn_flash_4) } TABLE#
S $5F20,1 First byte of the spawn-flash frame-4 sprite, copied from #R$E320(its source bitmap)
@ $5F21 label=nonsolid_sprite_end
B $5F21,1 First address above the pass-through sprite-data window
S $5F22,30 The rest of the #R$5F20(spawn-flash frame-4 slot), filled by the #R$8BA8(cold-init copy) from the same rows of #R$E320(its source bitmap)
@ $5F40 label=slot_ball_gem_1
s $5F40 Ball-gem sprite slots
D $5F40 Ball-gem frames, copied from #R$E340(their source bitmaps).
N $5F40 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E341,,2;$E340,,2;$E351,,2;$E350,,2)(slot_ball_gem_1) } TABLE#
S $5F40,32 Ball-gem frame-1 sprite, copied from #R$E340(its source bitmap)
@ $5F60 label=slot_ball_gem_2
N $5F60 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E361,,2;$E360,,2;$E371,,2;$E370,,2)(slot_ball_gem_2) } TABLE#
S $5F60,32 Ball-gem frame-2 sprite, copied from #R$E360(its source bitmap)
@ $5F80 label=slot_ball_gem_3
N $5F80 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E381,,2;$E380,,2;$E391,,2;$E390,,2)(slot_ball_gem_3) } TABLE#
S $5F80,32 Ball-gem frame-3 sprite, copied from #R$E380(its source bitmap)
@ $5FA0 label=slot_ball_gem_4
N $5FA0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E3A1,,2;$E3A0,,2;$E3B1,,2;$E3B0,,2)(slot_ball_gem_4) } TABLE#
S $5FA0,32 Ball-gem frame-4 sprite, copied from #R$E3A0(its source bitmap)
@ $5FC0 label=slot_hockey_mask_armed
s $5FC0 Hockey-mask sprite slots
D $5FC0 Hockey mask, armed with a comet then unarmed, copied from #R$E3C0(its source bitmaps).
N $5FC0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E3C1,,2;$E3C0,,2;$E3D1,,2;$E3D0,,2)(slot_hockey_mask_armed) } TABLE#
S $5FC0,32 Hockey-mask sprite, armed with a comet, copied from #R$E3C0(its source bitmap)
@ $5FE0 label=slot_hockey_mask_unarmed
N $5FE0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E3E1,,2;$E3E0,,2;$E3F1,,2;$E3F0,,2)(slot_hockey_mask_unarmed) } TABLE#
S $5FE0,32 Hockey-mask sprite, unarmed, copied from #R$E3E0(its source bitmap)
@ $6000 label=slot_comet_1
b $6000 Inhabitant sprite slots
D $6000 The inhabitants' sprites, filled by the #R$8BA8(cold-init copy) from #R$E400(their source bitmaps). Each sprite takes a 32-byte slot, and the label on a slot's first row names it.
D $6000 The loaded image already holds this run, byte-identical to its source bitmaps.
N $6000 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6001,,2;$6000,,2;$6011,,2;$6010,,2)(slot_comet_1) } TABLE#
B $6000,1824
@ $6020 label=slot_comet_2
N $6020 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6021,,2;$6020,,2;$6031,,2;$6030,,2)(slot_comet_2) } TABLE#
@ $6040 label=slot_comet_3
N $6040 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6041,,2;$6040,,2;$6051,,2;$6050,,2)(slot_comet_3) } TABLE#
@ $6060 label=slot_hive_1
N $6060 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6061,,2;$6060,,2;$6071,,2;$6070,,2)(slot_hive_1) } TABLE#
@ $6080 label=slot_hive_2
N $6080 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6081,,2;$6080,,2;$6091,,2;$6090,,2)(slot_hive_2) } TABLE#
@ $60A0 label=slot_hive_3
N $60A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($60A1,,2;$60A0,,2;$60B1,,2;$60B0,,2)(slot_hive_3) } TABLE#
@ $60C0 label=slot_hive_spawn_burst_1
N $60C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($60C1,,2;$60C0,,2;$60D1,,2;$60D0,,2)(slot_hive_spawn_burst_1) } TABLE#
@ $60E0 label=slot_hive_spawn_burst_2
N $60E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($60E1,,2;$60E0,,2;$60F1,,2;$60F0,,2)(slot_hive_spawn_burst_2) } TABLE#
@ $6100 label=slot_hive_spawn_burst_3
N $6100 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6101,,2;$6100,,2;$6111,,2;$6110,,2)(slot_hive_spawn_burst_3) } TABLE#
@ $6120 label=slot_ufo_1
N $6120 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6121,,2;$6120,,2;$6131,,2;$6130,,2)(slot_ufo_1) } TABLE#
@ $6140 label=slot_ufo_2
N $6140 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6141,,2;$6140,,2;$6151,,2;$6150,,2)(slot_ufo_2) } TABLE#
@ $6160 label=slot_bee_1
N $6160 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6161,,2;$6160,,2;$6171,,2;$6170,,2)(slot_bee_1) } TABLE#
@ $6180 label=slot_bee_2
N $6180 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6181,,2;$6180,,2;$6191,,2;$6190,,2)(slot_bee_2) } TABLE#
@ $61A0 label=slot_warp_gate_1
N $61A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($61A1,,2;$61A0,,2;$61B1,,2;$61B0,,2)(slot_warp_gate_1) } TABLE#
@ $61C0 label=slot_warp_gate_2
N $61C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($61C1,,2;$61C0,,2;$61D1,,2;$61D0,,2)(slot_warp_gate_2) } TABLE#
@ $61E0 label=slot_starburst_1
N $61E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($61E1,,2;$61E0,,2;$61F1,,2;$61F0,,2)(slot_starburst_1) } TABLE#
@ $6200 label=slot_starburst_2
N $6200 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6201,,2;$6200,,2;$6211,,2;$6210,,2)(slot_starburst_2) } TABLE#
@ $6220 label=slot_starburst_3
N $6220 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6221,,2;$6220,,2;$6231,,2;$6230,,2)(slot_starburst_3) } TABLE#
@ $6240 label=slot_orb_hunt
N $6240 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6241,,2;$6240,,2;$6251,,2;$6250,,2)(slot_orb_hunt) } TABLE#
@ $6260 label=slot_orb_chew_1
N $6260 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6261,,2;$6260,,2;$6271,,2;$6270,,2)(slot_orb_chew_1) } TABLE#
@ $6280 label=slot_orb_chew_2
N $6280 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6281,,2;$6280,,2;$6291,,2;$6290,,2)(slot_orb_chew_2) } TABLE#
@ $62A0 label=slot_orb_chew_3
N $62A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($62A1,,2;$62A0,,2;$62B1,,2;$62B0,,2)(slot_orb_chew_3) } TABLE#
@ $62C0 label=slot_orb_chew_4
N $62C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($62C1,,2;$62C0,,2;$62D1,,2;$62D0,,2)(slot_orb_chew_4) } TABLE#
@ $62E0 label=slot_orb_chew_5
N $62E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($62E1,,2;$62E0,,2;$62F1,,2;$62F0,,2)(slot_orb_chew_5) } TABLE#
@ $6300 label=slot_orb_chew_6
N $6300 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6301,,2;$6300,,2;$6311,,2;$6310,,2)(slot_orb_chew_6) } TABLE#
@ $6320 label=slot_orb_chew_7
N $6320 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6321,,2;$6320,,2;$6331,,2;$6330,,2)(slot_orb_chew_7) } TABLE#
@ $6340 label=slot_orb_chew_8
N $6340 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6341,,2;$6340,,2;$6351,,2;$6350,,2)(slot_orb_chew_8) } TABLE#
@ $6360 label=slot_orb_chew_9
N $6360 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6361,,2;$6360,,2;$6371,,2;$6370,,2)(slot_orb_chew_9) } TABLE#
@ $6380 label=slot_orb_chew_10
N $6380 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6381,,2;$6380,,2;$6391,,2;$6390,,2)(slot_orb_chew_10) } TABLE#
@ $63A0 label=slot_orb_chew_11
N $63A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($63A1,,2;$63A0,,2;$63B1,,2;$63B0,,2)(slot_orb_chew_11) } TABLE#
@ $63C0 label=slot_orb_chew_12
N $63C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($63C1,,2;$63C0,,2;$63D1,,2;$63D0,,2)(slot_orb_chew_12) } TABLE#
@ $63E0 label=slot_orb_spit_1
N $63E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($63E1,,2;$63E0,,2;$63F1,,2;$63F0,,2)(slot_orb_spit_1) } TABLE#
@ $6400 label=slot_orb_spit_2
N $6400 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6401,,2;$6400,,2;$6411,,2;$6410,,2)(slot_orb_spit_2) } TABLE#
@ $6420 label=slot_orb_ball
N $6420 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6421,,2;$6420,,2;$6431,,2;$6430,,2)(slot_orb_ball) } TABLE#
@ $6440 label=slot_face_monster_1
N $6440 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6441,,2;$6440,,2;$6451,,2;$6450,,2)(slot_face_monster_1) } TABLE#
@ $6460 label=slot_face_monster_2
N $6460 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6461,,2;$6460,,2;$6471,,2;$6470,,2)(slot_face_monster_2) } TABLE#
@ $6480 label=slot_face_monster_3
N $6480 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6481,,2;$6480,,2;$6491,,2;$6490,,2)(slot_face_monster_3) } TABLE#
@ $64A0 label=slot_bowling_ball_1
N $64A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($64A1,,2;$64A0,,2;$64B1,,2;$64B0,,2)(slot_bowling_ball_1) } TABLE#
@ $64C0 label=slot_bowling_ball_2
N $64C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($64C1,,2;$64C0,,2;$64D1,,2;$64D0,,2)(slot_bowling_ball_2) } TABLE#
@ $64E0 label=slot_bowling_ball_3
N $64E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($64E1,,2;$64E0,,2;$64F1,,2;$64F0,,2)(slot_bowling_ball_3) } TABLE#
@ $6500 label=slot_diamond_1
N $6500 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6501,,2;$6500,,2;$6511,,2;$6510,,2)(slot_diamond_1) } TABLE#
@ $6520 label=slot_diamond_2
N $6520 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6521,,2;$6520,,2;$6531,,2;$6530,,2)(slot_diamond_2) } TABLE#
@ $6540 label=slot_diamond_3
N $6540 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6541,,2;$6540,,2;$6551,,2;$6550,,2)(slot_diamond_3) } TABLE#
@ $6560 label=slot_diamond_4
N $6560 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6561,,2;$6560,,2;$6571,,2;$6570,,2)(slot_diamond_4) } TABLE#
@ $6580 label=slot_dart_1
N $6580 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6581,,2;$6580,,2;$6591,,2;$6590,,2)(slot_dart_1) } TABLE#
@ $65A0 label=slot_dart_2
N $65A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($65A1,,2;$65A0,,2;$65B1,,2;$65B0,,2)(slot_dart_2) } TABLE#
@ $65C0 label=slot_dart_3
N $65C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($65C1,,2;$65C0,,2;$65D1,,2;$65D0,,2)(slot_dart_3) } TABLE#
@ $65E0 label=slot_wheel_1
N $65E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($65E1,,2;$65E0,,2;$65F1,,2;$65F0,,2)(slot_wheel_1) } TABLE#
@ $6600 label=slot_wheel_2
N $6600 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6601,,2;$6600,,2;$6611,,2;$6610,,2)(slot_wheel_2) } TABLE#
@ $6620 label=slot_wheel_3
N $6620 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6621,,2;$6620,,2;$6631,,2;$6630,,2)(slot_wheel_3) } TABLE#
@ $6640 label=slot_wheel_4
N $6640 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6641,,2;$6640,,2;$6651,,2;$6650,,2)(slot_wheel_4) } TABLE#
@ $6660 label=slot_h_rotor_1
N $6660 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6661,,2;$6660,,2;$6671,,2;$6670,,2)(slot_h_rotor_1) } TABLE#
@ $6680 label=slot_h_rotor_2
N $6680 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6681,,2;$6680,,2;$6691,,2;$6690,,2)(slot_h_rotor_2) } TABLE#
@ $66A0 label=slot_h_rotor_3
N $66A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($66A1,,2;$66A0,,2;$66B1,,2;$66B0,,2)(slot_h_rotor_3) } TABLE#
@ $66C0 label=slot_h_rotor_4
N $66C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($66C1,,2;$66C0,,2;$66D1,,2;$66D0,,2)(slot_h_rotor_4) } TABLE#
@ $66E0 label=slot_h_rotor_5
N $66E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($66E1,,2;$66E0,,2;$66F1,,2;$66F0,,2)(slot_h_rotor_5) } TABLE#
@ $6700 label=slot_h_rotor_6
N $6700 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($6701,,2;$6700,,2;$6711,,2;$6710,,2)(slot_h_rotor_6) } TABLE#
@ $6720 label=unused_6720
u $6720 Unused bytes
B $6720,52
@ $6754 label=level_layouts
b $6754 Per-level brick-field slot layouts
D $6754 The brick-field layouts, 81 bytes each, one per level, in level-index order
B $6754,81,9 Level 1
B $67A5,81,9 Level 2
B $67F6,81,9 Level 3
B $6847,81,9 Level 4
B $6898,81,9 Level 5
B $68E9,81,9 Level 6
B $693A,81,9 Level 7
B $698B,81,9 Level 8
B $69DC,81,9 Level 9
B $6A2D,81,9 Level 10
B $6A7E,81,9 Level 11
B $6ACF,81,9 Level 12
B $6B20,81,9 Level 13
B $6B71,81,9 Level 14
B $6BC2,81,9 Level 15
B $6C13,81,9 Level 16
B $6C64,81,9 Level 17
B $6CB5,81,9 Level 18
B $6D06,81,9 Level 19
B $6D57,81,9 Level 20
B $6DA8,81,9 Level 21
B $6DF9,81,9 Level 22
B $6E4A,81,9 Level 23
B $6E9B,81,9 Level 24
B $6EEC,81,9 Level 25
B $6F3D,81,9 Level 26
B $6F8E,81,9 Level 27
B $6FDF,81,9 Level 28
B $7030,81,9 Level 29
B $7081,81,9 Level 30
B $70D2,81,9 Level 31
B $7123,81,9 Level 32
B $7174,81,9 Level 33
B $71C5,81,9 Level 34
B $7216,81,9 Level 35
B $7267,81,9 Level 36
B $72B8,81,9 Level 37
B $7309,81,9 Level 38
B $735A,81,9 Level 39
B $73AB,81,9 Level 40
B $73FC,81,9 Level 41
B $744D,81,9 Level 42
B $749E,81,9 Level 43
B $74EF,81,9 Level 44
B $7540,81,9 Level 45
B $7591,81,9 Level 46
B $75E2,81,9 Level 47
B $7633,81,9 Level 48
B $7684,81,9 Level 49
B $76D5,81,9 Level 50
B $7726,81,9 Level 51
B $7777,81,9 Level 52
B $77C8,81,9 Level 53
B $7819,81,9 Level 54
B $786A,81,9 Level 55
B $78BB,81,9 Level 56
B $790C,81,9 Level 57
B $795D,81,9 Level 58
B $79AE,81,9 Level 59
B $79FF,81,9 Level 60
B $7A50,81,9 Level 61
B $7AA1,81,9 Level 62
B $7AF2,81,9 Level 63
B $7B43,81,9 Level 64
B $7B94,81,9 Level 65
B $7BE5,81,9 Level 66
B $7C36,81,9 Level 67
B $7C87,81,9 Level 68
B $7CD8,81,9 Level 69
B $7D29,81,9 Level 70
B $7D7A,81,9 Level 71
B $7DCB,81,9 Level 72
B $7E1C,81,9 Level 73
B $7E6D,81,9 Level 74
B $7EBE,81,9 Level 75
B $7F0F,81,9 Level 76
B $7F60,81,9 Level 77
B $7FB1,81,9 Level 78
B $8002,81,9 Level 79
B $8053,81,9 Level 80
B $80A4,81,9 Level 81
B $80F5,81,9 Level 82
B $8146,81,9 Level 83
B $8197,81,9 Level 84
B $81E8,81,9 Level 85
B $8239,81,9 Level 86
B $828A,81,9 Level 87
B $82DB,81,9 Level 88
B $832C,81,9 Level 89
B $837D,81,9 Level 90
B $83CE,81,9 Level 91
B $841F,81,9 Level 92
B $8470,81,9 Level 93
B $84C1,81,9 Level 94
B $8512,81,9 Level 95
B $8563,81,9 Level 96
B $85B4,81,9 Level 97
B $8605,81,9 Level 98
B $8656,81,9 Level 99
B $86A7,81,9 Level 100
@ $86F8 label=spawn_cell_table
b $86F8 Per-level spawn-cell table
D $86F8 One 4-byte record per level, each byte a candidate spawn cell of the brick grid, numbered along each row in turn
D $86F8 Records run in level-index order, as in the #R$6754(brick-field layouts).
B $86F8,4,4 Level 1
B $86FC,4,4 Level 2
B $8700,4,4 Level 3
B $8704,4,4 Level 4
B $8708,4,4 Level 5
B $870C,4,4 Level 6
B $8710,4,4 Level 7
B $8714,4,4 Level 8
B $8718,4,4 Level 9
B $871C,4,4 Level 10
B $8720,4,4 Level 11
B $8724,4,4 Level 12
B $8728,4,4 Level 13
B $872C,4,4 Level 14
B $8730,4,4 Level 15
B $8734,4,4 Level 16
B $8738,4,4 Level 17
B $873C,4,4 Level 18
B $8740,4,4 Level 19
B $8744,4,4 Level 20
B $8748,4,4 Level 21
B $874C,4,4 Level 22
B $8750,4,4 Level 23
B $8754,4,4 Level 24
B $8758,4,4 Level 25
B $875C,4,4 Level 26
B $8760,4,4 Level 27
B $8764,4,4 Level 28
B $8768,4,4 Level 29
B $876C,4,4 Level 30
B $8770,4,4 Level 31
B $8774,4,4 Level 32
B $8778,4,4 Level 33
B $877C,4,4 Level 34
B $8780,4,4 Level 35
B $8784,4,4 Level 36
B $8788,4,4 Level 37
B $878C,4,4 Level 38
B $8790,4,4 Level 39
B $8794,4,4 Level 40
B $8798,4,4 Level 41
B $879C,4,4 Level 42
B $87A0,4,4 Level 43
B $87A4,4,4 Level 44
B $87A8,4,4 Level 45
B $87AC,4,4 Level 46
B $87B0,4,4 Level 47
B $87B4,4,4 Level 48
B $87B8,4,4 Level 49
B $87BC,4,4 Level 50
B $87C0,4,4 Level 51
B $87C4,4,4 Level 52
B $87C8,4,4 Level 53
B $87CC,4,4 Level 54
B $87D0,4,4 Level 55
B $87D4,4,4 Level 56
B $87D8,4,4 Level 57
B $87DC,4,4 Level 58
B $87E0,4,4 Level 59
B $87E4,4,4 Level 60
B $87E8,4,4 Level 61
B $87EC,4,4 Level 62
B $87F0,4,4 Level 63
B $87F4,4,4 Level 64
B $87F8,4,4 Level 65
B $87FC,4,4 Level 66
B $8800,4,4 Level 67
B $8804,4,4 Level 68
B $8808,4,4 Level 69
B $880C,4,4 Level 70
B $8810,4,4 Level 71
B $8814,4,4 Level 72
B $8818,4,4 Level 73
B $881C,4,4 Level 74
B $8820,4,4 Level 75
B $8824,4,4 Level 76
B $8828,4,4 Level 77
B $882C,4,4 Level 78
B $8830,4,4 Level 79
B $8834,4,4 Level 80
B $8838,4,4 Level 81
B $883C,4,4 Level 82
B $8840,4,4 Level 83
B $8844,4,4 Level 84
B $8848,4,4 Level 85
B $884C,4,4 Level 86
B $8850,4,4 Level 87
B $8854,4,4 Level 88
B $8858,4,4 Level 89
B $885C,4,4 Level 90
B $8860,4,4 Level 91
B $8864,4,4 Level 92
B $8868,4,4 Level 93
B $886C,4,4 Level 94
B $8870,4,4 Level 95
B $8874,4,4 Level 96
B $8878,4,4 Level 97
B $887C,4,4 Level 98
B $8880,4,4 Level 99
B $8884,4,4 Level 100
@ $8888 label=wave_scripts
b $8888 Per-level wave/spawn scripts
D $8888 One 8-byte wave script per level, in level-index order as in the #R$6754(brick-field layouts). Each byte is an object type, the index into the #R$CC56(behavior handler table). A 0 spawns nothing.
B $8888,8,8 Level 1
B $8890,8,8 Level 2
B $8898,8,8 Level 3
B $88A0,8,8 Level 4
B $88A8,8,8 Level 5
B $88B0,8,8 Level 6
B $88B8,8,8 Level 7
B $88C0,8,8 Level 8
B $88C8,8,8 Level 9
B $88D0,8,8 Level 10
B $88D8,8,8 Level 11
B $88E0,8,8 Level 12
B $88E8,8,8 Level 13
B $88F0,8,8 Level 14
B $88F8,8,8 Level 15
B $8900,8,8 Level 16
B $8908,8,8 Level 17
B $8910,8,8 Level 18
B $8918,8,8 Level 19
B $8920,8,8 Level 20
B $8928,8,8 Level 21
B $8930,8,8 Level 22
B $8938,8,8 Level 23
B $8940,8,8 Level 24
B $8948,8,8 Level 25
B $8950,8,8 Level 26
B $8958,8,8 Level 27
B $8960,8,8 Level 28
B $8968,8,8 Level 29
B $8970,8,8 Level 30
B $8978,8,8 Level 31
B $8980,8,8 Level 32
B $8988,8,8 Level 33
B $8990,8,8 Level 34
B $8998,8,8 Level 35
B $89A0,8,8 Level 36
B $89A8,8,8 Level 37
B $89B0,8,8 Level 38
B $89B8,8,8 Level 39
B $89C0,8,8 Level 40
B $89C8,8,8 Level 41
B $89D0,8,8 Level 42
B $89D8,8,8 Level 43
B $89E0,8,8 Level 44
B $89E8,8,8 Level 45
B $89F0,8,8 Level 46
B $89F8,8,8 Level 47
B $8A00,8,8 Level 48
B $8A08,8,8 Level 49
B $8A10,8,8 Level 50
B $8A18,8,8 Level 51
B $8A20,8,8 Level 52
B $8A28,8,8 Level 53
B $8A30,8,8 Level 54
B $8A38,8,8 Level 55
B $8A40,8,8 Level 56
B $8A48,8,8 Level 57
B $8A50,8,8 Level 58
B $8A58,8,8 Level 59
B $8A60,8,8 Level 60
B $8A68,8,8 Level 61
B $8A70,8,8 Level 62
B $8A78,8,8 Level 63
B $8A80,8,8 Level 64
B $8A88,8,8 Level 65
B $8A90,8,8 Level 66
B $8A98,8,8 Level 67
B $8AA0,8,8 Level 68
B $8AA8,8,8 Level 69
B $8AB0,8,8 Level 70
B $8AB8,8,8 Level 71
B $8AC0,8,8 Level 72
B $8AC8,8,8 Level 73
B $8AD0,8,8 Level 74
B $8AD8,8,8 Level 75
B $8AE0,8,8 Level 76
B $8AE8,8,8 Level 77
B $8AF0,8,8 Level 78
B $8AF8,8,8 Level 79
B $8B00,8,8 Level 80
B $8B08,8,8 Level 81
B $8B10,8,8 Level 82
B $8B18,8,8 Level 83
B $8B20,8,8 Level 84
B $8B28,8,8 Level 85
B $8B30,8,8 Level 86
B $8B38,8,8 Level 87
B $8B40,8,8 Level 88
B $8B48,8,8 Level 89
B $8B50,8,8 Level 90
B $8B58,8,8 Level 91
B $8B60,8,8 Level 92
B $8B68,8,8 Level 93
B $8B70,8,8 Level 94
B $8B78,8,8 Level 95
B $8B80,8,8 Level 96
B $8B88,8,8 Level 97
B $8B90,8,8 Level 98
B $8B98,8,8 Level 99
B $8BA0,8,8 Level 100
@ $8BA8 label=game_entry
c $8BA8 Program entry and the main per-frame loop
D $8BA8 Execution starts here, and the game never hands back. Setup runs once, then the front end, then a level's screen, then the frame loop.
D $8BA8 A cleared level, a spent last life or a confirmed quit sends control back around that ring.
  $8BA8 A leftover source marker: these three bytes spell "end" as opcodes and run harmlessly before the real start.
  $8BAB Interrupts stay off, except for #R$BD99(the front end's one-frame wait). The stack sits at the top of RAM. The main loop is not HALT-synced.
  $8BAF Copy the source bank – the canonical sprite bitmaps – into the sprite bank in the system-variable area. Play draws from the sprite bank, and the source page is reused as the back buffer.
  $8BBA Seed the pool entry count that bounds the per-frame object walk.
@ $8BBF label=new_game
N $8BBF New game / restart entry. Runs the front end, then the full new-game initialization, then falls into per-level setup.
  $8BC8 Paint every attribute cell white-on-black.
  $8BCD Black border
@ $8BD0 label=setup_level
N $8BD0 Per-level screen setup. It clears the work buffers and play state, draws the playfield border and composes the level's brick field, and renders the tile map. It then draws the lives, level-number, and score readouts. Falls into the per-frame loop.
  $8BD3,5 Plant the terminator that ends the work-buffer scans of #R$BB38(the cell recomposer) and #R$BBA4(the dirty-cell blitter), in the first cell of the bottom character row. That cell is drawable, and an object that reaches it stamps the terminator away – see #LINK(Defects#scramble)(Scramble).
@ $8BD5 isub=LD (WORKBUF_FB+$2E0),A
@ $8BD5 nowarn
@ $8BED label=frame_loop
N $8BED Top of the per-frame loop (also the loop-back target). While the #R$5B4F(expand prize) is in effect, the loop stages the expanded bat for this frame in the #R$8F67(object pool). A grow or shrink animation holds that off, so the #R$5B64(grow flag) and the #R$5B65(shrink flag) must both be zero. This stage activates the extension and limits how low the expanded bat may sit. It seeds the extension's position from the bat's. It aims the bat's sprite at the top half of the #R$5D20(expanded-bat sprites), and the extension's at the bottom half.
  $8BED Stage the expanded bat only while the bat is expanded.
  $8BF3 The grow animation holds it off while it runs.
  $8BF9 So does the shrink animation.
  $8C04 Clamp the bat's Y to the bat's lowest expanded position.
  $8C0B At or below that line on screen, pin it there.
@ $8C10 label=seed_bat_extension
  $8C10 Seed the extension's position from the bat's and aim both at their sprites.
@ $8C26 label=idle_track
N $8C26 Anti-stuck nudge. Monitors ball A's on-screen position. If ball A stays within 16 pixels of the saved position on both axes for 30 consecutive frames, the nudge fires. The box reaches 15 pixels on one side and 16 on the other. It turns #R$A150(ball A's heading) half a turn around to break the stuck rally. When the ball moves out of the box, or the nudge fires, the routine saves the new position and resets the idle counter.
  $8C26 Take ball A's position and how far its X moved from the saved position.
  $8C30 Fold a negative difference. CPL leaves one less than its magnitude, so the box reaches a pixel further on that side.
@ $8C31 label=idle_check_dx
  $8C31 Moved far enough across, so the rally is not stuck.
  $8C35 Measure the Y difference the same way.
  $8C3C Fold the Y difference the same way, one short again.
@ $8C3D label=idle_eval_dy
  $8C3D Moved far enough on Y either way, so the rally is not stuck.
  $8C41 Inside the box on both axes: count one more idle frame, and act once the count reaches its limit.
  $8C4C Flip ball A's heading by a half-turn to break the rally.
  $8C55 A heading that fell below the range wraps back up.
@ $8C57 label=idle_wrap_dir
  $8C57 Store the flipped heading.
@ $8C5A label=idle_save
  $8C5A Remember where the ball is and clear the idle count. The ball moved, or the nudge fired.
@ $8C61 label=frame_pipeline
N $8C61 Per-frame subsystem pipeline. Runs each update in the fixed order of the stages below. The end-of-frame state checks come last.
  $8C61 Stage 1: sample the player's controls into the #R$BC23(control bitfield).
  $8C64 Stage 2: advance every ball – motion, wall and bat bounce, brick hits.
  $8C67 Stage 3: animate the prize / effect objects.
  $8C6A Stage 4: move the bat from the sampled control.
  $8C6D Stage 5: run the inhabitants' behaviors.
  $8C70 Stage 6: sweep the brick field, play queued break animations and detect a cleared level.
  $8C73 Stage 7: retire a ball that fell past the bat's losing edge (drives life loss).
  $8C76 Stage 8: spawn objects scheduled by the current wave script.
  $8C79 Stage 9: spawn the wheel swarm into the free inhabitant slots.
  $8C7C Stage 10: animate the safety net barrier's color flash.
  $8C7F Stage 11: fold pending points into the displayed score.
  $8C82 Stage 12: grant a bonus life when the score passes a milestone.
  $8C85 Stage 13: poll the pause key; a press freezes the loop until the next press.
  $8C88 Stage 14: update and redraw all active objects.
  $8C8B Stage 15: advance the seven sound-effect players.
@ $8CA0 isub=LD A,(orb_spit_timer)
  $8CA0 Stage 16: tick the orb-spit sound delay and play the #R$B884(orb-spit sound) on the tick before it runs out.
@ $8CA7 isub=LD (orb_spit_timer),A
@ $8CAF label=poll_quit
  $8CAF Stage 17: poll the quit key (Q opens the are-you-sure dialog).
N $8CB2 Stage 18: prize-reveal tune sequencer. Once armed it plays the prize-reveal tune one note per frame through #R$D568(the tune player), and stops at the tune's terminator.
  $8CB8 On the tune's first active frame, aim the tune pointer at it.
@ $8CC2 label=tune_play
  $8CC2 Emit this frame's note; the terminator clears the state and stops the tune.
@ $8CCF label=tune_advance
  $8CCF Otherwise bump the state, so the tune pointer is aimed only once.
@ $8CD3 label=frame_end_checks
N $8CD3 End-of-frame state checks. Once the #R$5B68(death pause) reaches 60 the life is over. With no #R$8E9D(lives) left, play goes to #R$8D38(game over). Otherwise play returns to the #R$8BED(top of the frame loop), unless an active warp or the #R$5B6A(level-cleared flag) diverts it to the #R$8CFA(level-advance handler).
  $8CD3 The death pause ran its course, so the life is over. With no lives left, the game ends.
@ $8CE0 label=check_warp_countdown
N $8CE0 While a warp runs, the main loop advances one level per frame until the #R$8EA7(warp countdown) runs out, then clears the #R$8EA6(warp flag). A warp thus jumps the player forward 1 to 4 levels.
  $8CE0 When no warp runs, there is nothing to advance.
  $8CE6 Count the warp down, and divert to the level-advance handler until it runs out.
  $8CEE Countdown spent: clear the warp and fall through.
@ $8CF3 label=check_level_cleared
  $8CF3 No level cleared: loop back to the frame top for the next frame.
@ $8CFA label=level_complete
N $8CFA Level cleared. After a pause it awards a level-clear bonus of 100 points per step of the level index #R$8E9C, capped at 2500, then advances the index. An index that reaches 50 or 100 speeds up the rally: it lowers #R$8EA5 by 3, with a floor of 2. At 100 the index also wraps back to 0 at #R$8D27. Re-enters #R$8BD0 for the next level.
  $8D00 Clamp the level index before the bonus calculation.
  $8D07 Above that, the bonus grows no more.
@ $8D09 label=level_bonus_calc
  $8D09 Multiply the clamped index by ten, ready for the score's own ten-times commit.
@ $8D10 label=level_bonus_loop
@ $8D27 label=wrap_level_index
N $8D27 Wrap the level index back to 0. The #R$6754(brick-field layouts), #R$86F8(spawn cells) and #R$8888(wave scripts) hold 100 records each, one per level. They therefore repeat from here. The displayed level in the #R$B770(level caption) does not restart with it.
  $8D27 The hundredth clear wraps the index back to the first layout.
@ $8D29 label=speed_up_rally
  $8D29 Shorten the rally interval a step, down to a floor of two.
@ $8D35 label=next_level
  $8D35 Set up the next level's screen.
@ $8D38 isub=LD HL,SCREEN_BASE+$84C
@ $8D38 label=game_over
N $8D38 Game over. Draws the GAME OVER banner with #R$987B(the double-height printer) and plays the game-over tune to its $0D terminator. It then runs the #R$B412(high-score check) to test and enter the score. Plays the title tune while it waits for fire, any key or the tune's end, then restarts at the #R$8BBF(new-game entry).
  $8D38 Print the two GAME OVER lines and aim the tune pointer at the game-over tune.
@ $8D43 isub=LD HL,SCREEN_BASE+$88C
@ $8D54 label=game_over_tune_play
  $8D54 Play the tune a note per pass until its terminator.
  $8D5B Pause between notes.
@ $8D63 label=game_over_pause
  $8D63 The tune reached its terminator. Two full-length delays run, then the #R$B412(high-score check) offers the score to the table and the #R$D566(tune pointer) takes the title tune.
@ $8D75 label=await_restart
N $8D75 Wait for restart. Loop the title tune until its terminator, any key, or fire. Any of the three restarts a new game at the #R$8BBF(new-game entry).
  $8D75 When the title tune reaches its terminator, the game restarts on its own.
  $8D83 Any key restarts the game, because the port read selects every keyboard half-row.
  $8D8F Fire restarts the game.
@ $8D9C label=handle_quit_confirm
c $8D9C Quit-confirmation handler (per-frame)
D $8D9C Offers the ARE YOU SURE Y-N? prompt when Q is pressed, and abandons the game on Y. The prompt blocks the frame until the player answers.
N $8D9C Q held: #R$B77C(blip) to acknowledge, then draw the two-line prompt beside the bat. Its column comes from the #R$8E9E(bat side), so the text lands on the wall the bat occupies.
N $8D9C Wait for Q to be released, then poll the Y and N keys until one answers. Y discards the call stack and jumps to the restart entry. N erases the prompt and returns.
N $8D9C The prompt is two single-height font lines one character row apart. The N-key path erases both at once with a single #R$987B(double-height) blank string.
  $8D9C Return unless the Q key is held this frame.
  $8DA1 Blip to acknowledge the Q press.
  $8DA4 Pick the prompt's line-1 cell so it sits on the bat's side: the bat on the left takes column 2.
@ $8DAA isub=LD HL,SCREEN_BASE+$882
@ $8DAF isub=LD HL,SCREEN_BASE+$894
  $8DAF A zero side takes column 20 instead.
  $8DB2 Keep the line-1 cell for line 2 and the later erase.
  $8DB3 Print line 1 in bright white on black.
  $8DBB Reload the line-1 cell and keep it saved.
  $8DBD Step down one character row (32 cells) to line 2.
  $8DC1 Print line 2.
@ $8DC9 label=wait_q_release
  $8DC9 Wait for the Q key to be released before it reads the answer.
@ $8DCF label=poll_quit_answer
@ $8DCF isub=LD BC,KBD_ROW_Y_P
  $8DCF Read the P-Y keyboard half-row and keep the 5 key bits.
  $8DD6 Bit 4 is the Y key (0 when pressed).
  $8DD8 Y up: go test the N key.
  $8DDA Y pressed: blip to confirm the quit.
  $8DDD Discard the saved cell and the caller's return address – the call chain is abandoned.
  $8DDF Restart a fresh game from the restart entry.
@ $8DE2 label=poll_quit_no_key
  $8DE2 Switch BC to the B-Space half-row and keep the 5 key bits.
  $8DE8 Bit 3 is the N key (0 when pressed).
  $8DEA Neither Y nor N pressed: poll again for an answer.
  $8DEC N pressed: blip and resume play.
  $8DEF Recover the line-1 cell, then erase both lines with one double-height blank.
  $8DF8
@ $8DF9 label=poll_quit_key
c $8DF9 Poll the quit key (Q)
D $8DF9 Reads the Q key for the #R$8D9C(quit handler). That handler uses it both to raise the prompt and to wait for the key's release.
R $8DF9 O:A 1 if the Q key is held, 0 otherwise
  $8DF9 Read the Q-T keyboard half-row and keep the 5 key bits.
  $8E00 Bit 0 is the Q key (0 when pressed).
  $8E02 Q up: return 0.
  $8E04 Q held: report it pressed.
  $8E06
@ $8E07 label=quit_key_up
  $8E07 Q not held: return 0.
  $8E08
@ $8E09 label=msg_are_you_sure
t $8E09 Quit confirmation prompt
D $8E09 The text of the #R$8D9C(quit dialog): two lines, and a blank that erases them.
T $8E09,8,7:1 Line 1
@ $8E11 label=msg_sure_yn
T $8E11,10,9:1 Line 2
@ $8E1B label=msg_sure_pad
T $8E1B,10,9:1 The blank that overprints both lines
@ $8E25 label=handle_pause
c $8E25 Pause control (per-frame)
D $8E25 Freezes play on the pause key and shows the PAUSED banner.
D $8E25 The freeze is a busy-wait inside the frame chain. The balls, the inhabitants and the sound all hold still until the player resumes.
N $8E25 Key 1 both pauses and resumes: the first press pauses, the next press resumes.
N $8E25 The banner sits on the bat's side at character row 12, printed double-height in bright yellow on blue. Its column comes from the #R$8E9E(bat side).
N $8E25 The resume runs in three debounced phases. Spin while key 1 is still held, spin until it is pressed again, then spin while that press is held.
N $8E25 #R$8E7B(Blanks) overprint the banner, with a black-paper attribute over the same cells.
  $8E25 Poll key 1; with it up, return at once and let the frame run.
  $8E2A Blip to acknowledge the pause.
  $8E2D Read the bat side: 0 selects the right edge, non-zero the left.
@ $8E33 isub=LD HL,SCREEN_BASE+$882
  $8E33 Bat on the left: banner at column 2, row 12.
@ $8E38 isub=LD HL,SCREEN_BASE+$896
@ $8E38 label=pause_banner_right
  $8E38 Bat on the right: banner at column 22, row 12.
@ $8E3B label=pause_draw_banner
  $8E3B Save the banner address for the later erase.
  $8E3C Print double-height PAUSED in bright yellow on blue.
@ $8E44 label=pause_wait_release
  $8E44 Spin while key 1 is held: clear the pause press.
@ $8E4A label=pause_wait_resume
  $8E4A Spin until key 1 is pressed again: the resume press.
  $8E50 Blip to acknowledge the resume.
  $8E53 Recover the banner address.
  $8E54 Overprint blanks to erase the banner (bright white ink on black paper).
@ $8E5C label=pause_resume_release
  $8E5C Spin while key 1 is held: clear the resume press, then return.
  $8E62
@ $8E63 label=poll_pause_key
c $8E63 Poll the pause key (1)
D $8E63 Reads key 1, the only input to the #R$8E25(pause control).
R $8E63 O:A 1 if key 1 is held, 0 otherwise
  $8E63 Read the keyboard half-row that holds keys 1 to 5 and keep the five key bits.
  $8E6A Test key 1; active-low, so a set bit means the key is up.
  $8E6E Key down: report it pressed.
  $8E70
@ $8E71 label=pause_key_up
  $8E71 Key up: return 0.
  $8E72
@ $8E73 label=msg_paused
t $8E73 Pause banner
D $8E73 The text of the banner that the #R$8E25(pause control) shows, and a blank that erases it.
T $8E73,8,7:1 The banner
@ $8E7B label=msg_paused_erase
T $8E7B,8,7:1 The blank that overprints the banner
@ $8E83 label=msg_game_over
t $8E83 GAME OVER
T $8E83,6,5:1
@ $8E89 label=msg_over
T $8E89,6,5:1
@ $8E8F label=idle_ball_x
g $8E8F Anti-stuck idle tracker for ball A
D $8E8F Ball A's last recorded position and its idle frame count
B $8E8F,1 Last ball A X
@ $8E90 label=idle_ball_y
B $8E90,1 Last ball A Y
@ $8E91 label=idle_frame_count
B $8E91,1 Frames the ball stayed within 16 pixels of its saved position
@ $8E92 label=clear_buffers
c $8E92 Clear the work buffers
D $8E92 Clears the back buffer, the tile map and the dirty counters before a new screen.
  $8E9B
@ $8E9C label=level
g $8E9C Current level and lives in hand
D $8E9C The level in play and the lives the player has left.
B $8E9C,1 Level index, 0 to 99
@ $8E9D label=lives
B $8E9D,1 Lives in hand: 3 at the start, at most 25
@ $8E9E label=bat_side
g $8E9E Options-screen settings
D $8E9E The options-screen choices. The INERTIA rate has #R$8EA4(its own entry).
B $8E9E,1 Bat side: 0 for right, 1 for left
@ $8E9F label=sound_fx
B $8E9F,1 SOUND FX: 0 for off, 1 for on
@ $8EA0 label=ball_speed
B $8EA0,1 BALL SPEED, 1 to 6: a ball's move passes per frame
@ $8EA1 label=bat_control_type
B $8EA1,1 CONTROL TYPE: 0 for inertia, 1 or 2 for direct control
@ $8EA2 label=bat_speed_slow
B $8EA2,1 DUAL SPEED SLOW: the bat's step in pixels per frame, 1 to 9, default 3
@ $8EA3 label=bat_speed_fast
B $8EA3,1 DUAL SPEED FAST: the bat's step while fire is held, 1 to 8, default 5
@ $8EA4 label=inertia_accel
g $8EA4 Inertia ramp rate
D $8EA4 The INERTIA option, 1 to 9: the per-frame gain of the #R$5B73(inertia accumulator)
B $8EA4,1
@ $8EA5 label=rally_accel_interval
g $8EA5 Rally acceleration interval
D $8EA5 Bounces per ball-speed step.
B $8EA5,1 2 to 20
@ $8EA6 label=warp_active_flag
g $8EA6 Warp level-skip state
D $8EA6 A warp in progress.
B $8EA6,1 Warp: 1 while a warp skips levels, 0 otherwise
@ $8EA7 label=warp_countdown
B $8EA7,1 Warp countdown: loaded with 2 to 5, counted down to 0
@ $8EA8 label=clear_state_buffers
c $8EA8 Reset the play state for a new game or level
D $8EA8 Zeroes the three play-state RAM blocks, then re-arms the object pool to serve a ball.
D $8EA8 On return every play flag, both ball state records and the brick state map read 0. The re-arm then sets ball A's speed and serve flag. The bat and ball are positioned for the current side.
  $8EA8 Clear both ball state records and every per-frame play-state flag before the pool is re-armed below.
  $8EB5 Clear the brick state map: a new level starts with every slot settled and no break animation in progress. The fill covers the map and the byte after it, the first entry of the #R$AB1B(durability-class table). The image already holds that entry clear, so the class table survives unchanged.
@ $8EB8 isub=LD DE,brick_state_map+$1
  $8EC2,13 Clear the logic records for the secondary object and the five inhabitants so none is active when the pool is re-armed below. The fill covers the six records and the byte after them, the first entry of the #R$CB8C(steer table), which it clears. The #R$C7E8(wall-avoid probe) reads that entry, and nothing restores it.
@ $8EC5 isub=LD DE,obj2_record+$1
@ $8ED3 label=init_game_vars
c $8ED3 Initialize the score and game counters for a new game
D $8ED3 Sets the start-of-game baseline. The score and the level index go to 0 and lives to 3. Every carried-over flag, marker and timer goes back to its default.
  $8ED3 Seed the lives addend. The lives count below adds it to 2, which gives 3 lives at the start.
  $8ED5 Fill the on-screen score digits with ASCII '0' and set bit 7 of the last digit as the print-string terminator. The score reads 0.
  $8EE2 Reset the three digit cells of the #R$B770(level caption) to '0'. Two are ASCII '0', and the third is a game-font '0' whose bit 7 terminates the print string. This resets the hundreds cell, which is what starts the displayed level over at 1 for a new game.
  $8EED Reset the extra-life milestone marker to '0'. It is the saved ten-thousands score digit. The #R$B5FB(extra-life award) compares the live score against it, to award one life per 10000 points.
  $8EF2 The level index starts at 0, the first level.
  $8EF6 Start the game with 3 #R$8E9D(lives).
  $8EFD Clear the warp flag and its countdown: a new game starts with no warp in progress.
  $8F04,5 Restore the rally-acceleration interval to its start-of-game default: bounces per ball-speed step.
@ $8F0A label=rearm_serve
c $8F0A Re-arm the object pool to serve a ball
D $8F0A Positions the bat and the ball for the current side and leaves only their two pool slots active.
  $8F0A Pick the bat and ball start positions for the current bat side.
@ $8F10 nowarn
  $8F10 The right-hand side puts them against that edge.
@ $8F13 nowarn
@ $8F18 nowarn
  $8F18 The left-hand side puts them against the other.
@ $8F1B nowarn
  $8F1E Either way, store the pair into the pool's first two slots.
  $8F25 Point the bat and ball slots at their sprite data.
  $8F31 Load the ball's speed from the options screen, clear its bounce count and both step thresholds, and raise the serve flag.
  $8F45 Clear the active flag on all nine pool slots.
  $8F58,14 Re-activate the bat and ball A.
@ $8F67 label=object_count
g $8F67 Object pool
D $8F67 The object pool: a count byte, then 9-byte sprite records. A record holds the sprite's position, its sprite pointer and its active flag.
B $8F67,1 Pool entry count
@ $8F68 label=object_table
B $8F68,1 Bat pixel X
@ $8F69 label=bat_y
B $8F69,1 Bat pixel Y
B $8F6A,4 Bat record: the four bytes after the pixel X and Y
@ $8F6E label=bat_sprite_ptr
W $8F6E,2 Bat sprite-data pointer
B $8F70,1 Bat active flag
@ $8F71 label=ball_a_object
B $8F71,6 Ball A record head: the pixel X and Y, and the four bytes after them
@ $8F77 label=ball_a_sprite_ptr
W $8F77,2 Ball A sprite-data pointer
B $8F79,1 Ball A active flag
@ $8F7A label=obj2_object
B $8F7A,1 Secondary object pixel X
@ $8F7B label=obj2_y
B $8F7B,1 Secondary object pixel Y
B $8F7C,4 Secondary object's sprite record: the four bytes after the pixel X and Y
@ $8F80 label=obj2_sprite_ptr
W $8F80,2 Secondary object sprite-data pointer
@ $8F82 label=obj2_active
B $8F82,1 Secondary object active flag
@ $8F83 label=inhabitant_objects
B $8F83,45,9 Sprite records for the five inhabitants, in the layout above. Each inhabitant also has a #R$CB3C(logic record).
@ $8FB0 label=bat_ext_object
B $8FB0,1 Bat extension pixel X, the segment attached to the expanded bat
@ $8FB1 label=bat_ext_y
B $8FB1,1 Bat extension pixel Y
B $8FB2,4 Bat extension record: the four bytes after the pixel X and Y
@ $8FB6 label=bat_ext_sprite_ptr
W $8FB6,2 Bat extension sprite-data pointer
@ $8FB8 label=bat_ext_active
B $8FB8,1 Bat extension active flag
@ $8FB9 label=font_glyphs
b $8FB9 Game font glyphs
D $8FB9 The game font, 8 bytes per glyph, for the printable characters in character-code order
N $8FB9 #UDGTABLE(font-chart) { =h | =h 0 | =h 1 | =h 2 | =h 3 | =h 4 | =h 5 | =h 6 | =h 7 | =h 8 | =h 9 | =h A | =h B | =h C | =h D | =h E | =h F } { =h $2_ | #FONT$8FB9,1,71,3,tindex=1,alpha=0(font_glyph_20) | #FONT$8FC1,1,71,3,tindex=1,alpha=0(font_glyph_21) | #FONT$8FC9,1,71,3,tindex=1,alpha=0(font_glyph_22) | #FONT$8FD1,1,71,3,tindex=1,alpha=0(font_glyph_23) | #FONT$8FD9,1,71,3,tindex=1,alpha=0(font_glyph_24) | #FONT$8FE1,1,71,3,tindex=1,alpha=0(font_glyph_25) | #FONT$8FE9,1,71,3,tindex=1,alpha=0(font_glyph_26) | #FONT$8FF1,1,71,3,tindex=1,alpha=0(font_glyph_27) | #FONT$8FF9,1,71,3,tindex=1,alpha=0(font_glyph_28) | #FONT$9001,1,71,3,tindex=1,alpha=0(font_glyph_29) | #FONT$9009,1,71,3,tindex=1,alpha=0(font_glyph_2a) | #FONT$9011,1,71,3,tindex=1,alpha=0(font_glyph_2b) | #FONT$9019,1,71,3,tindex=1,alpha=0(font_glyph_2c) | #FONT$9021,1,71,3,tindex=1,alpha=0(font_glyph_2d) | #FONT$9029,1,71,3,tindex=1,alpha=0(font_glyph_2e) | #FONT$9031,1,71,3,tindex=1,alpha=0(font_glyph_2f) } { =h $3_ | #FONT$9039,1,71,3,tindex=1,alpha=0(font_glyph_30) | #FONT$9041,1,71,3,tindex=1,alpha=0(font_glyph_31) | #FONT$9049,1,71,3,tindex=1,alpha=0(font_glyph_32) | #FONT$9051,1,71,3,tindex=1,alpha=0(font_glyph_33) | #FONT$9059,1,71,3,tindex=1,alpha=0(font_glyph_34) | #FONT$9061,1,71,3,tindex=1,alpha=0(font_glyph_35) | #FONT$9069,1,71,3,tindex=1,alpha=0(font_glyph_36) | #FONT$9071,1,71,3,tindex=1,alpha=0(font_glyph_37) | #FONT$9079,1,71,3,tindex=1,alpha=0(font_glyph_38) | #FONT$9081,1,71,3,tindex=1,alpha=0(font_glyph_39) | #FONT$9089,1,71,3,tindex=1,alpha=0(font_glyph_3a) | #FONT$9091,1,71,3,tindex=1,alpha=0(font_glyph_3b) | #FONT$9099,1,71,3,tindex=1,alpha=0(font_glyph_3c) | #FONT$90A1,1,71,3,tindex=1,alpha=0(font_glyph_3d) | #FONT$90A9,1,71,3,tindex=1,alpha=0(font_glyph_3e) | #FONT$90B1,1,71,3,tindex=1,alpha=0(font_glyph_3f) } { =h $4_ | #FONT$90B9,1,71,3,tindex=1,alpha=0(font_glyph_40) | #FONT$90C1,1,71,3,tindex=1,alpha=0(font_glyph_41) | #FONT$90C9,1,71,3,tindex=1,alpha=0(font_glyph_42) | #FONT$90D1,1,71,3,tindex=1,alpha=0(font_glyph_43) | #FONT$90D9,1,71,3,tindex=1,alpha=0(font_glyph_44) | #FONT$90E1,1,71,3,tindex=1,alpha=0(font_glyph_45) | #FONT$90E9,1,71,3,tindex=1,alpha=0(font_glyph_46) | #FONT$90F1,1,71,3,tindex=1,alpha=0(font_glyph_47) | #FONT$90F9,1,71,3,tindex=1,alpha=0(font_glyph_48) | #FONT$9101,1,71,3,tindex=1,alpha=0(font_glyph_49) | #FONT$9109,1,71,3,tindex=1,alpha=0(font_glyph_4a) | #FONT$9111,1,71,3,tindex=1,alpha=0(font_glyph_4b) | #FONT$9119,1,71,3,tindex=1,alpha=0(font_glyph_4c) | #FONT$9121,1,71,3,tindex=1,alpha=0(font_glyph_4d) | #FONT$9129,1,71,3,tindex=1,alpha=0(font_glyph_4e) | #FONT$9131,1,71,3,tindex=1,alpha=0(font_glyph_4f) } { =h $5_ | #FONT$9139,1,71,3,tindex=1,alpha=0(font_glyph_50) | #FONT$9141,1,71,3,tindex=1,alpha=0(font_glyph_51) | #FONT$9149,1,71,3,tindex=1,alpha=0(font_glyph_52) | #FONT$9151,1,71,3,tindex=1,alpha=0(font_glyph_53) | #FONT$9159,1,71,3,tindex=1,alpha=0(font_glyph_54) | #FONT$9161,1,71,3,tindex=1,alpha=0(font_glyph_55) | #FONT$9169,1,71,3,tindex=1,alpha=0(font_glyph_56) | #FONT$9171,1,71,3,tindex=1,alpha=0(font_glyph_57) | #FONT$9179,1,71,3,tindex=1,alpha=0(font_glyph_58) | #FONT$9181,1,71,3,tindex=1,alpha=0(font_glyph_59) | #FONT$9189,1,71,3,tindex=1,alpha=0(font_glyph_5a) |  |  |  |  |  } TABLE#
N $8FB9 Some glyphs draw something other than the character their code stands for:
N $8FB9 #UDGTABLE { =h Code | =h Glyph | =h What it is | =h Where it is used } { $23 | #FONT$8FD1,1,71,3,tindex=1,alpha=0(font_glyph_23) | The top half of the bat | The top cell of the #R$B306(lives icon) } { $24 | #FONT$8FD9,1,71,3,tindex=1,alpha=0(font_glyph_24) | A bar along the bottom of the cell | The #R$B766(name buffer) shows this cell for a slot still empty. } { $25 | #FONT$8FE1,1,71,3,tindex=1,alpha=0(font_glyph_25) | The bottom half of the bat | The bottom cell of the lives icon } { $26 | #FONT$8FE9,1,71,3,tindex=1,alpha=0(font_glyph_26) | A lower-case alpha | Each ampersand in the #R$C443(credits scroll) } { $28 | #FONT$8FF9,1,71,3,tindex=1,alpha=0(font_glyph_28) | A left arrow | The DELETE cell of the #R$B656(name-entry strip), on which a fire press #R$B528(deletes the last letter) } { $29 | #FONT$9001,1,71,3,tindex=1,alpha=0(font_glyph_29) | The word END squeezed into one cell | The END cell of the strip, on which a fire press #R$B4E8(finishes the name) } { $40 | #FONT$90B9,1,71,3,tindex=1,alpha=0(font_glyph_40) | The copyright sign | The menu's #R$BEDF(credit line) } TABLE#
B $8FB9,472,8
@ $9191 label=brick_attrs
b $9191 Brick attribute byte per slot code
D $9191 One screen-attribute byte per brick slot code, indexed by the code: the color of the slot's 2×2 block
B $9191,1,1
  $9191 Empty slot
B $9192,3,3
  $9192 The golden brick and the two silver bricks
B $9195,133,7
  $9195 Glue prize brick
  $919C Missile prize brick
  $91A3 Expand prize brick
  $91AA Safety net prize brick
  $91B1 Bomb prize brick
  $91B8 Double bat prize brick
  $91BF Extra life prize brick
  $91C6 Double score prize brick
  $91CD Slow ball prize brick
  $91D4 Solid brick
  $91DB Solid brick
  $91E2 Window brick
  $91E9 Rounded brick
  $91F0 Ornate brick
  $91F7 Angry-face brick
  $91FE Hatched brick
  $9205 No design
  $920C No design
  $9213 Third solid brick
@ $921A label=brick_tile_groups
b $921A Brick tile-glyph groups
D $921A Four tile codes per brick slot code. They are the slot's 2×2 block in row order, top-left first.
D $921A The colored designs come in groups of seven, one per ink. The inks run blue, red, magenta, green, cyan, yellow, white, and the #R$9191(attribute table) holds each code's attribute.
N $921A Each design and its durability are described under #LINK(Graphics#bricks)(Bricks) on the graphics page.
N $921A #UDGTABLE { =h Slot codes | =h One render per code, in code order } { $01 | #UDGARRAY2,69,3,tindex=1,alpha=0($DAC8;$DAD0;$DAD8;$DAE0)(brick_slot_01) } { $02 | #UDGARRAY2,69,3,tindex=1,alpha=0($DAF8;$DAD0;$DB00;$DB08)(brick_slot_02) } { $03 | #UDGARRAY2,69,3,tindex=1,alpha=0($DB18;$DAD0;$DAD8;$DAE0)(brick_slot_03) } { $04–$0A | #UDGARRAY2,65,3,tindex=1,alpha=0($DB20;$DE50;$DE58;$DE60)(brick_slot_04) #UDGARRAY2,66,3,tindex=1,alpha=0($DB20;$DE50;$DE58;$DE60)(brick_slot_05) #UDGARRAY2,67,3,tindex=1,alpha=0($DB20;$DE50;$DE58;$DE60)(brick_slot_06) #UDGARRAY2,68,3,tindex=1,alpha=0($DB20;$DE50;$DE58;$DE60)(brick_slot_07) #UDGARRAY2,69,3,tindex=1,alpha=0($DB20;$DE50;$DE58;$DE60)(brick_slot_08) #UDGARRAY2,70,3,tindex=1,alpha=0($DB20;$DE50;$DE58;$DE60)(brick_slot_09) #UDGARRAY2,71,3,tindex=1,alpha=0($DB20;$DE50;$DE58;$DE60)(brick_slot_0A) } { $0B–$11 | #UDGARRAY2,65,3,tindex=1,alpha=0($DB28;$DE50;$DE58;$DE60)(brick_slot_0B) #UDGARRAY2,66,3,tindex=1,alpha=0($DB28;$DE50;$DE58;$DE60)(brick_slot_0C) #UDGARRAY2,67,3,tindex=1,alpha=0($DB28;$DE50;$DE58;$DE60)(brick_slot_0D) #UDGARRAY2,68,3,tindex=1,alpha=0($DB28;$DE50;$DE58;$DE60)(brick_slot_0E) #UDGARRAY2,69,3,tindex=1,alpha=0($DB28;$DE50;$DE58;$DE60)(brick_slot_0F) #UDGARRAY2,70,3,tindex=1,alpha=0($DB28;$DE50;$DE58;$DE60)(brick_slot_10) #UDGARRAY2,71,3,tindex=1,alpha=0($DB28;$DE50;$DE58;$DE60)(brick_slot_11) } { $12–$18 | #UDGARRAY2,65,3,tindex=1,alpha=0($DB30;$DE50;$DE58;$DE60)(brick_slot_12) #UDGARRAY2,66,3,tindex=1,alpha=0($DB30;$DE50;$DE58;$DE60)(brick_slot_13) #UDGARRAY2,67,3,tindex=1,alpha=0($DB30;$DE50;$DE58;$DE60)(brick_slot_14) #UDGARRAY2,68,3,tindex=1,alpha=0($DB30;$DE50;$DE58;$DE60)(brick_slot_15) #UDGARRAY2,69,3,tindex=1,alpha=0($DB30;$DE50;$DE58;$DE60)(brick_slot_16) #UDGARRAY2,70,3,tindex=1,alpha=0($DB30;$DE50;$DE58;$DE60)(brick_slot_17) #UDGARRAY2,71,3,tindex=1,alpha=0($DB30;$DE50;$DE58;$DE60)(brick_slot_18) } { $19–$1F | #UDGARRAY2,65,3,tindex=1,alpha=0($DB38;$DE50;$DE58;$DE60)(brick_slot_19) #UDGARRAY2,66,3,tindex=1,alpha=0($DB38;$DE50;$DE58;$DE60)(brick_slot_1A) #UDGARRAY2,67,3,tindex=1,alpha=0($DB38;$DE50;$DE58;$DE60)(brick_slot_1B) #UDGARRAY2,68,3,tindex=1,alpha=0($DB38;$DE50;$DE58;$DE60)(brick_slot_1C) #UDGARRAY2,69,3,tindex=1,alpha=0($DB38;$DE50;$DE58;$DE60)(brick_slot_1D) #UDGARRAY2,70,3,tindex=1,alpha=0($DB38;$DE50;$DE58;$DE60)(brick_slot_1E) #UDGARRAY2,71,3,tindex=1,alpha=0($DB38;$DE50;$DE58;$DE60)(brick_slot_1F) } { $20–$26 | #UDGARRAY2,65,3,tindex=1,alpha=0($DB40;$DE50;$DE58;$DE60)(brick_slot_20) #UDGARRAY2,66,3,tindex=1,alpha=0($DB40;$DE50;$DE58;$DE60)(brick_slot_21) #UDGARRAY2,67,3,tindex=1,alpha=0($DB40;$DE50;$DE58;$DE60)(brick_slot_22) #UDGARRAY2,68,3,tindex=1,alpha=0($DB40;$DE50;$DE58;$DE60)(brick_slot_23) #UDGARRAY2,69,3,tindex=1,alpha=0($DB40;$DE50;$DE58;$DE60)(brick_slot_24) #UDGARRAY2,70,3,tindex=1,alpha=0($DB40;$DE50;$DE58;$DE60)(brick_slot_25) #UDGARRAY2,71,3,tindex=1,alpha=0($DB40;$DE50;$DE58;$DE60)(brick_slot_26) } { $27–$2D | #UDGARRAY2,65,3,tindex=1,alpha=0($DB48;$DE50;$DE58;$DE60)(brick_slot_27) #UDGARRAY2,66,3,tindex=1,alpha=0($DB48;$DE50;$DE58;$DE60)(brick_slot_28) #UDGARRAY2,67,3,tindex=1,alpha=0($DB48;$DE50;$DE58;$DE60)(brick_slot_29) #UDGARRAY2,68,3,tindex=1,alpha=0($DB48;$DE50;$DE58;$DE60)(brick_slot_2A) #UDGARRAY2,69,3,tindex=1,alpha=0($DB48;$DE50;$DE58;$DE60)(brick_slot_2B) #UDGARRAY2,70,3,tindex=1,alpha=0($DB48;$DE50;$DE58;$DE60)(brick_slot_2C) #UDGARRAY2,71,3,tindex=1,alpha=0($DB48;$DE50;$DE58;$DE60)(brick_slot_2D) } { $2E–$34 | #UDGARRAY2,65,3,tindex=1,alpha=0($DB50;$DE50;$DE58;$DE60)(brick_slot_2E) #UDGARRAY2,66,3,tindex=1,alpha=0($DB50;$DE50;$DE58;$DE60)(brick_slot_2F) #UDGARRAY2,67,3,tindex=1,alpha=0($DB50;$DE50;$DE58;$DE60)(brick_slot_30) #UDGARRAY2,68,3,tindex=1,alpha=0($DB50;$DE50;$DE58;$DE60)(brick_slot_31) #UDGARRAY2,69,3,tindex=1,alpha=0($DB50;$DE50;$DE58;$DE60)(brick_slot_32) #UDGARRAY2,70,3,tindex=1,alpha=0($DB50;$DE50;$DE58;$DE60)(brick_slot_33) #UDGARRAY2,71,3,tindex=1,alpha=0($DB50;$DE50;$DE58;$DE60)(brick_slot_34) } { $35–$3B | #UDGARRAY2,65,3,tindex=1,alpha=0($DB58;$DE50;$DE58;$DE60)(brick_slot_35) #UDGARRAY2,66,3,tindex=1,alpha=0($DB58;$DE50;$DE58;$DE60)(brick_slot_36) #UDGARRAY2,67,3,tindex=1,alpha=0($DB58;$DE50;$DE58;$DE60)(brick_slot_37) #UDGARRAY2,68,3,tindex=1,alpha=0($DB58;$DE50;$DE58;$DE60)(brick_slot_38) #UDGARRAY2,69,3,tindex=1,alpha=0($DB58;$DE50;$DE58;$DE60)(brick_slot_39) #UDGARRAY2,70,3,tindex=1,alpha=0($DB58;$DE50;$DE58;$DE60)(brick_slot_3A) #UDGARRAY2,71,3,tindex=1,alpha=0($DB58;$DE50;$DE58;$DE60)(brick_slot_3B) } { $3C–$42 | #UDGARRAY2,65,3,tindex=1,alpha=0($DF18;$DE50;$DE58;$DE60)(brick_slot_3C) #UDGARRAY2,66,3,tindex=1,alpha=0($DF18;$DE50;$DE58;$DE60)(brick_slot_3D) #UDGARRAY2,67,3,tindex=1,alpha=0($DF18;$DE50;$DE58;$DE60)(brick_slot_3E) #UDGARRAY2,68,3,tindex=1,alpha=0($DF18;$DE50;$DE58;$DE60)(brick_slot_3F) #UDGARRAY2,69,3,tindex=1,alpha=0($DF18;$DE50;$DE58;$DE60)(brick_slot_40) #UDGARRAY2,70,3,tindex=1,alpha=0($DF18;$DE50;$DE58;$DE60)(brick_slot_41) #UDGARRAY2,71,3,tindex=1,alpha=0($DF18;$DE50;$DE58;$DE60)(brick_slot_42) } { $43–$49 | #UDGARRAY2,65,3,tindex=1,alpha=0($DD80;$DD88;$DD90;$DE60)(brick_slot_43) #UDGARRAY2,66,3,tindex=1,alpha=0($DD80;$DD88;$DD90;$DE60)(brick_slot_44) #UDGARRAY2,67,3,tindex=1,alpha=0($DD80;$DD88;$DD90;$DE60)(brick_slot_45) #UDGARRAY2,68,3,tindex=1,alpha=0($DD80;$DD88;$DD90;$DE60)(brick_slot_46) #UDGARRAY2,69,3,tindex=1,alpha=0($DD80;$DD88;$DD90;$DE60)(brick_slot_47) #UDGARRAY2,70,3,tindex=1,alpha=0($DD80;$DD88;$DD90;$DE60)(brick_slot_48) #UDGARRAY2,71,3,tindex=1,alpha=0($DD80;$DD88;$DD90;$DE60)(brick_slot_49) } { $4A–$50 | #UDGARRAY2,65,3,tindex=1,alpha=0($DDB0;$DDB8;$DDC0;$DE60)(brick_slot_4A) #UDGARRAY2,66,3,tindex=1,alpha=0($DDB0;$DDB8;$DDC0;$DE60)(brick_slot_4B) #UDGARRAY2,67,3,tindex=1,alpha=0($DDB0;$DDB8;$DDC0;$DE60)(brick_slot_4C) #UDGARRAY2,68,3,tindex=1,alpha=0($DDB0;$DDB8;$DDC0;$DE60)(brick_slot_4D) #UDGARRAY2,69,3,tindex=1,alpha=0($DDB0;$DDB8;$DDC0;$DE60)(brick_slot_4E) #UDGARRAY2,70,3,tindex=1,alpha=0($DDB0;$DDB8;$DDC0;$DE60)(brick_slot_4F) #UDGARRAY2,71,3,tindex=1,alpha=0($DDB0;$DDB8;$DDC0;$DE60)(brick_slot_50) } { $51–$57 | #UDGARRAY2,65,3,tindex=1,alpha=0($DDC8;$DDD0;$DDD8;$DDE0)(brick_slot_51) #UDGARRAY2,66,3,tindex=1,alpha=0($DDC8;$DDD0;$DDD8;$DDE0)(brick_slot_52) #UDGARRAY2,67,3,tindex=1,alpha=0($DDC8;$DDD0;$DDD8;$DDE0)(brick_slot_53) #UDGARRAY2,68,3,tindex=1,alpha=0($DDC8;$DDD0;$DDD8;$DDE0)(brick_slot_54) #UDGARRAY2,69,3,tindex=1,alpha=0($DDC8;$DDD0;$DDD8;$DDE0)(brick_slot_55) #UDGARRAY2,70,3,tindex=1,alpha=0($DDC8;$DDD0;$DDD8;$DDE0)(brick_slot_56) #UDGARRAY2,71,3,tindex=1,alpha=0($DDC8;$DDD0;$DDD8;$DDE0)(brick_slot_57) } { $58–$5E | #UDGARRAY2,65,3,tindex=1,alpha=0($DDE8;$DDF0;$DDF8;$DE00)(brick_slot_58) #UDGARRAY2,66,3,tindex=1,alpha=0($DDE8;$DDF0;$DDF8;$DE00)(brick_slot_59) #UDGARRAY2,67,3,tindex=1,alpha=0($DDE8;$DDF0;$DDF8;$DE00)(brick_slot_5A) #UDGARRAY2,68,3,tindex=1,alpha=0($DDE8;$DDF0;$DDF8;$DE00)(brick_slot_5B) #UDGARRAY2,69,3,tindex=1,alpha=0($DDE8;$DDF0;$DDF8;$DE00)(brick_slot_5C) #UDGARRAY2,70,3,tindex=1,alpha=0($DDE8;$DDF0;$DDF8;$DE00)(brick_slot_5D) #UDGARRAY2,71,3,tindex=1,alpha=0($DDE8;$DDF0;$DDF8;$DE00)(brick_slot_5E) } { $5F–$65 | #UDGARRAY2,65,3,tindex=1,alpha=0($DE08;$DE10;$DE18;$DE20)(brick_slot_5F) #UDGARRAY2,66,3,tindex=1,alpha=0($DE08;$DE10;$DE18;$DE20)(brick_slot_60) #UDGARRAY2,67,3,tindex=1,alpha=0($DE08;$DE10;$DE18;$DE20)(brick_slot_61) #UDGARRAY2,68,3,tindex=1,alpha=0($DE08;$DE10;$DE18;$DE20)(brick_slot_62) #UDGARRAY2,69,3,tindex=1,alpha=0($DE08;$DE10;$DE18;$DE20)(brick_slot_63) #UDGARRAY2,70,3,tindex=1,alpha=0($DE08;$DE10;$DE18;$DE20)(brick_slot_64) #UDGARRAY2,71,3,tindex=1,alpha=0($DE08;$DE10;$DE18;$DE20)(brick_slot_65) } { $66–$6C | #UDGARRAY2,65,3,tindex=1,alpha=0($DD98;$DDA0;$DDA8;$DCA0)(brick_slot_66) #UDGARRAY2,66,3,tindex=1,alpha=0($DD98;$DDA0;$DDA8;$DCA0)(brick_slot_67) #UDGARRAY2,67,3,tindex=1,alpha=0($DD98;$DDA0;$DDA8;$DCA0)(brick_slot_68) #UDGARRAY2,68,3,tindex=1,alpha=0($DD98;$DDA0;$DDA8;$DCA0)(brick_slot_69) #UDGARRAY2,69,3,tindex=1,alpha=0($DD98;$DDA0;$DDA8;$DCA0)(brick_slot_6A) #UDGARRAY2,70,3,tindex=1,alpha=0($DD98;$DDA0;$DDA8;$DCA0)(brick_slot_6B) #UDGARRAY2,71,3,tindex=1,alpha=0($DD98;$DDA0;$DDA8;$DCA0)(brick_slot_6C) } { $6D–$73 | #UDGARRAY2,65,3,tindex=1,alpha=0($DD28;$DD30;$DD38;$DD40)(brick_slot_6D) #UDGARRAY2,66,3,tindex=1,alpha=0($DD28;$DD30;$DD38;$DD40)(brick_slot_6E) #UDGARRAY2,67,3,tindex=1,alpha=0($DD28;$DD30;$DD38;$DD40)(brick_slot_6F) #UDGARRAY2,68,3,tindex=1,alpha=0($DD28;$DD30;$DD38;$DD40)(brick_slot_70) #UDGARRAY2,69,3,tindex=1,alpha=0($DD28;$DD30;$DD38;$DD40)(brick_slot_71) #UDGARRAY2,70,3,tindex=1,alpha=0($DD28;$DD30;$DD38;$DD40)(brick_slot_72) #UDGARRAY2,71,3,tindex=1,alpha=0($DD28;$DD30;$DD38;$DD40)(brick_slot_73) } { $82–$88 | #UDGARRAY2,65,3,tindex=1,alpha=0($DD80;$DE50;$DE58;$DE60)(brick_slot_82) #UDGARRAY2,66,3,tindex=1,alpha=0($DD80;$DE50;$DE58;$DE60)(brick_slot_83) #UDGARRAY2,67,3,tindex=1,alpha=0($DD80;$DE50;$DE58;$DE60)(brick_slot_84) #UDGARRAY2,68,3,tindex=1,alpha=0($DD80;$DE50;$DE58;$DE60)(brick_slot_85) #UDGARRAY2,69,3,tindex=1,alpha=0($DD80;$DE50;$DE58;$DE60)(brick_slot_86) #UDGARRAY2,70,3,tindex=1,alpha=0($DD80;$DE50;$DE58;$DE60)(brick_slot_87) #UDGARRAY2,71,3,tindex=1,alpha=0($DD80;$DE50;$DE58;$DE60)(brick_slot_88) } TABLE#
B $921A,4,4 Empty slot
B $921E,4,4 Golden brick
B $9222,4,4 Silver-1 brick
B $9226,4,4 Silver-2 brick
B $922A,28,4 Glue prize brick
B $9246,28,4 Missile prize brick
B $9262,28,4 Expand prize brick
B $927E,28,4 Safety net prize brick
B $929A,28,4 Bomb prize brick
B $92B6,28,4 Double bat prize brick
B $92D2,28,4 Extra life prize brick
B $92EE,28,4 Double score prize brick
B $930A,28,4 Slow ball prize brick
B $9326,28,4 Solid brick
B $9342,28,4 Solid brick
B $935E,28,4 Window brick
B $937A,28,4 Rounded brick
B $9396,28,4 Ornate brick
B $93B2,28,4 Angry-face brick
B $93CE,28,4 Hatched brick
S $93EA,56 No design
B $9422,28,4 Third solid brick
@ $943E label=anim_death_burst
w $943E Shared death/explosion burst animation
D $943E Sprite pointers for the burst every dying object plays, indexed by animation frame.
D $943E Entry 0 is a null pad.
D $943E Each burst bitmap fills two consecutive entries.
@ $9460 label=anim_ball_gem
w $9460 Ball-gem animation
D $9460 The spawn-flash frames, then the in-flight frames
@ $948A label=anim_ball_b_spawn
w $948A Second-ball spawn animation
@ $94B2 label=anim_orb
w $94B2 Orb chew-and-spit animation
D $94B2 Frames 21 to 28 are the chew loop, and the spit starts at frame 29.
@ $9508 label=anim_comet
w $9508 Comet animation
@ $950E label=anim_hive_idle
w $950E Hive idle animation
@ $9520 label=anim_hive_burst
w $9520 Hive spawn-burst animation
@ $9532 label=anim_bee
w $9532 Bee animation
@ $9536 label=anim_starburst
w $9536 Starburst animation
@ $953C label=anim_visor
w $953C Visor animation
@ $954C label=anim_face_monster
w $954C Face-monster animation
@ $9564 label=anim_diamond
w $9564 Diamond animation
@ $957C label=anim_ufo
w $957C UFO animation
@ $9584 label=anim_capsule
w $9584 Capsule animation
@ $9594 label=anim_dart
w $9594 Dart animation
@ $95A4 label=anim_h_rotor
w $95A4 H-rotor animation
@ $95BC label=anim_bowling_ball
w $95BC Bowling-ball animation
@ $95C8 label=anim_warp_gate
w $95C8 Warp gate animation
@ $95D0 label=anim_wheel
w $95D0 Wheel animation
@ $95E0 isub=LD HL,TILEMAP_BASE+$42
@ $95E0 label=draw_playfield_border
c $95E0 Draw the playfield border
D $95E0 Composes the static playfield border into the tile map and their attribute cells.
D $95E0 It draws top and bottom strips, four corners, and one side wall on the edge opposite the bat.
  $95E0 Top edge: 28×2-cell strip at tile-map rows 2–3, col 2
@ $95E6 isub=LD HL,TILEMAP_BASE+$2C2
  $95E6 Bottom edge: 28×2-cell strip at rows 22–23, col 2
  $95EC Side wall: 18×2 cells down rows 4–21, on the side opposite the bat. The #R$8E9E(bat side) picks col 0 or col 30.
@ $95EF isub=LD HL,TILEMAP_BASE+$40
@ $95EF nowarn
  $95EF Top-left corner (2×2) at row 2, col 0
@ $95F8 isub=LD HL,TILEMAP_BASE+$2C0
@ $95F8 nowarn
  $95F8 Bottom-left corner at row 22, col 0
@ $9601 isub=LD HL,TILEMAP_BASE+$5E
  $9601 Top-right corner at row 2, col 30
@ $960A isub=LD HL,TILEMAP_BASE+$2DE
  $960A Bottom-right corner at row 22, col 30. The code falls through into the #R$9610(corner-block routine), which draws it.
@ $9610 label=draw_corner_block
c $9610 Draw a corner block
D $9610 Stamps one corner block into the tile map and paints its four cells bright cyan on black.
R $9610 I:HL top-left tile-map cell address
R $9610 I:DE pointer to the four tile codes, in the quadrant order the #R$921A(brick tile-glyph groups) use
  $9610 Stash the top-left cell; B counts the two tile rows.
  $9613 Write one row of two tile codes from DE, then step HL down one 32-cell tile-map row.
  $9620 Recover the top-left cell and map its tile-map page to the attribute page of the same cell; the shared low byte keeps the same cell.
  $9627,13 Paint all four corner cells BRIGHT cyan ink on black paper.
@ $9635 label=draw_mirror_wall
c $9635 Draw or color the mirror side wall on the bat's side
D $9635 Draws the mirror side wall, the safety net barrier down the bat's own losing edge.
D $9635 The #R$969C(permanent border wall) holds the far edge.
D $9635 It both lays the tiles down and steps the color fade.
N $9635 The wall opposite the bat is composed by #R$969C from the real bat side. This routine targets the other edge, the bat's own.
R $9635 I:A 0 to redraw the mirror wall's tiles at base appearance, or the attribute byte to flood across its 36 cells
  $9635 Redraw the wall's tiles, or flood its band with one attribute?
  $9638,16 Tile-redraw mode: flip the bat side, redraw the mirror wall via #R$969C on the flipped side, then restore the bat side.
@ $9649 label=color_mirror_wall
  $9649 Attribute mode: stash the fill byte in A', then pick the band column from the bat side – the mirror edge on the bat's side.
@ $9650 isub=LD HL,ATTR_BASE+$9E
  $9650 Bat on the right: anchor the 2-wide band at the right edge, column 30 of attribute row 4.
@ $9655 label=band_left
@ $9655 isub=LD HL,ATTR_BASE+$80
  $9655 Bat on the left: anchor the band at the left edge, column 0 of attribute row 4.
@ $9658 label=fill_band
  $9658 Recover the fill byte into C.
  $965A Walk the band's full height.
  $965C Row stride: 32 cells to the next attribute row
@ $965F label=fill_band_row
  $965F Write the fill byte to both columns of the row, then step down one 32-column row.
  $9666
@ $9667 label=draw_wide_strip
c $9667 Draw a top/bottom border strip
D $9667 Draws a border strip into the tile map and colors its attribute cells.
D $9667 It stamps no dirty counters, unlike the #R$969C(side wall). The border reaches the screen through #R$990B(the tile-map render) once per level.
R $9667 I:HL top-left tile-map cell of the 28×2 strip
  $9667 Save the strip's top-left cell twice: for the second tile row and for the attribute pass.
  $9669 Copy the first row of the #R$97E1(border strip tiles) into the strip's top row.
  $9671 Restore the top-left cell and drop to the next tile row.
  $9675 Copy the table's second row into the strip's bottom row; the table continues where the first copy left off.
  $967A Reuse the saved cell offset as an attribute-file address: the tile-map page maps to the attribute-file page of the same cell, low byte unchanged.
  $9681 Color the top row.
@ $9684 label=color_strip_top
  $9684 Color 28 cells bright cyan ink on black paper.
  $9689 Drop to the bottom attribute row and color it.
@ $968F label=color_strip_bottom
  $968F Color 28 cells bright green ink.
  $9694
@ $9695 label=copy_bytes
c $9695 Copy a run of bytes
D $9695 Copies a run of bytes.
R $9695 I:HL address of the first byte written
R $9695 I:DE address of the first byte read
R $9695 I:B number of bytes to copy (0 copies 256)
R $9695 O:DE address after the last byte read
  $9695 Copy one byte and advance both pointers, B times.
  $969B
@ $969C label=draw_side_wall
c $969C Draw the side border wall
D $969C Paints the side border wall down the playfield edge opposite the bat.
D $969C Every cell it paints is stamped dirty, so the blit #R$BBA4 carries the wall to the screen.
N $969C Each row takes its two tile codes from the #R$97BD(side-wall tile pattern).
  $969C The bat's side picks the band's edge, and the wall takes the other one. Either edge starts at tile-map row 4.
@ $96A2 isub=LD HL,TILEMAP_BASE+$9E
  $96A2 A non-zero side takes the right edge, column 30.
@ $96A7 isub=LD HL,TILEMAP_BASE+$80
  $96A7 A zero side takes the left edge, column 0.
  $96AA Hold the anchor for the passes below.
  $96AB Point HL' (alternate) at the anchor's own cell in the work buffer, three INC H steps above it. Restore HL to the tile-map anchor, and re-save the anchor for the attribute pass.
  $96B4 Source: the 36-cell wall pattern, two tile codes per row
  $96B7 Walk the wall band's full height.
  $96B9 Write the row's two tile codes into the left and right cells and stamp both work-buffer cells dirty. #R$BBA4(The blit) copies a cell while its count is non-zero.
  $96CA Step the tile-map and work-buffer pointers down one 32-column row each.
  $96D3 Reload the anchor and convert it to its attribute-file address once, from the anchor alone. The tile-map page maps to the attribute-file page, and the low byte (cell offset) stays. The #R$98F7(per-row step) then moves the attribute pointer down rows 4–21. The attribute file is contiguous, so it walks the attribute pages in lockstep with the tile-map pages.
  $96DF Color the band straight in the attribute file, for all 18 rows. The left column is bright cyan ink on black paper, the right column bright green ink.
  $96EA
@ $96EB label=blank_safety_net
c $96EB Blank the safety net band
D $96EB Erases the safety net barrier from the side band on the bat's side, and leaves those cells empty and bright white.
D $96EB The band is the mirror of the #R$969C(permanent border wall). That is why the bat-side test here runs the other way.
N $96EB Walks the same rows as #R$969C. It writes the empty tile into both cells and stamps them dirty.
  $96EB Anchor the band on the mirror edge, the side #R$9635(the mirror wall routine) draws after it flips the bat side.
@ $96F1 isub=LD HL,TILEMAP_BASE+$9E
  $96F1 A zero side takes the right edge, column 30.
@ $96F6 isub=LD HL,TILEMAP_BASE+$80
  $96F6 A non-zero side takes the left edge, column 0.
  $96F9 Hold the anchor for the passes below.
  $96FA Point DE at the anchor's own cell in the work buffer (INC D three times).
  $96FF Walk the wall band's full height.
  $9701 Hold the dirty-counter value in A across the row loop.
  $9703 Write the empty tile into both cells and stamp both work-buffer cells dirty.
  $970D Step both pointers down one 32-column row. The count byte rides in AF' across both calls. The first advances HL, and the second advances DE through EX DE,HL.
  $9719 Reload the anchor and convert it to its attribute-file address once, from the anchor alone. The tile-map page maps to the attribute-file page with the cell offset unchanged. The per-row step then walks the attribute pages in lockstep with the tile-map pages across rows 4–21.
  $9725 Color both columns bright white ink on black paper, written straight to the attribute file for all 18 rows.
  $9730
@ $9731 label=compose_brick_field
c $9731 Compose the level's brick field into the tile map
D $9731 Composes the current level's brick field into the tile map, once at level start.
D $9731 Each slot code becomes a 2×2 group of tile codes and one attribute byte.
D $9731 The bricks reach the screen only through #R$990B(the tile-map render).
N $9731 The grid is 9×9 slots, each 2×2 characters. It spans the playfield's full height, rows 4 to 21, and 18 of its columns.
N $9731 The field sits against the wall opposite the bat.
  $9731 Read the bat side: 0 for the right, non-zero for the left.
@ $9737 isub=LD HL,TILEMAP_BASE+$9C
  $9737 Bat on the left: anchor the grid at tile-map row 4, column 28.
@ $973A isub=LD (compose_grid+$2),HL
  $973A Store the anchor as the grid's start cell, in the operand of the #R$9762(LD HL below).
  $973D Patch the #R$97AB(per-cell column step) to DEC L,DEC L: cells advance 2 columns leftward.
@ $9740 nowarn
@ $9745 isub=LD HL,TILEMAP_BASE+$82
@ $9745 label=bat_on_right
  $9745 Bat on the right: anchor the grid at tile-map row 4, column 2.
@ $9748 isub=LD (compose_grid+$2),HL
  $9748 Store the anchor as the grid's start cell.
  $974B Patch the per-cell column step to INC L,INC L: cells advance 2 columns rightward.
@ $974E nowarn
@ $9751 label=seek_layout
  $9751 Index this level's slot layout by the level index.
  $9754 Base of the slot-layout table.
  $9757 Level 0 uses the table base unchanged.
  $975A Layouts are 81 bytes each (a 9×9 grid of slot codes); skip the layouts of earlier levels.
@ $975E label=seek_layout_loop
  $975E Step past one layout per earlier level. HL then points at this level's layout.
@ $9761 label=compose_grid
  $9761 Point DE at the first slot code of this level's layout.
  $9762 Point HL at the anchor cell. The bat-side setup above patches the operand.
  $9765 Walk the grid's rows of bricks.
@ $9767 label=next_brick_row
  $9767 Save the row counter and this row's start cell.
  $9769 Walk this row's bricks.
@ $976B label=next_brick_cell
  $976B Save the slot counter, the layout pointer, and this cell's tile-map address.
  $976E Read this cell's code; keep a copy in A' for the attribute lookup.
  $9770 Look up the slot code's four tile codes in the #R$921A(brick tile-glyph groups), 4 bytes per code, and point DE at them. They are the slot's tiles in row order.
  $977B Recover this cell's address (the top-left character of the 2×2 block).
  $977D Write the cell's top row: the top-left tile, then the top-right one in the next column. Then step down one tile-map row.
  $9788 Write the bottom row: the bottom-left tile, then the bottom-right one in the next column.
  $978E Recover the cell address for the attribute pass.
  $9790 Map the tile-map page to the attribute page of the same cell; the shared low byte keeps the same cell.
  $9796 Look up the cell's attribute by code in the #R$9191(brick attributes), into C.
  $97A1 Paint all four attribute cells of the 2×2 block with C.
  $97AA Recover the cell address.
@ $97AB label=smc_grid_col_step
B $97AB,1
  $97AB Self-modified per-cell column step, this byte and the next, patched by the bat-side setup. Both are INC L to advance 2 columns right, or both DEC L to advance left.
  $97AD Restore the layout pointer and step to the next slot code.
  $97AF Loop for the 9 cells across this row.
  $97B2 Recover this row's start cell.
  $97B3 Step down 2 tile-map rows to the next cell row (each cell is 2 rows tall).
  $97B9 Loop for the 9 cell rows.
  $97BC
@ $97BD label=side_wall_tiles
b $97BD Side-wall tile pattern
D $97BD Each row holds two tile codes of the playfield's vertical side wall, the left column then the right.
B $97BD,36,2
@ $97E1 label=border_strip_tiles
b $97E1 Top/bottom border strip tiles
D $97E1 Holds the horizontal border strip's tile codes, the top row then the bottom row.
B $97E1,56,7
@ $9819 label=corner_tl
b $9819 Playfield corner tiles
D $9819 Holds each corner's 2×2 block of tile codes in row order.
B $9819,4,4 Top-left corner
@ $981D label=corner_bl
B $981D,4,4 Bottom-left corner
@ $9821 label=corner_tr
B $9821,4,4 Top-right corner
@ $9825 label=corner_br
B $9825,4,4 Bottom-right corner
@ $9829 isub=LD HL,SCREEN_BASE
@ $9829 label=clear_screen
c $9829 Clear the screen bitmap to zero
D $9829 Zeroes the display file, and one byte past it the first cell of the attribute file.
D $9829 That overrun is the propagate-fill's last copy. The seed write of the #R$9837(attribute fill) covers the cell before anything reads it.
  $9829 Start of the display file.
@ $982C isub=LD DE,SCREEN_BASE+$1
  $982C LDIR destination is one byte ahead.
@ $982F isub=LD BC,SCREEN_SIZE
  $982F Sized from the display-file constant; the colors come from a separate pass (#R$9837).
  $9832 Seed the first byte with zero.
  $9834 Propagate it through the file.
  $9836
@ $9837 isub=LD HL,ATTR_BASE
@ $9837 label=fill_attrs
c $9837 Fill the attribute file with the color in A
D $9837 Fills every attribute cell with the byte in A.
R $9837 I:A the attribute byte written to every cell
  $9837 Start of the attribute file.
@ $983A isub=LD DE,ATTR_BASE+$1
  $983D One less than the full cell count: the seed fills the first cell.
  $9840 Seed the first cell with A.
  $9841 Propagate A through every cell.
  $9843
@ $9844 label=print_string
c $9844 Print a font string to the screen
D $9844 Prints a string from the game font into consecutive screen cells.
R $9844 I:HL screen address of the first character cell
R $9844 I:DE pointer to the string (bit 7 set marks the final character)
R $9844 I:C the attribute written to every cell
  $9844 Save the caller's attribute (C) and screen address.
  $9846 Work in the alternate registers to build the attribute address.
  $9848 The screen third comes from bits 3–4 of the high byte.
  $984B Shift it down to bits 0–1.
  $984E The addition of the attribute-file high byte leaves HL' on the cell's attribute.
  $9852 Back to the main registers, with HL on the screen cell and the attribute in C.
  $9853 Per character: save the string pointer and screen address.
  $9855 Read the character and strip its terminator.
  $9859 Point DE at the character's glyph in the font, 8 bytes per glyph.
@ $985E isub=LD DE,FONT_BASE
  $9863 Recover the screen cell and count off the glyph's rows.
  $9867 Copy the glyph into the cell, one pixel row at a time.
  $986D Write attribute C into this cell and advance the attribute pointer.
  $9872 Advance to the next character cell.
  $9874 Was that the last character (bit 7 set)? If so, return.
  $9879 Otherwise loop for the next character.
@ $987B label=print_string_2x
c $987B Print a font string at double height
D $987B Like #R$9844(the single-height printer) but double-height (16 pixels tall) – the large status/heading text.
R $987B I:HL screen address of the upper cell of the first character
R $987B I:DE pointer to the string (bit 7 set marks the final character)
R $987B I:C the attribute written to every cell
R $987B O:DE address of the string's final character
  $987B Save the attribute and screen address. Build the attribute address in the alternate registers, as the #R$9844(single-height printer) does.
  $988A Per character: save the string pointer and screen address.
  $988C Read the character and strip the terminator bit.
  $9890 Point DE at the character's glyph in the font.
@ $9895 isub=LD DE,FONT_BASE
  $989E For each of the 8 glyph rows:
  $989F Write the row.
  $98A1 Step down one pixel line.
  $98A5 Write the same row again – this is what doubles the height.
  $98A6 Step down once more and move to the next glyph row, for all 8 rows. Then switch to the alternate registers for the attribute.
  $98AD Write the attribute to this cell and to the cell one row below. Then advance the attribute pointer and the screen address to the next character.
  $98B8 Recover the string pointer.
  $98B9 Last character (bit 7 set)? If so return, else loop.
@ $98C0 label=screen_down_pixel
c $98C0 Move a screen address down one pixel line
D $98C0 Advances HL to the next pixel row of the ZX display.
R $98C0 I:HL display-file address of a pixel row
R $98C0 O:HL display-file address of the same column, one pixel row down
  $98C0 Take the pixel row within the cell (low 3 bits of H).
  $98C8 Still inside the cell: just step one pixel row.
  $98C9
  $98CA At a cell boundary: are we also at a third boundary?
  $98D1 Same third: drop to the cell base and add one character row.
  $98D9
  $98DA Crossed a third: wrap the low byte and step into the next third.
  $98DF
@ $98E0 label=draw_glyph
c $98E0 Draw one glyph to a display-file cell and color it
D $98E0 Blits one 8-row glyph bitmap into a display-file character cell and sets that cell's attribute.
D $98E0 It takes the glyph pointer directly, so this routine does no character-code lookup.
R $98E0 I:HL display-file address of the cell's top pixel row
R $98E0 I:DE source of the 8 glyph bitmap bytes, one per pixel row, top first
R $98E0 I:C attribute byte to write for the cell
R $98E0 O:DE address after the glyph bitmap
  $98E0 Hold the cell address for the attribute write below.
  $98E1 Walk the cell's pixel rows.
  $98E3,6 Copy one glyph byte and step down one pixel row. INC H walks the display file down a pixel row; this stays valid only within a single cell, which is exactly the 8 rows here.
  $98EB Move H from the display file to the attribute file. The screen third in H picks the attribute page.
  $98F4,1 Set the cell's attribute to C.
@ $98F7 label=advance_buffer_row
c $98F7 Advance a buffer pointer down one 32-column row
D $98F7 Advances a pointer one 32-column row down the tile map or the work buffer.
R $98F7 I:HL pointer into the tile map or the work buffer
R $98F7 O:HL same column, one row down
  $98F7 Step HL down one row of the 32-wide map.
  $98FD
@ $98FE label=display_down_char
c $98FE Step a display-file pointer down one character row
D $98FE Advances a pointer down one character row in the display-file third layout. The screen and the back buffer share that layout byte for byte.
D $98FE The pointer comes back on the same column of the next character row. It carries across a screen-third boundary.
R $98FE I:HL pointer in display-file layout, at a cell's top pixel row
R $98FE O:HL same column, one character row down
  $98FE Step L down one character row within the third.
  $9902,8 Move the add's carry up into bit 3, four left-rotates in all. Mask it and apply it to H: a wrap enters the next third, and otherwise H stays put.
@ $990B label=render_tilemap
c $990B Render the tile map to the screen
D $990B Renders every tile-map cell into the back buffer, then copies the back buffer to the display file.
  $990B Start at the tile map.
@ $990E isub=LD BC,TILEMAP_SIZE
  $990E Process every cell.
  $9911 Each cell: hold the counter and the map pointer across the glyph copy.
  $9913 Read the tile value.
  $9915 Point DE at the tile's bitmap in the tile set, 8 bytes per tile.
@ $991A isub=LD DE,TILEGFX_BASE
  $9921 Build the back-buffer destination from the cell's screen-third (high bits).
@ $9927 isub=ADD A,BACKBUF_BASE/$100
  $992A Copy the 8 glyph rows into the back buffer (INC H steps down pixel rows).
@ $9950 isub=LD HL,BACKBUF_BASE
  $9950 Finally copy the whole back buffer to the display file.
@ $9953 isub=LD DE,SCREEN_BASE
@ $9956 isub=LD BC,SCREEN_SIZE
  $995B
@ $995C isub=LD HL,TILEMAP_BASE
@ $995C label=clear_tilemap
c $995C Clear the tile map to empty
D $995C Fills the tile map with the empty tile so the playfield starts blank.
  $995C Start at the tile map.
@ $995F isub=LD BC,TILEMAP_SIZE
  $995F Process every cell.
  $9962 Write the empty tile and advance.
  $996A
@ $996B isub=LD HL,WORKBUF_FB
@ $996B label=clear_workbuf
c $996B Clear the dirty counters
D $996B Marks every tile-map cell clean.
  $996B Zero every dirty counter, so a new screen starts with nothing marked dirty.
  $9979
@ $997A isub=LD HL,BACKBUF_BASE
@ $997A label=clear_backbuffer
c $997A Clear the back buffer
D $997A Zeroes the back buffer, ready for #R$990B(the tile-map render) to draw the tile map into it.
  $997A Start at the back buffer.
@ $997D isub=LD DE,BACKBUF_BASE+$1
  $997D Zero the seed byte and propagate it through the buffer.
  $9987
@ $9988 label=move_bat
c $9988 Move the player's bat
D $9988 Moves the player's bat up and down once per frame, from the sampled controls.
D $9988 The chosen control style, direct or inertia, decides the step. Whatever is attached comes with it, both the bat extension and any ball caught on the bat.
D $9988 Three gates can suppress the move, and the #R$9A45(double bat tail) runs even then.
N $9988 Both control styles test the same three travel bounds before they move the bat. #TABLE(default,,num) { =h Bound | =h Bat Y | =h Applies } { Top | 38 | always } { Bottom | 154 | with the bat on its own } { Bottom | 138 | while the bat extension is attached } TABLE#
  $9988 Only the bat's Y moves here. The #R$8E9E(side the player chose) fixes its column.
  $998C Gate 1: the sting freeze. The #R$CFB1(bee) sets it on its #R$A717(overlap) with the bat itself, never on a sweep hit. While it is set, jump straight to the double bat tail. That skips all bat movement, so the player cannot steer the bat. Cleared when the last ball is lost (#R$A03E) or by the level setup (#R$8EA8).
  $9993 Gate 2: the bat freeze. If clear, go on to the third gate. If set, run the release timer below and hold position.
  $9999 Frozen: count the freeze timer up by one this frame.
  $999E Release the bat freeze once the hold runs out; either way jump to the double bat tail, and leave the bat where it is.
@ $99AB label=pick_bat_control
  $99AB Gate 3: the death-pause timer is set – skip all movement, but still run the double bat tail.
  $99B2 Pick the control style: inertia runs #R$9BEE(inertia control), and either dual-speed style runs direct control below.
@ $99BE label=apply_direct_control
N $99BE The direct control style. The step follows the control bits of the current frame, with nothing carried over from the frames before it.
N $99BE The step is the slow speed, or the fast speed while fire is also held. The options screen sets both, on the rows it prints as #R$C34D(DUAL SPEED SLOW) and #R$C361(DUAL SPEED FAST). Up decreases the bat Y, down increases it. The edge test uses the position before the step, so a large step can carry the bat past the limit.
  $99BE Read the live control bits into #REGhl.
  $99C1 Up held?
  $99C5 Take the slow speed as the step.
  $99C9 Current bat Y
  $99CC Blocked at the top edge – the bat cannot move further up.
  $99D1 Move the bat up by the slow speed.
  $99D5 Drag the bat extension up with it.
  $99DB Drag any caught ball up with it.
  $99DE Fire also held? Apply the fast-speed bonus.
  $99E3 Take the difference between the fast and slow speeds as the extra step.
  $99EF Move up by the extra amount, for a total step of the fast speed this frame.
@ $99FC label=direct_down
  $99FC Down held?
  $9A00 An attached extension raises the bottom travel limit.
  $9A09 Extension attached: the raised bottom limit applies.
@ $9A0F label=direct_down_clamp
  $9A0F No extension: take the bat's Y on its own.
  $9A12 Otherwise the plain bottom limit applies.
@ $9A16 label=direct_down_apply
  $9A16 Move the bat down by the slow speed and drag the extension and caught ball with it.
  $9A2A Fire also held? Apply the fast-speed bonus downward too.
  $9A3A Move down by the extra amount, for a total step of the fast speed.
@ $9A45 label=track_double_bat
N $9A45 Double bat tail, run every frame. It acts only while the double bat flag is set, with no #R$5B58(missile shot) in flight and no #R$5B63(retract) or #R$5B66(bomb) effect armed. It then parks the #R$8F7A(secondary object) at the bat's current Y on the bat's side and activates it. Drawn with the #R$5D00(bat sprite), it is the second bat, which follows the bat's Y.
  $9A45 Skip unless the double bat flag is set.
  $9A4B Skip while the missile shot is in flight, or while the retract or bomb effect is armed.
  $9A5D Take the bat's current Y.
  $9A62 Target the secondary object and pick its X column from the bat side: the right bat parks it at x 188.
@ $9A72 label=track_double_bat_left
  $9A72 The left bat parks it at the mirrored column.
@ $9A76 label=track_double_bat_set
  $9A76 Set the second bat's Y to the bat's, point it at the bat sprite, and set its active flag.
@ $9A88 label=launch_missile
N $9A88 Launch the missile shot on fire. When the missile bat is armed and fire is held in the #R$BC23(controls), it spawns the #R$8F7A(secondary object) at the bat's Y. It also seeds ball B's motion state. The shot moves outward from the bat's side. Returns immediately when nothing is armed or fire is not held.
  $9A88 No missile bat armed? Return.
  $9A8D Fire not held? Return. #REGhl points at the control bitfield only under direct control, or under inertia while the bat stands still. On every other path, this tests a byte that is not the controls – see #LINK(Defects)(Defects).
  $9A90 Disarm the missile bat and clear ball B's combo. Cancel the swap to the missile-bat sprite and arm the swap back to the normal bat.
  $9A9E Spawn the secondary object at the bat's Y. The side the bat plays from picks the X column (x 204 right / x 36 left) and the launch heading for that side.
@ $9AB3 label=launch_missile_left
  $9AB3 The left bat mirrors the column and takes the opposite heading code.
@ $9AB9 label=launch_missile_set
  $9AB9 Store the position, point at the missile-shot sprite and activate the object. Seed ball B's motion with the launch heading, its speed and counters, and set the two-ball and missile-shot flags. The shot then travels as the secondary object and clears every brick it passes through, the golden one included. A missile run thus cuts a lane the ball cannot.
  $9AF2
@ $9AF3 label=drag_caught_up
c $9AF3 Drag every caught ball up with the bat
D $9AF3 Drags any ball stuck on the bat up by the same pixel step the bat just moved. #R$9B23(The downward drag) is its counterpart.
N $9AF3 A ball is stuck on the bat while its on-the-bat flag is set. Either it waits for the serve, or the glue prize holds it.
N $9AF3 The two balls are handled independently, so in two-ball play either, both or neither may be dragged.
R $9AF3 I:A vertical step, in pixels
  $9AF3 Hold the step in B, where the two patched opcodes read it.
  $9AF4 The SUB B opcode: this up-entry subtracts the step from each caught ball's Y. The #R$9B23(down-entry) arrives at the next store with ADD A,B instead.
@ $9AF6 nowarn
  $9AF6,6 Patch both shared step opcodes to the chosen add/subtract.
@ $9AF9 nowarn
  $9AFE Drag ball A only while it is stuck on the bat.
  $9B04 Point IX at ball A's sprite record and read its Y.
B $9B0B,1
@ $9B0B label=smc_drag_step_a
N $9B0B The step instruction that #R$9AF3(the upward drag) sets to lift a caught ball and #R$9B23(the downward drag) sets to lower it.
  $9B0B Shift ball A's Y by the step.
  $9B0C Store ball A's Y back.
  $9B0F Repeat for ball B: act only while ball B is on the bat.
  $9B15 Point IX at the secondary object, which carries ball B, and read its Y.
B $9B1C,1 Shift ball B's Y by the step.
@ $9B1C label=smc_drag_step_b
  $9B1D Store ball B's Y back.
  $9B20 Give the caller its register back.
  $9B22
@ $9B23 label=drag_caught_down
c $9B23 Drag every caught ball down with the bat
D $9B23 Drags any ball stuck on the bat down by the same pixel step the bat just moved. It shares the body of #R$9AF3(the upward drag).
R $9B23 I:A vertical step, in pixels
  $9B23 Hold the step in B and enter the shared drag with the ADD A,B opcode.
@ $9B28 label=ball_tile_cell
c $9B28 Compute the tile-map probe origin for a ball
D $9B28 Finds the tile-map cell under a ball, shifted back against the ball's direction of travel.
N $9B28 The result is the cell where the probe starts. #R$A343(The ball's move pass) probes the cell just ahead of the ball in its direction of travel, from this origin.
N $9B28 The ball's position is moved back against its direction of travel before it is converted to a tile-map cell. The direction signs in the ball state record say which way back is.
N $9B28 The #R$E0E0(ball bitmap) does not fill its sprite square. The cell blocks a ball that moves right or down one pixel before the ball's edge reaches the cell. It blocks a ball that moves left or up only once the ball's edge pixel lies inside the cell.
R $9B28 I:B the object's #R$8F68(pool slot) index
R $9B28 I:IY the active ball state record, #R$5B00(ball A's) or #R$5B10(ball B's), which holds the X and Y direction signs
R $9B28 O:HL the tile-map cell the probe offsets from
  $9B28 Save IX/BC/DE; the routine returns only #REGhl.
  $9B2C Point IX at the sprite record of pool slot #REGb. Its first two bytes are the object's pixel X and Y.
  $9B30 Read the object's pixel X.
  $9B33 Nudge X against travel: a clear X direction sign means leftward, so add.
@ $9B3D label=ball_tile_cell_x_right
  $9B3D A set sign means rightward, so subtract instead.
@ $9B3F label=ball_tile_cell_x_col
  $9B3F Turn the nudged X into its tile column, in #REGc.
  $9B45 Read the object's pixel Y.
  $9B48 Nudge Y against travel: a clear Y direction sign means upward, so add.
@ $9B52 label=ball_tile_cell_y_down
  $9B52 A set sign means downward, so subtract instead.
@ $9B54 label=ball_tile_cell_y_row
  $9B54 Align Y to the top of its character row.
  $9B56 Scale it to the row's offset in the 32-wide tile map.
  $9B5B Merge the column into the low bits, which the row offset leaves clear.
  $9B5E,4 Add the tile-map base. HL now points at the object's tile-map cell.
@ $9B67 label=inertia_speed_ramp
b $9B67 Inertia speed ramp
D $9B67 Maps the #R$5B73(inertia accumulator) to the bat's per-frame step, from 1 px at rest to 9 px.
B $9B67,135,8*16,7
@ $9BEE label=apply_inertia_control
c $9BEE Move the bat with inertia
D $9BEE Moves the bat while a direction is held, faster the longer it is held, and restarts from rest on a reversal.
D $9BEE It tests the travel bounds tabled in #R$9988(the bat mover), and drags the bat extension and any caught ball.
R $9BEE I:IX the bat's sprite record
  $9BEE Read the live control bits into #REGhl.
  $9BF1 Up held?
  $9BF6 Bat Y
  $9BF9 At the top edge? Stop and reset the accumulator.
  $9BFE Was the previous move also up?
  $9C05 A reversal resets the accumulator, so acceleration restarts from rest.
@ $9C09 label=inertia_up_step
  $9C09 Index the inertia speed ramp by the accumulator.
@ $9C0F isub=LD HL,inertia_speed_ramp
  $9C13 Take this frame's step (it grows as the accumulator ramps).
  $9C14 Move the bat up by that step.
  $9C1B Drag the bat extension and any caught ball up too.
  $9C22 Add the inertia rate to the accumulator while it is below the ramp threshold. The sum can overshoot the threshold.
@ $9C34 label=inertia_up_done
  $9C34 Remember this frame moved up.
  $9C39
@ $9C3A label=inertia_down
  $9C3A Down held?
  $9C41 An attached extension raises the bottom travel limit.
  $9C47 With the extension attached, the bat stops short so the extension has room.
@ $9C50 label=inertia_down_clamp
  $9C50 Without one it runs to the floor of its travel.
@ $9C57 label=inertia_down_dir
  $9C57 Was the previous move also down?
  $9C5E On a reversal, restart the acceleration ramp from the bottom.
@ $9C63 label=inertia_down_step
  $9C63 Index the inertia speed ramp by the accumulator.
@ $9C69 isub=LD HL,inertia_speed_ramp
  $9C6E Move the bat down by the table step.
  $9C75 Drag the bat extension and any caught ball down too.
  $9C7F Add the inertia rate to the accumulator while it is below the ramp threshold. The sum can overshoot the threshold.
@ $9C8E label=inertia_down_done
  $9C8E Remember this frame moved down.
  $9C93
@ $9C94 label=inertia_idle
  $9C94 Neither direction held (or blocked): reset the accumulator so the next press starts slow.
  $9C98
@ $9C99 label=drag_attached_up
c $9C99 Drag the bat's extension up
D $9C99 Raises the bat extension in lockstep with the bat. A no-op while no extension is #R$5B4F(attached).
D $9C99 #R$9CA6(The extension's downward drag) is its counterpart.
R $9C99 I:B this frame's bat step, in pixels
  $9C99 No extension attached? Nothing to drag.
  $9C9E Move the #R$8FB0(extension) up by the step: subtract #REGb from its Y.
  $9CA5
@ $9CA6 label=drag_attached_down
c $9CA6 Drag the bat's extension down
D $9CA6 Lowers the bat extension in lockstep with the bat. The counterpart of #R$9C99(the extension's upward drag), gated the same way.
R $9CA6 I:B this frame's bat step, in pixels
  $9CA6 No extension attached? Nothing to drag.
  $9CAB Move the #R$8FB0(extension) down by the step: add #REGb to its Y.
  $9CB2
@ $9CB3 label=manage_objects
c $9CB3 Per-frame prize/effect object animation manager
D $9CB3 Runs once per frame from the main loop, as a priority chain of prize and effect blocks.
D $9CB3 Each block is gated by its own arm flag. Block 1 runs when armed and does not end the chain. Of blocks 2 to 11, the first one armed runs and returns, so later blocks wait for a later frame.
D $9CB3 The chain can arm a sound, #R$9FFF(lose a ball) or #R$8F0A(re-serve one).
  $9CB3 Block 1, the ball-capture slide, which the #R$D05B(orb) arms. Run only while the slide is armed.
  $9CB9 Force ball A's sprite record active so the captured ball stays drawn.
  $9CC1 Bat on the left? Take the leftward slide; otherwise drag right.
  $9CC7 Bat on the right: drag the ball toward it.
  $9CCF Reached the losing edge behind the bat?
  $9CD3 Arrived: clear the capture flags.
  $9CDA Lose the ball.
@ $9CDF label=fx_slide_left
  $9CDF Bat on the left: drag the captured ball toward it.
  $9CEB Past the left edge: clear the capture flags.
  $9CF2
@ $9CF5 label=fx_bat_sprite_missile
  $9CF5 Block 2: swap the bat to the missile-bat sprite. Armed by the missile prize.
  $9CFB Point the bat sprite at the missile-bat bitmap.
  $9D0C
@ $9D0D label=fx_bat_sprite_normal
  $9D0D Block 3: restore the bat to its normal sprite. Armed when the missile bat ends: at the launch, at the loss of the last ball, or when another prize is taken.
  $9D17 Point the bat sprite back at the normal bat bitmap.
  $9D24
@ $9D25 label=fx_obj2_retract
  $9D25 Block 4: retract animation for the secondary object, 16 frames.
  $9D2F First frame only: arm the death sound and end the missile shot. Clear the two-ball flag and the missile-shot flag.
@ $9D31 isub=LD (death_burst_counter),A
  $9D3B Look up this frame's sprite in the burst frame table, two bytes per frame.
  $9D49 Set the secondary object to that frame's sprite.
  $9D58 Advance the frame counter through frames 1–16, done when it steps past the last.
  $9D5F Finished: deactivate the secondary object.
  $9D63
@ $9D64 label=fx_expand_grow
  $9D64 Block 5: bat-expand grow. Armed by the expand prize; attaches the extension below the bat over 8 frames.
  $9D6E First frame: arm the bat-grows sound.
  $9D73 Activate the extension and seed its position from the bat's.
  $9D7E Point the bat at the top half of the expanded-bat sprites and the extension at the bottom half.
  $9D8A While the bat top is below the ceiling of its travel, nudge the bat up to make room. This frame grows by a single pixel.
  $9D9C With no room to make, the extension grows at the faster rate.
  $9D9E Grow the extension downward to the floor of the bat's travel, B px this frame.
  $9DB0 At that limit, stop the growth and back the bat up a pixel.
  $9DB7 Count this frame of the grow.
  $9DBC The counter reaches its limit on the 8th frame, which finishes the grow and clears the flag.
  $9DC1
@ $9DC2 label=fx_expand_shrink
  $9DC2 Block 6: bat-expand shrink, the reverse of block 5 over 8 frames. Armed when the last ball is lost, or another prize is taken, while the bat is expanded.
  $9DCC First frame: arm the bat-shrinks sound.
  $9DD1 Each frame the bat moves down 1 px and the extension pulls up 1 px.
  $9DDF The counter reaches its limit on the 8th frame, which finishes the shrink.
  $9DEA Clear the expand active flag.
  $9DED Deactivate the extension.
  $9DF2 Restore the normal bat sprite.
  $9DF8
@ $9DF9 label=fx_bomb_detonate
  $9DF9 Block 7: bomb detonation animation, 16 frames on the #R$8F7A(secondary object). Armed by the bomb prize.
  $9E03 First frame: arm the bomb sound.
  $9E08 Read the frame counter the two tests below branch on.
  $9E0F At frame 8, detonate the 3×3 blast.
  $9E12 Step the secondary object's sprite through the burst frame table.
  $9E2A Keep the secondary object active and count the frame, 16 in all. After the last, clear the flag.
  $9E3A Done: deactivate the secondary object.
  $9E3E
@ $9E3F label=fx_death_respawn
  $9E3F Block 8: the ball-loss death-and-respawn sequence, 99 frames. Armed at the end of #R$9FFF(the ball loss). The death-pause timer freezes the bat the whole time.
  $9E49 First frame: arm the death sound.
@ $9E4B isub=LD (death_burst_counter),A
  $9E4E Point at the bat object and read the frame counter.
  $9E55 When the explosion ends, deactivate the bat.
  $9E5D Frames 1–16: animate the bat sprite through the explosion frames of the burst frame table.
  $9E79 Hold until the post-death pause elapses.
  $9E85 Re-arm the pool to serve the next ball.
  $9E88
@ $9E89 label=fx_ball_gem
  $9E89 Block 9: spawn and fly the ball gem – the wave-script bonus target that pays ball B when ball A strikes it. The ball gem frame counter drives the spawn frames, then the in-flight update.
  $9E8F Activate the secondary object and look up this frame's sprite in the ball gem frame table, two bytes per frame.
  $9EAC At the end of the sequence the counter loops back to the start of the in-flight phase, which then repeats.
  $9EB3 While the gem still spawns – return until it starts to travel.
  $9EB8 Advance the gem in flight one travel step. It wanders on diagonal headings only.
  $9ECA Count the gem's travel steps. When the count reaches its span, end the flight.
  $9EDA Stop the gem and arm the despawn animation, block 11.
  $9EE1
  $9EE2 In flight: return while ball A is on the bat or captured.
  $9EEC Set the overlap operands and test the gem against ball A.
  $9EFC On an overlap with ball A, end the flight and arm the second-ball spawn, block 10.
  $9F03
@ $9F04 label=fx_ball_b_spawn
  $9F04 Block 10: spawn ball B after a 9-frame sprite animation on the secondary object. Armed when ball A strikes the ball gem.
  $9F0E First frame: play the spawn sound.
  $9F11 Step the secondary object's sprite from the spawn frame table.
  $9F2C Count the frame. Return until the animation ends, then clear the counter.
  $9F33 Set the two-ball flag.
  $9F38 Ball B launches on the heading opposite ball A's.
  $9F41 A result past the top of the heading range wraps back into it.
  $9F43 Store the result as ball B's own heading.
  $9F46 Make ball B the active ball.
  $9F4B Derive its velocity and copy ball A's speed into ball B. Clear ball B's re-hit gate, deflect cooldown, bounce count and catch bypass, and its pending heading with the flag that applies it.
  $9F67
@ $9F68 label=fx_obj2_despawn
  $9F68 Block 11: secondary-object despawn animation, 16 frames. Armed when the ball gem expires without a hit.
  $9F71 First frame: arm the death sound.
@ $9F73 isub=LD (death_burst_counter),A
  $9F76 Step the secondary object's sprite through the burst frame table.
  $9F8E 16-frame counter
  $9F96 Done: deactivate the secondary object.
  $9F9C
@ $9F9D label=remove_lost_ball
c $9F9D Remove a ball that has passed the bat's losing edge
D $9F9D Runs once per frame. Detects a ball that has traveled past the bat's own losing edge and removes it.
D $9F9D With two balls live, a lost ball B just ends two-ball mode with no life lost. A lost ball A goes to the #R$9FFF(ball-loss handler).
D $9F9D It does nothing while the #R$5B6A(level-cleared flag) holds object updates frozen or the #R$5B68(death pause) runs.
  $9F9D Skip while the level-cleared flag holds object updates frozen.
  $9FA2 Skip while the death pause runs.
  $9FA7 Bat on the left? Use the left-edge test.
  $9FAD Bat on the right: two balls live with the secondary object a real ball?
  $9FB9 Is ball B at or past the right edge? Drop ball B only.
@ $9FC4 label=lost_ball_a_right
  $9FC4 Is ball A at or past the right edge? Lose the ball.
  $9FCF
@ $9FD0 label=lost_ball_left
  $9FD0 Bat on the left: two balls live with the secondary object a real ball?
  $9FDC Is ball B past the left edge? Drop ball B only.
@ $9FE7 label=lost_ball_a_left
  $9FE7 Is ball A past the left edge? Lose the ball.
  $9FF2
@ $9FF3 label=lost_ball_drop_b
  $9FF3 Ball B out: end two-ball mode and clear the capture slide flag.
  $9FFA Deactivate the secondary object; ball A plays on without losing a life.
  $9FFE
@ $9FFF label=lose_ball
c $9FFF Handle the loss of a ball
D $9FFF A real ball B still in play is promoted to ball A, and play continues with no life lost.
D $9FFF On the last ball the player loses a life instead, and the death-and-respawn sequence takes over.
  $9FFF Two balls live and the secondary object a real ball? Promote the survivor.
  $A00B Clear two-ball mode and the capture slide flag.
  $A012 Deactivate the secondary object, the old ball B object.
  $A01A Overwrite ball A's ball state record with ball B's.
  $A025 Carry over ball B's heading and per-ball bytes.
  $A037 Move ball A to ball B's screen position. Play continues, no life lost.
  $A03D
@ $A03E label=lose_ball_last
  $A03E Last ball lost: deactivate every movable pool slot (ball A up through the inhabitants, 9-byte stride).
  $A04F If the bat is expanded, cancel its grow and arm its shrink, block 6 of the #R$9CB3(object manager), to retract the bat.
  $A05D If the missile-bat is up, cancel the swap to the missile sprite and arm block 3 of the #R$9CB3(object manager) to restore the normal bat.
  $A06B Zero the active-effect flags (glue, double bat, missile, the secondary object, double score and the rest).
@ $A08A isub=LD (inhabitant_records+$8),A
@ $A08A nowarn
  $A08A Zero the type field of each of the five inhabitant records so every inhabitant slot reads as empty and stops.
@ $A08D isub=LD (inhabitant_records+$18),A
@ $A08D nowarn
@ $A090 isub=LD (inhabitant_records+$28),A
@ $A090 nowarn
@ $A093 isub=LD (inhabitant_records+$38),A
@ $A093 nowarn
@ $A096 isub=LD (inhabitant_records+$48),A
@ $A096 nowarn
  $A099 Arm the death-and-respawn sequence, block 8 of the #R$9CB3(object manager).
  $A09D Decrement a life.
  $A0A0
@ $A0A1 label=run_prize_safety_net
c $A0A1 Animate the safety net prize's timed barrier (per-frame)
D $A0A1 Animates the safety net prize's barrier a step per frame: it brightens, holds, dims, then blanks.
  $A0A1 Idle until the safety net prize arms it.
  $A0A6 Arm the ramp.
  $A0AA Advance to the brighten phase and reset the step index.
  $A0B2 Lay the mirror side wall down at base brightness.
  $A0B5 Arm the safety net sound.
  $A0BA
@ $A0BB label=prize_net_ramp_up
  $A0BB Brighten the net one step per frame.
@ $A0BF isub=LD HL,safety_net_ramp_up
  $A0BF Index the upward attribute ramp by the step index.
  $A0CA Repaint the net's attributes.
  $A0D2 When the net is at full brightness, advance to the hold and clear the net back to base.
  $A0E1
@ $A0E2 label=prize_net_hold
  $A0E2 The timed hold
  $A0E9 Tick the #R$5B6D(hold timer) each frame. On the frame it wraps to 0, once every 256 frames, bump the step.
  $A0F0 On the fifth step, advance to the dim phase, reset the step and re-arm the sound.
  $A100
@ $A101 isub=LD HL,safety_net_ramp_fall
@ $A101 label=prize_net_ramp_down
  $A101 Dim the net with the downward ramp, one step per frame.
  $A114 When the net is dark, end the effect:
  $A118 Clear the phase.
  $A11B Erase the net from the side band.
  $A11E
@ $A11F label=safety_net_ramp_up
B $A11F,24,1 Upward attribute ramp for the flash
@ $A137 label=safety_net_ramp_fall
B $A137,24,1 Downward attribute ramp, the mirror of the #R$A11F(upward one)
@ $A14F label=bat_heading
g $A14F Per-slot heading codes, one per object-pool slot
B $A14F,1 The bat's heading cell, first of the per-slot heading codes
@ $A150 label=ball_a_heading
B $A150,1 Ball A's heading code
@ $A151 label=ball_b_heading
B $A151,1 Ball B's heading code
@ $A152 label=inhabitant_heading
B $A152,5 The five inhabitants' heading codes
@ $A157 label=pending_heading_base
g $A157 Pending inhabitant-deflection headings, one cell per pool slot
B $A157,1 The bat's cell, first of the pending-heading array. Unused.
@ $A158 label=pending_heading_a
B $A158,1 Ball A's pending inhabitant-deflection heading
@ $A159 label=pending_heading_b
B $A159,1 Ball B's pending inhabitant-deflection heading
B $A15A,5 The inhabitants' pending-heading cells. Unused.
@ $A15F label=apply_heading_base
g $A15F Apply-queued-heading flags, one cell per pool slot
B $A15F,1 The bat's cell, first of the apply-heading flags. Unused.
@ $A160 label=apply_heading_a
B $A160,1 Ball A's apply-queued-heading flag
@ $A161 label=apply_heading_b
B $A161,1 Ball B's apply-queued-heading flag
B $A162,5 The inhabitants' apply-heading cells. Unused.
@ $A167 label=update_balls
c $A167 Update the balls for this frame
D $A167 Drives the one or two balls in play, once per frame.
  $A167,4 Does the death pause run? The bat freezes on the same flag.
  $A16C While ball A is captured, skip its move and deflect; jump to ball B.
  $A172 Ball A re-hit gate. Left idle, the #R$A343(move pass) runs this frame. When armed, it adds the speed and runs the pass only once the sum crosses the gate. The #R$A4DD(heading store) arms it on each reflection. The #R$A4F6(position step) is not gated.
@ $A188 label=update_balls_move_a
  $A188 Take ball A as the active ball and run its move pass.
@ $A18F label=update_balls_deflect_a
  $A18F Ball A inhabitant-deflect cooldown: left idle, the deflect test runs. When armed, it adds the speed each frame and skips the deflect until the sum crosses the threshold. It then clears it.
@ $A1A5 label=update_balls_a_post
  $A1A5 Clear ball A's bat-catch bypass for the frame.
  $A1A8 Run ball A's inhabitant-overlap deflection unless it is on the bat or its move gate suppressed the probe.
  $A1B4 Take ball A as the overlap subject and deflect it off the first solid pool object it overlaps.
@ $A1BC label=update_balls_ball_b
  $A1BC Ball B runs only while it is in play; otherwise jump to the queued-heading pass.
  $A1C2 Ball B re-hit gate, same as ball A's but with ball B's speed as the addend
@ $A1D8 label=update_balls_move_b
  $A1D8 Take ball B as the active ball and run its move pass.
@ $A1E0 label=update_balls_deflect_b
  $A1E0 The missile shot skips its deflect cooldown and the deflect test.
  $A1E6 Ball B inhabitant-deflect cooldown. While it is non-zero, ball B skips its deflect test. Each frame it adds a ball speed, and it clears once the sum crosses the threshold. BUG: it adds ball A's speed, where ball B's move gate uses #R$5B16(ball B's). Ball B's deflect-suppression window therefore drains at ball A's speed.
@ $A1FC label=update_balls_b_post
  $A1FC Clear ball B's bypass the same way.
  $A200 Deflect ball B unless it is parked on the bat or its move gate suppressed the probe.
  $A20C Take ball B as the overlap subject and deflect it off the first solid pool object it overlaps.
@ $A214 label=update_balls_queued_a
  $A214 Apply any heading queued for ball A by an earlier deflection, unless ball A is captured.
  $A21A If ball A has no queued heading, skip to ball B's.
  $A220 Consume the queued-heading flag.
  $A224 If ball B is on the bat, set ball A's bypass so its next bat hit is a plain bounce.
@ $A22F label=update_balls_arm_cool_a
  $A22F Arm the deflect cooldown if it does not already run.
@ $A23A label=update_balls_apply_dir_a
  $A23A Apply the queued heading: copy ball A's pending deflection heading into its heading code.
  $A240 Select ball A and re-derive its velocity.
@ $A247 label=update_balls_queued_b
  $A247 Apply ball B's queued heading only while it is in play.
  $A24D If ball B's apply-heading flag is clear, finish.
  $A253 Consume ball B's queued-heading flag.
  $A257 If ball A is on the bat, set ball B's bypass.
@ $A262 label=update_balls_arm_cool_b
  $A262 Arm ball B's deflect cooldown if idle.
@ $A26D label=update_balls_apply_dir_b
  $A26D Apply ball B's pending heading into its heading code.
  $A273 Select ball B and re-derive its velocity.
@ $A27B label=update_balls_finish
  $A27B Resolve each ball's bounce off the bat.
  $A27E Advance ball A's on-screen position unless ball A is captured.
  $A28B Advance ball B's position too when it is in play.
  $A298
@ $A299 label=collision_probe
c $A299 Test for a collision ahead of the ball
D $A299 Tests the tile-map cell ahead of the ball. A brick there takes the #R$A99B(hit) on contact.
R $A299 I:B offset from the active ball's probe origin to the cell to test
R $A299 O:A 1 when the cell blocks, 0 when free
  $A299 Start from the active ball's probe origin.
  $A29C Offset by B to the cell under test.
  $A2A0 For the missile shot, a wall or border tile arms the retract and reports the cell blocked. Any other tile goes through the normal classification below.
  $A2BA
@ $A2BB label=collision_probe_classify
  $A2BB Read the tile in the cell.
  $A2BC Space? The cell is empty – free.
  $A2C0 A solid wall or border – blocked
  $A2C4 A passable tile – free
  $A2C8 A tile past the brick tiles – free. Anything left is a brick.
  $A2CC Mark this as a ball hit.
  $A2D0 Break, degrade or flash the brick by its class.
@ $A2D3 label=collision_probe_blocked
  $A2D3 Report the cell as solid.
  $A2D5
@ $A2D6 label=collision_probe_free
  $A2D6 Report the cell as free.
  $A2D7
@ $A2D8 label=set_ball_velocity
c $A2D8 Set a ball's velocity from its heading code
D $A2D8 Derives the active ball's per-axis step thresholds and signs from its heading code, through the #R$A594(velocity table).
  $A2D8 Select the active ball state record; this arm takes ball A.
  $A2E4 This arm takes ball B.
  $A2E8 Index the heading array by the ball's slot.
  $A2EF Read this ball's heading code.
  $A2F0 A heading code below the range is out of bounds.
  $A2F4 One above it is out of bounds too.
  $A2F8 Either way reset it to the default heading, 72° up-right.
  $A2FD Test the heading code against the four pure-axis headings – due right, straight up, due left and straight down.
  $A30D Any of them is nudged six codes counterclockwise, which avoids a flat endless bounce. Due right becomes 27°, straight up 125°, due left 207° and straight down 305°.
  $A310 Index the velocity table by the heading code's offset into the range, three bytes each.
  $A31D Store the X step threshold.
  $A321 Store the Y step threshold.
  $A327 X direction sign from the sign byte
  $A331 Y direction sign from the same byte
  $A336 The new heading takes the ball off the bat and restarts both sub-pixel accumulators.
  $A340
@ $A341 label=ball_cell_ptr
g $A341 Active ball's tile-map probe origin (two bytes, little-endian)
@ $A343 label=move_ball
c $A343 Move the active ball and detect bounces
D $A343 Probes the cell ahead of the active ball on each axis with the #R$A299(collision probe). A wall or brick hit reflects its heading.
  $A343 Clear the two axis bounce codes and the axis count before this move.
  $A355 This arm takes ball A's state record.
@ $A35B label=move_ball_use_b
  $A35B Otherwise it is ball B's.
@ $A35F label=move_ball_probe_x
  $A35F Find the active ball's probe origin and keep it.
  $A36A Probe one tile ahead in the ball's X direction for a wall or brick. A leftward sign probes the tile to the left and flags the leftward bounce code.
@ $A383 label=move_ball_probe_x_pos
  $A383 A rightward sign probes that side and flags the rightward code.
@ $A393 label=move_ball_check_y
  $A393 With the X axis settled, the missile shot returns here, with no Y probe and no reflection.
@ $A39E label=move_ball_probe_y
  $A39E Probe one tile ahead in Y and flag a Y bounce. An upward sign probes the tile above.
@ $A3B7 label=move_ball_probe_y_pos
  $A3B7 A downward sign probes the tile below and flags the downward bounce code.
@ $A3C8 label=move_ball_resolve
  $A3C8 Nothing hit – return. Otherwise turn the bounce flags into a reflected heading.
@ $A3DE label=move_ball_corner
  $A3DE Both axes hit (a corner): look up the diagonal bounce code.
@ $A3E3 label=move_ball_corner_loop
  $A3E3 Each record holds the two axis codes and the diagonal bounce code they yield; compare this one's X code, then its Y code.
@ $A3F5 label=move_ball_corner_skip
  $A3F5 The X code did not match, so this record's Y byte is skipped as well.
@ $A3F6 label=move_ball_corner_next
  $A3F6 Step over the rest of the record and try the next one.
@ $A3FA label=move_ball_reflect
  $A3FA Mirror the heading about the axis it struck. B takes the ball's current heading, and the reflection table indexed by the bounce code gives the axis. The reflected heading lies as far past the axis as the current one lies short of it.
@ $A413 label=move_ball_adj_quadrant
  $A413 Bias by a half-turn. A result below the heading space wraps up a full turn.
  $A41D One above it wraps down a full turn.
  $A423 Recover the pointer to the heading byte.
@ $A424 label=move_ball_q48
  $A424 C now holds the reflected heading and B the reference heading of the axis it struck, which names the way it came in. The cases below fold C into the arc that axis allows it to leave on. Came in due right: leave between 90° and 264°.
  $A434 Outside that arc: take off a half-turn, and wrap up a full turn if that drops below the space.
@ $A440 label=move_ball_q5a
  $A440 Came in straight up: leave between 180° and 356°.
@ $A456 label=move_ball_q6c
  $A456 Came in due left: leave between 270° and 84°.
@ $A46D label=move_ball_q7e
  $A46D Came in straight down: leave between 0° and 176°.
@ $A480 label=move_ball_q51
  $A480 Came in on the up-right diagonal: leave between 139° and 315°.
@ $A48D label=move_ball_q51_wrap
  $A48D Outside that arc: take off a half-turn, and wrap up a full turn if that drops below the range.
@ $A497 label=move_ball_q63
  $A497 Came in on the up-left diagonal: leave between 221° and 35°.
@ $A4AE label=move_ball_q75
  $A4AE Came in on the down-left diagonal: leave between 319° and 135°.
@ $A4C5 label=move_ball_q87
  $A4C5 A reference heading that matches none of the eight leaves the reflected heading alone.
@ $A4CC label=move_ball_q87b
  $A4CC Came in on the down-right diagonal: leave between 41° and 215°.
@ $A4D5 label=move_ball_clamp_final
  $A4D5 Outside that arc: take off a half-turn, and wrap up a full turn if that drops below the range.
@ $A4DD label=move_ball_store
  $A4DD Store the new heading, arm the move gate that debounces a re-hit, and re-derive the ball's velocity.
  $A4E5
@ $A4E6 label=unused_a4e6
u $A4E6 Unused bytes
S $A4E6,16
@ $A4F6 label=step_ball
c $A4F6 Advance the active ball by its velocity
D $A4F6 Advances the active ball one frame. Its pool object moves by the pixels its sub-pixel accumulators earn.
  $A4F6 Select the active ball state record: this arm takes ball A.
@ $A502 label=step_ball_use_b
  $A502 This arm takes ball B.
@ $A506 label=step_ball_init_passes
  $A506 Reset its pass counter.
@ $A50A label=step_ball_pass
  $A50A Each pass: clear the X-step flag.
  $A50E Does the X axis move? (a zero threshold means no X motion)
  $A514 Each pass adds a fixed sub-pixel increment to the X accumulator.
@ $A516 label=step_ball_x_accumulate
  $A516 It goes on one unit at a time.
  $A519 Each unit is weighed against the threshold.
  $A522 At that value, the accumulator wraps and flags an X pixel step.
@ $A52A label=step_ball_x_loop
  $A52A Repeat until the pass's five sub-pixel units are done.
@ $A52C label=step_ball_y_axis
  $A52C Same for the Y axis, on its own accumulator and threshold.
@ $A538 label=step_ball_y_accumulate
  $A538 Add one sub-pixel unit to the Y accumulator and weigh it against the threshold.
  $A544 At the threshold, the accumulator wraps and flags a Y pixel step.
@ $A54C label=step_ball_y_loop
  $A54C Repeat until the pass's five sub-pixel units are done.
@ $A54E label=step_ball_locate_object
  $A54E Point IX at the ball's screen object.
@ $A55A label=step_ball_object_b
  $A55A Ball B steers its own record instead.
@ $A55E label=step_ball_apply_x
  $A55E Did X step on the current pass?
  $A564 If so, a leftward X sign moves the object one pixel left.
@ $A56F label=step_ball_x_positive
  $A56F A rightward sign moves it right.
@ $A572 label=step_ball_apply_y
  $A572 Did Y step on the current pass?
  $A578 If so, an upward Y sign moves it one pixel up.
@ $A583 label=step_ball_y_positive
  $A583 A downward sign moves it down.
@ $A586 label=step_ball_next_pass
  $A586 Count the pass and loop until passes are done.
@ $A594 label=velocity_table
b $A594 Ball velocity vectors by heading
N $A594 One row per heading code, from $48 at due right, then counterclockwise. Three bytes per heading. #TABLE(default) { =h Offset | =h Field | =h What it holds } { +0 | X step threshold | sub-pixel units per on-screen X step, so smaller is faster } { +1 | Y step threshold | the same, on the Y axis } { +2 | Direction signs | bit 4 set for right, bit 0 set for down } TABLE#
N $A594 A zero threshold stops all steps on that axis.
B $A594,216,3
  $A594 0°, due right – a principal heading
  $A597 4°, up-right
  $A59A 8°, up-right
  $A59D 12°, up-right
  $A5A0 18°, up-right
  $A5A3 23°, up-right
  $A5A6 27°, up-right
  $A5A9 29°, up-right
  $A5AC 35°, up-right
  $A5AF 41°, up-right diagonal – a principal heading
  $A5B2 45°, up-right
  $A5B5 52°, up-right
  $A5B8 55°, up-right
  $A5BB 60°, up-right
  $A5BE 65°, up-right
  $A5C1 72°, up-right
  $A5C4 79°, up-right
  $A5C7 84°, up-right
  $A5CA 90°, straight up – a principal heading
  $A5CD 96°, up-left
  $A5D0 101°, up-left
  $A5D3 108°, up-left
  $A5D6 115°, up-left
  $A5D9 120°, up-left
  $A5DC 125°, up-left
  $A5DF 128°, up-left
  $A5E2 135°, up-left
  $A5E5 139°, up-left diagonal – a principal heading
  $A5E8 145°, up-left
  $A5EB 151°, up-left
  $A5EE 153°, up-left
  $A5F1 157°, up-left
  $A5F4 162°, up-left
  $A5F7 168°, up-left
  $A5FA 172°, up-left
  $A5FD 176°, up-left
  $A600 180°, due left – a principal heading
  $A603 184°, down-left
  $A606 188°, down-left
  $A609 192°, down-left
  $A60C 198°, down-left
  $A60F 203°, down-left
  $A612 207°, down-left
  $A615 209°, down-left
  $A618 215°, down-left
  $A61B 221°, down-left diagonal – a principal heading
  $A61E 225°, down-left
  $A621 232°, down-left
  $A624 235°, down-left
  $A627 240°, down-left
  $A62A 245°, down-left
  $A62D 252°, down-left
  $A630 259°, down-left
  $A633 264°, down-left
  $A636 270°, straight down – a principal heading
  $A639 276°, down-right
  $A63C 281°, down-right
  $A63F 288°, down-right
  $A642 295°, down-right
  $A645 300°, down-right
  $A648 305°, down-right
  $A64B 308°, down-right
  $A64E 315°, down-right
  $A651 319°, down-right diagonal – a principal heading
  $A654 325°, down-right
  $A657 331°, down-right
  $A65A 333°, down-right
  $A65D 337°, down-right
  $A660 342°, down-right
  $A663 348°, down-right
  $A666 352°, down-right
  $A669 356°, down-right
@ $A66C label=bounce_axis_dirs
b $A66C Bounce-axis reference headings for the wall/brick reflection
D $A66C Holds the principal heading of each struck axis, indexed by the bounce code.
@ $A674 label=corner_bounce_codes
b $A674 Corner-bounce lookup for a two-axis hit
D $A674 Each three-byte record holds an X-axis bounce code, a Y-axis bounce code, and the diagonal bounce code a hit on both yields. That code indexes the #R$A66C(bounce-axis reference headings).
B $A674,12,3
@ $A680 label=ball_object_deflect
c $A680 Deflect the active ball off a solid pool object it overlaps
D $A680 Deflects the active ball off the first solid pool object it overlaps. It queues the reflected heading, which the #R$A167(ball update) applies later in the same frame.
  $A680 Start the candidate scan in #REGc at the first pool slot after the bat.
N $A682 The second-bat skip is one-sided. A scan for ball B still tries ball A. Ball A's sprite pointer sits below the pass-through window, so ball B does deflect off ball A. While the double bat prize is not in effect, ball A and a real ball B deflect off each other here.
  $A682 With the second bat in play, skip the slot that fills with it.
  $A68D Skip the ball's own slot.
  $A694 Set the second overlap operand to the candidate slot.
  $A69B On an overlap, deflect; otherwise fall through to the next slot.
  $A69E Advance to the next slot; stop after the last inhabitant slot with nothing queued.
  $A6A5 Point #REGhl at the struck object's record in the object pool, 9 bytes per slot.
  $A6B2 Fetch the record's sprite-data pointer.
N $A6BA Solidity is the struck object's sprite-data pointer. A pointer inside the window that starts at the #R$5DC0(first death-burst frame) is pass-through and deflects nothing. One below or above it is solid. The window covers exactly the eight death-burst and four spawn-flash frames. A ball passes through an inhabitant only while it spawns or explodes.
  $A6BA Solidity test: a sprite-data pointer inside the fixed window is non-solid, so return without a deflection. Below or above the window, the object is solid and deflects.
  $A6CA Read the ball's heading code, indexed by its slot, into #REGb.
  $A6D6 Read the struck object's heading code from the same array, into #REGc.
N $A6DD The new heading mirrors the struck object's heading about the ball's, then turns it a half-turn. Both heading codes come from the #R$A14F(heading array). One full-turn step folds the result back toward the valid range, and an extreme pair can still overshoot it. That is harmless, because the #R$A2D8(velocity setup) resets any heading outside the range to the default before it indexes the velocity table.
  $A6DD Mirror the struck object's heading about the ball's, then add a half-turn; see the routine notes.
  $A6E2 Fold the heading back into its band with one full-turn step either way.
  $A6EA Above the band instead: take a full turn back off.
  $A6F0 Stash the new heading, then point #REGhl at this ball's pending-heading cell.
  $A6FB Store the pending heading.
  $A6FD Set this ball's apply flag so the #R$A167(ball update) turns it onto the heading later in the same frame.
  $A703 Select the active ball state record for the bounce count; this arm takes ball A.
  $A70F This arm takes ball B.
  $A713 Count the bounce against the rally interval.
  $A716
@ $A717 label=overlap_pair
c $A717 Overlap test between two named objects
D $A717 Reports whether the two objects named by the overlap operands touch. An inactive object never overlaps.
R $A717 O:A 1 when the two objects overlap on both axes, else 0
  $A71A Look up the first overlap operand's sprite record into IX.
  $A720 First overlap operand inactive? Then there is no overlap.
  $A726 Save the first overlap operand's position (X in D, Y in E) across the second lookup.
  $A72D Look up the second overlap operand's sprite record into IX, and restore the first's X,Y into DE.
  $A734 Second overlap operand inactive? Then there is no overlap.
N $A73A The accepted band reaches 12 pixels one way and 11 the other, on both axes.
  $A73A Subtract the second overlap operand's X from the first's.
  $A73E Fold a negative distance to its magnitude. The CPL leaves it one short.
@ $A742 label=overlap_pair_dx
  $A742 Too far apart on X? Then there is no overlap. The band is off-center, so a swap of the two slots moves the accepted box by a pixel.
  $A746 Subtract the second overlap operand's Y from the first's.
  $A74A Fold a negative Y distance the same way.
@ $A74E label=overlap_pair_dy
  $A74E Too far apart on Y? Then there is no overlap.
  $A752 Within 12 px on both axes: report an overlap.
  $A757
@ $A758 label=overlap_pair_no
  $A758 No overlap, or an object inactive
  $A75C
@ $A75D label=resolve_ball_sel
g $A75D Which-ball selector for bounce resolution
B $A75D,1 0 for ball A, 1 for ball B
@ $A75E label=resolve_ball_bounces
c $A75E Resolve both balls' bounces for the frame
D $A75E Resolves ball A's bounce, then ball B's while it is in play. Falls through into the #R$A777(bat bounce) for ball B.
  $A75E Select ball A in the which-ball selector.
  $A762 Point IY at ball A's state.
  $A769 Stop here unless ball B is in play.
  $A76E Select ball B in the which-ball selector.
  $A773 Point IY at ball B's state, then fall through into the #R$A777(bat bounce) for ball B.
@ $A777 label=ball_bounce
c $A777 Resolve a ball bounce
D $A777 Reflects the selected ball off the bat, and off the second bat the same way.
R $A777 I:IY the selected ball state record
  $A777 A ball that already sits on the bat is in contact: skip the gap tests and resolve it as a hit.
  $A77E With the second bat in play, first test ball A and the second bat against the return window.
  $A784 Read both records' positions.
  $A798 Take the Y gap between them. A negative gap folds to one less than its magnitude, as in the #R$A717(overlap test).
@ $A79E label=ball_bounce_bat2_dy
  $A79E Hold the Y gap inside the return window, then measure the X gap. A positive gap is held to it directly.
@ $A7AB label=ball_bounce_bat2_dxneg
  $A7AB A negative gap folds to one less than its magnitude, so this side of the window reaches a pixel further.
@ $A7B0 label=ball_bounce_vs_bat
  $A7B0 Main path: reflect this ball off the bat. Ball A reads its own pool record.
@ $A7BC label=ball_bounce_pick_b
  $A7BC Ball B reads its own.
@ $A7C0 label=ball_bounce_read_bat
  $A7C0 Take the ball's and the bat's positions for the gap tests below.
  $A7D0 Measure the Y gap between the ball and the bat; a positive one carries straight to the expanded-bat test.
  $A7D5 A negative gap folds one short of its magnitude, and that path skips the expanded-bat test.
@ $A7D8 label=ball_bounce_expand_test
  $A7D8 With the bat expanded the hit window reaches further, so a wider gap still counts.
@ $A7E0 label=ball_bounce_expand_dy
@ $A7E3 label=ball_bounce_restore_dy
  $A7E3 Swap the gap back for the 12-px test below. The expanded path is the exception. It arrives here after its own 28-px test passes, and gets the flag byte back instead. That test then passes on the flag, so the 28 is the only Y bound on this side.
@ $A7E4 label=ball_bounce_check_dy
  $A7E4 Hold the ball inside the Y window of the bat, then measure the X gap.
@ $A7EC label=ball_bounce_check_dx
@ $A7F1 label=ball_bounce_dx_neg
  $A7F1 A negative X gap folds one short and is held to the same window.
@ $A7F5 label=ball_bounce_hit_left
  $A7F5 Ball to the left of the bat: it counts as a hit only while it travels rightward. The impact side records as the left one.
@ $A800 label=ball_bounce_hit_right
  $A800 Ball to the right: it only counts while it travels leftward, and the impact side records as the right one.
@ $A80A label=ball_bounce_after_hit
  $A80A Bat-catch bypass set for this ball? Jump straight to the bat-angle bounce. That skips the #R$A954(catch test), the combo reset and the rally speed step. Otherwise run the catch test, and stop while it holds the ball.
  $A81B Reset the combo of whichever ball struck, so a fresh run of bricks scores from the bottom again. This arm is ball A's.
@ $A821 label=ball_bounce_reset_combo
  $A821 This arm is ball B's.
@ $A825 label=ball_bounce_speed_up
  $A825 Then count the bounce toward the rally speed step.
@ $A828 label=ball_bounce_angle
  $A828 Compare the ball against the bat for the angle bounce, ball A from its own pool record.
@ $A834 label=ball_bounce_angle_b
  $A834 Ball B compares from its own.
@ $A838 label=ball_bounce_hit_offset
  $A838 Take both Y positions for the offset that picks the reflection angle.
  $A847 An expanded bat uses the expanded-bat angle tables, and the impact side picks which.
@ $A858 label=ball_bounce_exp_table_b
  $A858 A strike right of the bat's origin takes the expanded bat's right-side table.
@ $A85D label=ball_bounce_normal
  $A85D A normal bat uses the narrow pair, and the impact side picks again.
@ $A868 label=ball_bounce_normal_b
  $A868 Here too a strike right of the bat's origin takes the right-side table.
@ $A86B label=ball_bounce_apply_angle
  $A86B Index the chosen table by the impact offset and take the new heading.
  $A888
@ $A889 label=object_slot_ptr
c $A889 Point IX at an object-pool slot by index
D $A889 Points IX at one pool slot's sprite record. The index is not bounds-checked against the live slot count.
R $A889 I:A slot index (0-based) into the object pool
R $A889 O:IX address of that slot's 9-byte record
  $A889 Start at the pool's first slot; a zero index returns it unchanged.
  $A88F Set up the walk: the slot index in B, the record size in DE.
@ $A893 label=object_slot_ptr_step
  $A893 Step IX one record per slot, which leaves it on the object's record.
  $A897
@ $A898 label=bat_angle_norm_a
b $A898 Bat-bounce angles (normal bat)
D $A898 Holds the heading a ball leaves the bat on, indexed by its impact offset along the bat.
B $A898,32,8 Ball hit left of the origin
@ $A8B8 label=bat_angle_norm_b
B $A8B8,32,8 Ball hit right of the origin
@ $A8D8 label=bat_angle_exp_a
b $A8D8 Bat-bounce angles (expanded bat)
D $A8D8 Holds the heading a ball leaves the expanded bat on, indexed by its impact offset along the bat.
B $A8D8,48,8 Ball hit left of the origin
@ $A908 label=bat_angle_exp_b
B $A908,48,8 Ball hit right of the origin
@ $A938 label=ball_accelerate
c $A938 Speed the ball up as the rally continues
D $A938 Counts a ball's bounces and raises its speed a step at each rally interval, so a long rally ends fast.
R $A938 I:IY the ball state record
  $A938 Bump this ball's bounce count and stash the new value.
  $A93F The rally interval is the number of bounces between speed steps.
  $A944 Counter short of the interval? Leave the speed unchanged.
  $A946 Interval reached: restart the bounce count for the next step.
  $A94A,5 Ball speed is capped; stop if it is already at the cap.
  $A950,3 Raise the ball's speed by one step.
@ $A954 label=ball_catch_test
c $A954 Hold a ball on the bat, and release it
D $A954 Holds a ball on the bat until fire, a release request, or 250 frames. When a ball arrives at the bat, the bat catches it only while the glue prize is active.
N $A954 A ball parked for a serve is held the same way. The serve setup raises its stuck flag, so from its first frame it takes the held branch whether or not glue is active. The serve comes on fire or on a release request, and otherwise by itself after 250 frames.
N $A954 Only a glue catch and the level setup clear the hold timer, and the promotion of ball B copies its timer over ball A's. A release leaves the timer where it stands, so a serve after a lost ball resumes that count. After a fire release the serve comes that much sooner. After a timeout release the count runs through the wrap, so it takes 256 frames.
N $A954 The hold timer, the release request and the fire press are each checked every frame while the ball is held.
R $A954 I:IY the ball state record
R $A954 O:A 1 to bounce off the bat, 0 while the ball is held
  $A954 Not already stuck to the bat? Handle the ball's arrival.
  $A95A Held: advance the hold timer.
  $A960 Release once the hold timer runs out.
  $A964 Release if a new prize has requested it.
  $A96A Release on a fire press; otherwise hold the ball.
@ $A971 label=catch_release
  $A971,8 Release: clear the request latch and the caught flag, and report a bounce.
@ $A97A label=catch_on_arrival
  $A97A A fresh arrival: catch the ball only while the glue prize is active.
  $A980,5 Glue off: clear the request latch and report a normal bounce.
@ $A986 label=catch_hold_ball
  $A986 Catch the ball: set the caught flag.
  $A98B Freeze it on the bat: zero both step thresholds.
  $A992 Restart the hold timer.
@ $A995 label=catch_stay_held
  $A995,4 Held this frame: clear the request latch and report no bounce.
@ $A99A label=prize_reveal_tune_gate
g $A99A Prize-reveal tune gate
D $A99A Zero when silent, 1 when the prize-reveal tune is armed, and above 1 while it plays.
@ $A99B label=hit_brick
c $A99B Register a brick hit
D $A99B Resolves a hit on a brick: it classifies the tile's durability and queues the break animation the brick-field sweep plays.
R $A99B I:HL tile-map address of the struck brick
  $A99B Align the struck brick's tile-map address and save it for the rest of the hit.
  $A9A2 Pick the brick field's first cell in the tile map. With the bat on the right, the field starts at column 2.
@ $A9A8 isub=LD DE,TILEMAP_BASE+$82
@ $A9AD isub=LD DE,TILEMAP_BASE+$8C
@ $A9AD label=hit_brick_left_bat
  $A9AD With the bat on the left, the field starts at column 12.
@ $A9B0 label=hit_brick_calc_index
  $A9B0 Convert the brick's tile-map position into its offset in the brick state map, the brick index doubled.
@ $A9C9 label=hit_brick_row_loop
  $A9CE Save the brick's state-map offset.
  $A9D1 Branch on what struck the brick. A ball goes to the missile-shot test, and the starburst clears the brick outright. An inhabitant goes to the durability check.
@ $A9DE label=hit_brick_normal_path
  $A9DE A ball hit: only the secondary object that carries the missile shot force-clears the brick, and it sounds its own break note first. Ball A and a real ball B jump to the classifier.
@ $A9ED label=hit_brick_mark
  $A9ED Queue the plain shatter in the brick's state map entry, from sub-frame zero, and score the combo. No durability check runs, so any tile empties, the golden brick included.
  $A9FF
@ $AA00 label=hit_brick_classify
  $AA00 Walk the durability table from its first class with the struck brick's tile in hand.
@ $AA08 label=hit_brick_scan
  $AA08 A terminator byte closes the class the counter is on.
  $AA0D Bump the counter; run out of classes and the tile is unclassified, so the hit is dropped.
  $AA12 Otherwise continue the scan.
@ $AA14 label=hit_brick_scan_match
  $AA14 A byte equal to the struck tile names its class.
@ $AA17 label=hit_brick_scan_next
  $AA17 Step to the next tile code and continue the walk.
@ $AA1B label=hit_brick_found
  $AA1B Only the prize classes reach the reveal roll.
  $AA20 Skip the finished markers too.
  $AA24 An inhabitant step reveals nothing.
  $AA2A While the ball gem is out, a prize that claims the secondary object cannot be revealed.
  $AA30 The secondary object carries a ball while the missile shot or a real ball B is out. While it does, a prize that claims the secondary object cannot be revealed either.
@ $AA36 label=hit_brick_force_shatter
  $AA36 Force each prize that claims the secondary object down the plain path. This test is the bomb.
  $AA3B This one is the missile prize.
  $AA3F This one is the double bat prize.
@ $AA43 label=hit_brick_prize_roll
  $AA43 Prize-reveal 50/50 for a prize brick: the low bit of the latest random number. One outcome keeps the brick's own class, whose break animation ends on that class's prize glyph. A later hit takes the prize through the #R$B0DF(prize handler). The other falls through to the plain break animation, which shatters the slot empty.
@ $AA4A label=hit_brick_shatter
  $AA4A The force paths land here: the brick takes the plain break sequence whatever its own class was.
@ $AA4C label=hit_brick_pick_sound
  $AA4C The resolved class picks the sound: the plain break path plays the brick-destroyed sound.
@ $AA56 label=hit_brick_chirp_sound
  $AA56 The golden and silver brick classes play the brick-survives sound instead. The prize classes stay silent here and arm the tune below.
@ $AA5F label=hit_brick_arm_prize_tune
  $AA5F Reached when a struck brick's resolved durability class is a prize class. Arm the prize-reveal tune, then fall through to the #R$AA64(break-animation queue), which queues the reveal sequence and scores the hit.
@ $AA64 label=hit_brick_queue_anim
  $AA64 Queue the resolved class in the brick's state map entry, from sub-frame zero, so the brick-field sweep plays its break sequence.
  $AA78
@ $AA79 label=brick_state_map
g $AA79 Brick state map
D $AA79 Per-brick state over the 9×9 field, two bytes per brick slot. The first is the class whose break animation the slot plays, or 0 for none. The second is its sub-frame counter. While a revealed glyph rests in the slot, the first holds the finished marker, or the slow ball glyph's loop class. The counter then times the glyph's lifetime.
S $AA79,162
@ $AB1B label=brick_durability_classes
b $AB1B Tile-code to durability-class table
D $AB1B Maps a brick's tile code to its durability class.
N $AB1B Runs of tile codes, each closed by $FF. A run's position is its class number.
B $AB1B,23,8*2,7 Plain bricks, every prize glyph, and the silver bricks' last-hit faces
B $AB32,18,8*2,2 The golden brick, in its plain face and in every frame of its twinkle and gleam
B $AB44,2,1 Silver-1 brick, unhit
B $AB46,2,1 Silver-1 brick after one hit
B $AB48,2,1 Silver-2 brick, unhit
B $AB4A,1,1 No tiles
B $AB4B,2,1 Glue prize brick
B $AB4D,2,1 Bomb prize brick
B $AB4F,2,1 Missile prize brick
B $AB51,2,1 Expand prize brick
B $AB53,2,1 Double bat prize brick
B $AB55,2,1 Double score prize brick
B $AB57,2,1 Extra life prize brick
B $AB59,2,1 Slow ball prize brick
B $AB5B,2,1 Safety net prize brick
B $AB5D,1 No tiles
B $AB5E,1 No tiles
B $AB5F,1 No tiles
@ $AB60 label=anim_brick
b $AB60 Brick break-animation sequences
D $AB60 Holds one break-animation sequence per durability class.
N $AB60 Little-endian pointers head the block, one per class from the lowest up, and the sequences follow.
W $AB60,2 The plain shatter, which settles the cell empty
W $AB62,2 The golden brick's hit flash, which settles it back to its own face
W $AB64,2 The silver-1 brick's first degrade step
W $AB66,2 The silver-1 brick's second degrade step
W $AB68,2 The silver-2 brick's one degrade step
W $AB6A,2 The golden brick's gleam, which settles back to its plain face. Unused.
N $AB6C The prize sequences share every sub-frame but the last, which leaves the prize's glyph in the cell. Only one sub-frame carries attribute bytes: bright yellow ink down the left column and bright green down the right.
W $AB6C,2 Reveals the glue glyph
W $AB6E,2 Reveals the bomb glyph
W $AB70,2 Reveals the missile glyph
W $AB72,2 Reveals the expand glyph
W $AB74,2 Reveals the double bat glyph
W $AB76,2 Reveals the double score glyph
W $AB78,2 Reveals the extra life glyph
W $AB7A,2 Reveals the slow ball glyph's first frame
W $AB7C,2 Reveals the safety net glyph
W $AB7E,2 The finished marker: a revealed glyph rests in the cell
W $AB80,2 The slow ball glyph's four-frame loop
W $AB82,2 The golden brick's idle twinkle
@ $AB84 label=break_class1
N $AB84 A sequence is a run of 8-byte sub-frames. The first four bytes are the cell's 2×2 tile codes, in the order top-left, top-right, bottom-left, bottom-right. The last four are those quadrants' attribute bytes, or $FF and three unused bytes to leave the cell's attribute as it is. A sub-frame whose first byte is $FF ends the sequence, and only that byte is stored.
B $AB84,72,8
B $ABCC,1 End of sequence
@ $ABCD label=break_class2
B $ABCD,24,8
B $ABE5,1 End of sequence
@ $ABE6 label=break_class3
B $ABE6,24,8
B $ABFE,1 End of sequence
@ $ABFF label=break_class4
B $ABFF,24,8
B $AC17,1 End of sequence
@ $AC18 label=break_class5
B $AC18,24,8
B $AC30,1 End of sequence
@ $AC31 label=break_class6
B $AC31,48,8
B $AC61,1 End of sequence
@ $AC62 label=break_class7
B $AC62,64,8
B $ACA2,1 End of sequence
@ $ACA3 label=break_class8
B $ACA3,64,8
B $ACE3,1 End of sequence
@ $ACE4 label=break_class9
B $ACE4,64,8
B $AD24,1 End of sequence
@ $AD25 label=break_class10
B $AD25,64,8
B $AD65,1 End of sequence
@ $AD66 label=break_class11
B $AD66,64,8
B $ADA6,1 End of sequence
@ $ADA7 label=break_class12
B $ADA7,64,8
B $ADE7,1 End of sequence
@ $ADE8 label=break_class13
B $ADE8,64,8
B $AE28,1 End of sequence
@ $AE29 label=break_class14
B $AE29,64,8
B $AE69,1 End of sequence
@ $AE6A label=break_class15
B $AE6A,64,8
B $AEAA,1 End of sequence
@ $AEAB label=break_class16
B $AEAB,1 No break animation
@ $AEAC label=break_class17
B $AEAC,32,8
B $AECC,1 End of sequence
@ $AECD label=break_class18
B $AECD,80,8
N $AECD The golden brick's idle twinkle. A star grows out of the top-left quadrant and fades back. The brick settles to its plain face. Every sub-frame's $FF fifth byte keeps the cell's bright-cyan attribute.
  $AECD The star seeds in the top-left quadrant
  $AED5 Star grows
  $AEDD Star grows again
  $AEE5 The star spills into the top-right quadrant
  $AEED Full-size star – the peak
  $AEF5 Star shrinks
  $AEFD Star shrinks
  $AF05 Star shrinks
  $AF0D Star shrinks
  $AF15 Settle – the golden brick's plain face
B $AF1D,1 End of sequence
@ $AF1E label=scan_entry_ptr
g $AF1E Pointer to the brick state map entry of the slot the sweep is at
W $AF1E,2
@ $AF20 label=scan_brick_field
c $AF20 Scan and process the brick field
D $AF20 Sweeps three rows of the brick field per frame, and steps each queued break animation. A sweep that finds each slot empty, or with the golden brick at its plain face, sets the #R$5B6A(level-cleared flag).
  $AF20 The in-progress sweep offset: non-zero means a sweep is already in progress, so skip the once-per-sweep setup.
  $AF26 Start of a sweep: zero the cleared-slot tally and the on-field prize flag.
  $AF2D Point the #R$5B2A(slot pointer) at the field's first brick slot for the current #R$8E9E(bat side). Side 0, with the bat on the right, starts the field at column 2, and side 1 at column 12.
@ $AF33 isub=LD HL,TILEMAP_BASE+$82
@ $AF38 isub=LD HL,TILEMAP_BASE+$8C
  $AF38 A non-zero side takes the far one.
  $AF3B Either way, keep it for the sweep.
  $AF3E Tick the golden-twinkle flash timer once per sweep restart.
@ $AF41 label=scan_frame_rows
  $AF41 Zero this frame's count of rows swept, and pick up the sweep offset in D.
@ $AF49 label=scan_row
  $AF49 E steps across the row's 9 columns.
@ $AF4B label=scan_cell
  $AF4B Load the slot pointer and read its first tile byte.
  $AF4F A slot is empty only when both its tile bytes are the space tile.
  $AF5A The lone golden tile counts as non-brick too.
@ $AF5E label=scan_count_cleared
  $AF5E Count this slot as cleared toward the 81-slot level-clear total.
@ $AF64 label=scan_prize_flag
  $AF64 A bomb, missile or double bat prize still on the field raises the on-field prize flag.
@ $AF71 label=scan_set_prize
  $AF71 Mark a prize present on the field.
@ $AF76 label=scan_brick_entry
  $AF76 Address this slot's brick state map entry and save the pointer for the helpers below.
  $AF80 A settled slot: just run the golden brick's twinkle check, then advance.
@ $AF8A label=scan_anim
  $AF8A The finished marker skips the table lookup and goes straight to the sub-frame advance. Otherwise the entry less one picks this class's pointer from the head of the #R$AB60(break-animation sequences). The sequence start it yields is kept for the sub-frame lookup below.
  $AFA7 A class that loops wraps its sub-frame index within the sequence.
  $AFAD Any other class reads the index straight.
  $AFAF Scale it to the sub-frame's byte offset.
@ $AFC1 label=scan_seq_end
  $AFC1 This sub-frame is the sequence's terminator. What the cell settles to depends on the class that just played. A prize class leaves its glyph on the field.
@ $AFD6 label=scan_seq_settle
  $AFD6 Classes below the prize classes, and the golden brick's twinkle, settle back to idle.
@ $AFDB label=scan_seq_to_loop
  $AFDB The slow ball reveal hands the cell on to the glyph's own loop sequence.
@ $AFE0 label=scan_blit_frame
  $AFE0 Blit the current sub-frame's tile bytes into the tile map and stamp the cells' dirty counters in the parallel buffer. Unless the sub-frame marks its attributes as unchanged, also write its four attribute bytes into the attribute file.
@ $B02E label=scan_advance_subframe
  $B02E Advance this slot's animation sub-frame counter.
  $B039 A cell that neither finished nor looped just moves on.
  $B03D A cell that rests or loops is checked for the three glyphs that would claim the secondary object. This test is the bomb.
  $B046 This one is the missile prize.
  $B04A This one is the double bat prize.
  $B04E While the ball gem is out, the sweep shatters those three instead.
  $B054 A missile shot in the secondary object spares them: they go on to the lifetime test below.
  $B05A While ball B is live, the sweep shatters them too.
  $B060 Every other glyph waits out its lifetime: the sweep counts this cell up and clears it once the count reaches the fixed limit.
  $B067 Clear the glyph: restart the plain break sequence on its cell.
@ $B06C label=scan_next_cell
  $B06C Step the slot pointer forward two bytes to the next column.
  $B074 Brick-map offset advances two bytes and the column one, per slot.
  $B077 Loop until the row's columns are done.
@ $B07D label=scan_next_row
  $B07D End of row. Step the pointer past the row's unscanned tail so it lands on the next row's first slot. A row holds 9 slots at 2 bytes per slot within a 64-byte row stride.
  $B087 Stop after three rows this frame.
@ $B091 label=scan_sweep_done
  $B091 Save the sweep offset for next frame; at the end of the map, the sweep of the whole 9×9 field is complete.
  $B098 Sweep complete: reset the sweep offset and latch the on-field prize flag into its steady copy.
  $B0A2 A tally that reaches the whole field sets the level-cleared flag.
  $B0AD
@ $B0AE label=tick_golden_flash_timer
c $B0AE Advance the 15-step golden-twinkle timer
D $B0AE Advances the golden brick's #R$5B56(idle-twinkle timer) one step per brick-field sweep. It clears itself after 15 steps.
  $B0AE Timer idle – nothing to do
  $B0B3 Tick the timer one step.
  $B0B7 After its full span, wrap back to idle.
  $B0BE
@ $B0BF label=check_golden_twinkle
c $B0BF Maybe start the golden brick's idle twinkle
D $B0BF Starts the golden brick's idle twinkle on a random gate.
  $B0BF Only a golden brick that stands twinkles.
  $B0C6 Skip while a twinkle already plays.
  $B0CB Random gate: about one scan in 64
  $B0D1 Start the 15-step flash timer.
  $B0D6 Queue the twinkle's class in this slot's brick state map entry, from sub-frame zero.
  $B0DE
@ $B0DF label=apply_prize
c $B0DF Apply the prize on a removed prize glyph
D $B0DF Applies the prize on a revealed glyph that a ball or an inhabitant's step just removed. It cancels any prize still in effect except a safety net.
D $B0DF #TABLE(default) { =h Prize | =h Effect } { Glue | The ball sticks to the bat until fire releases it } { Bomb | Empties the eight slots around the hit one } { Missile | The bat becomes the missile bat } { Expand | An extra segment extends the bat } { Double bat | A second bat moves with the bat and returns the ball } { Double score | Points count double until the next prize or the last ball is lost } { Extra life | One more life, up to the cap of 25 } { Slow ball | The ball's speed drops by up to 2, but not below the serve speed } { Safety net | A timed barrier on the bat's losing edge } TABLE#
  $B0DF Read the hit brick's tile. Only a prize glyph goes on: the safety net glyph, or a tile from the glue glyph to the last slow ball frame. For any other tile, return.
@ $B0ED label=cancel_prize
  $B0ED Stand down a live double bat.
@ $B0F7 label=cancel_prize_expand
  $B0F7 An expanded bat goes back to its normal size: arm the shrink.
@ $B105 label=cancel_prize_missile
  $B105 A missile bat is turned back into the plain one.
@ $B113 label=cancel_prize_flags
  $B113 Clear the glue, double bat, missile and double score flags, and request a glue release, before the new prize takes hold.
  $B124 G/glue: set the glue active flag – the ball will stick to the bat.
  $B12E
@ $B12F label=apply_bomb
  $B12F B/bomb: take over the secondary object, and stand down any ball or missile shot it carried. Arm the 3×3 #R$9DF9(bomb detonation), whose frame 8 sets off the #R$B21D(blast). Save the blast center, park the object on the hit brick and set ball B's heading code.
  $B157
@ $B158 label=apply_missile
  $B158 M/missile: switch the bat to the missile-bat sprite, unless a missile shot is out or a retract runs. An expanded bat shrinks at once.
  $B189
@ $B18A label=apply_expand
  $B18A E/expand: extend the bat with its extension segment, unless it is already expanded.
@ $B19C label=apply_expand_done
  $B19C Either way, clear the shrink and bat-swap flags.
  $B1A3
@ $B1A4 label=apply_double_bat
  $B1A4 D/double bat: set the double bat active flag, which puts a second bat in play that moves with the bat.
  $B1AD
@ $B1AE label=apply_double_score
  $B1AE x2/double score: set the double score flag, which makes the #R$B37A(score fold) add the points twice.
  $B1B7
@ $B1B8 label=apply_extra_life
  $B1B8 Grant an extra life.
  $B1BF
@ $B1C0 label=apply_slow_ball
  $B1C0 The one animated prize: slow the active ball toward the serve speed, the speed the options screen sets and the #R$8F0A(serve) uses.
@ $B1D0 label=slow_ball_select
  $B1D0 Point #REGiy at the active ball state record; this arm takes ball A (#R$5B00).
@ $B1DC label=slow_ball_use_b
  $B1DC Otherwise it is ball B's.
@ $B1E0 label=slow_ball_step_down
  $B1E0 Weigh the ball's speed against one above the serve speed. Below it the speed stands; at it a single decrement lands on the serve speed; above it two decrements take off 2. So the speed steps down to the serve speed and stops there – it never drops under the served speed.
@ $B1F0 label=slow_ball_dec
  $B1F0 The second decrement, taken alone at the threshold and after the first above it
@ $B1F3 label=slow_ball_clear_rally
  $B1F3 All three outcomes join here to clear the ball's rally bounce count. The next #R$A938(rally speed step) is then a whole rally interval of bounces away.
  $B1F7
@ $B1F8 label=apply_safety_net
  $B1F8 Safety net, and any other in-range value: raise its barrier (#R$A0A1). A net already in its hold phase is not re-armed – the step and hold counters are zeroed instead, which restarts the hold at full length.
  $B206
@ $B207 label=safety_net_arm
  $B207 Any other phase – no net, the arm, the brighten ramp or the dim ramp – sets the phase to the arm value. The next pass of the #R$A0A1(safety net animation) then stamps the net and starts the upward ramp.
  $B20C
@ $B20D label=bomb_cell_offsets
c $B20D Detonate the bomb prize: clear the eight slots around the hit slot
D $B20D The bomb prize's blast, fired at frame 8 of the detonation. It empties the eight slots around the hit brick, whatever their durability.
B $B20D,16,2 The blast neighborhood: eight pairs of tile offset and brick-index step
@ $B21D label=detonate_bomb
C $B21D
  $B21D Step the ground-zero tile address up-left to the top-left slot of the block. It goes back one row and one column, at a 64-byte row stride and 2 bytes per column.
  $B229 Step the brick index back to its top-left slot.
  $B231 Walk the eight slots around it that the table names.
@ $B233 isub=LD HL,bomb_cell_offsets
  $B236 Hold the loop counter and the table pointer across each slot.
  $B238 Each entry's first byte is a tile offset from the block's top-left slot.
N $B241 The guard admits every brick tile, prizes included.
  $B241 Act only on slots that hold a brick tile.
  $B249 Force this brick to the destroyed state regardless of durability, whatever its brick state map entry held.
N $B258 The blast goes straight to the scorer and skips two calls the #R$A99B(brick-hit path) makes. One is the #R$B283(glyph filter), so a prize glyph scores when the blast takes it. The other is the #R$B0DF(prize dispatcher), so the player loses the prize, and a bomb glyph in the block never goes off.
N $B258 Each call overwrites the same #R$5B6F(pending points) with the raised combo. The #R$B37A(score fold) runs once a frame, so the whole block scores only the last value, as a single add.
  $B258 Score the destroyed brick.
  $B25B A slot with no brick rejoins the walk here.
  $B25C The entry's second byte steps the brick index to the next slot around the hit brick.
  $B268
@ $B269 label=brick_addr_to_pixel
c $B269 Convert a brick's tile-map address to a screen pixel position
D $B269 Converts a brick's tile-map address to its on-screen pixel position on the 16-pixel brick grid.
R $B269 I:HL the brick's tile-map address
R $B269 O:B the brick's screen X position in pixels
R $B269 O:C the brick's screen Y position in pixels
  $B269 Subtract the tile-map base, which leaves the cell offset in HL.
  $B26F Scale the column bits of the offset to the X pixel. A brick is 16 pixels wide.
  $B276 Scale the row bits of the offset to the Y pixel, 16 pixels per brick row.
  $B282
@ $B283 label=score_brick_if_ordinary
c $B283 Score an ordinary brick, but not a revealed prize glyph
D $B283 On the #R$A99B(brick-hit) path, scores an ordinary brick: it falls into the #R$B295(brick scorer). A revealed prize glyph scores nothing.
  $B283 HL points at the brick's sub-frame counter, which the caller just zeroed, so this guard never returns.
  $B287 Re-read the struck brick's tile address.
  $B28B The safety net glyph scores nothing.
  $B28E The glyph range is prize glyphs, which score nothing, so return; ordinary bricks go on to be scored.
@ $B295 label=score_brick
c $B295 Score a struck brick
D $B295 Raises the active ball's combo by one brick, up to 25, and publishes it as this frame's #R$5B6F(pending points). The #R$B37A(score fold) turns each step of it into 10 points.
  $B295 The active-ball selector picks ball A's combo or ball B's.
  $B29B One more brick in this ball's run
@ $B2A2 label=score_brick_clamp
  $B2A2 Clamp the combo; the longest run tops out at 250 points per brick.
@ $B2AB label=score_brick_store_a
  $B2AB,6 Publish ball A's combo as this frame's pending points.
@ $B2B2 label=score_brick_ball_b
  $B2B2 Ball B: one more brick in its run, the same way.
  $B2B9 Clamp ball B's combo to the same cap.
@ $B2C2 label=score_brick_store_b
  $B2C2,6 Publish ball B's combo as this frame's pending points.
@ $B2C9 label=lives_icon_glyphs
b $B2C9 Lives-indicator icon glyph codes
D $B2C9 The glyph codes of the lives icon, the bat in two halves
B $B2C9,1 Glyph code for the icon's bottom cell
@ $B2CA label=lives_icon_glyph_top
B $B2CA,1 Glyph code for the icon's top cell
@ $B2CB label=draw_level_number
c $B2CB Draw the "LEVEL nnn" status caption
D $B2CB Draws the LEVEL caption once per level. It counts the digit cells up, so the caption shows the displayed level.
  $B2CB Reset the tens digit of the #R$B770(level caption) to ASCII '0'. The hundreds cell beside it keeps the value the previous laps left there. The #R$8ED3(new-game setup) clears all three at the start of a game.
  $B2D0 Seed the units digit to game-font '1'; the count starts at 1, so the caption shows the level index plus one within the current lap. The game font's digits carry bit 7, so this last digit also terminates the print string.
  $B2D5 On the first level of a lap the seeded "01" prints after the hundreds digit, which stays as it is.
  $B2DB Otherwise step the counter up by the #R$8E9C(level index).
N $B2DC Each pass adds one to the displayed level and carries into the tens and the hundreds. The displayed level is the level index plus one, plus a hundred for each completed lap of the level tables. The index wraps to 0 at the #R$8D27(end of a lap) while the hundreds digit stands, so the caption counts on past 100. The carry into the hundreds lands on the pass that takes the count from 99 to 100. The lap digit therefore advances while the last level of a lap is drawn.
  $B2DC Step the units digit; it wraps at the game font's ':' back to '0' and carries left.
  $B2E5 Wrapped units carry into the tens, which wrap at ASCII ':' the same way.
  $B2EE That carry reaches the hundreds, the lap digit.
  $B2F7 The hundreds wrap too, so the caption counts modulo 1000.
@ $B2F9 label=level_caption_next
  $B2F9 One pass per level of the index
@ $B2FB isub=LD HL,SCREEN_BASE+$A
  $B2FB Print the caption double-height at character row 0, column 10.
@ $B306 label=draw_lives
c $B306 Draw the lives indicator
D $B306 Draws the lives indicator: a two-glyph icon and the spare-life count, one less than the #R$8E9D(life count).
  $B306 Reset the count buffer to "00": tens ASCII '0', units game-font '0' (bit 7 set, the print terminator).
@ $B30E isub=LD HL,SCREEN_BASE+$14
  $B30E Draw the icon's first glyph at the status line in bright white on black.
@ $B319 isub=LD HL,SCREEN_BASE+$34
  $B319 Draw the icon's second glyph below it.
  $B324 Spare lives are one less than the life count. Draw nothing more when the life count is 0.
  $B32B A single-digit count skips the tens split, so the tens digit stays '0'.
  $B32F Count the tens of the spare-life number.
@ $B331 label=draw_lives_tens_loop
  $B331 Subtract ten again and again, until the units remainder is left in #REGa.
  $B338 Store the tens as an ASCII digit in the high cell; keep the units in #REGb.
@ $B341 label=draw_lives_units
  $B341 Store the units in the game font, bit 7 set in the low cell.
  $B347 Print the 2-digit count double-height beside the icon.
@ $B349 isub=LD HL,SCREEN_BASE+$15
@ $B351 label=draw_score_readout
c $B351 Draw the score and high-score readouts
D $B351 Draws the two score readouts on the top status line. Once the live score overtakes the high score, which the #R$B3FD(overtake flag) records, both read the live figure.
  $B351 Print the 8-digit live score double-height at the top-left status cell.
@ $B35C isub=LD HL,highscore_entries+$7
  $B35C Set bit 7 on the high score's 8th digit so the #R$987B(double-height print) treats the #R$B67E(top high-score entry) as an 8-digit terminated string.
  $B362 Default the high-score slot to the top entry's figure.
  $B36A Has the live score overtaken the high score?
  $B370 If so, show the live score in the high-score slot instead.
@ $B373 label=draw_score_readout_print
  $B373 Print the chosen 8-digit figure double-height.
  $B376,3 Clear the temporary terminator on the high score's 8th digit.
@ $B37A label=add_pending_score
c $B37A Add the pending score to the displayed score
D $B37A Folds this frame's #R$5B6F(pending points) into the on-screen score. The double score prize adds them twice.
  $B37A Return at once if no points are pending. Otherwise capture the pending count into #REGc for the #R$B396(score add).
  $B380 Add the pending points to the score.
  $B383 Double score prize active? If so, jump to add the same points again.
  $B389 No prize: clear the pending points for the next frame and return.
  $B38D
@ $B38E label=double_score_readd
  $B38E Double path: reload the pending count into #REGc, clear the pending points, then fall through into the #R$B396(score add) for the second add.
@ $B396 label=add_points_to_score
c $B396 Add the points to the score and redraw it
D $B396 Adds this frame's points into the on-screen score and redraws it. Once the live score reaches the top high-score figure, the #R$B3FD(overtake flag) goes up. The stored high-score number is not changed here.
R $B396 I:C score increment in units of 10 points
  $B396 Point at the score's units digit and clear its terminator bit before the edit.
@ $B39B label=score_bump_thousands
N $B39B The score is eight ASCII decimal digits, most significant first. The last digit is never touched and stays '0'. The score is therefore always a multiple of 10, and each point count is worth ten times its value.
  $B39B Re-point at the thousands digit and bump it once per full hundred taken off #REGc.
@ $B3A9 label=score_to_hundreds
  $B3A9 Advance to the hundreds place.
@ $B3AA label=score_bump_hundreds
  $B3AA Bump the hundreds digit once per full ten taken off #REGc.
@ $B3B5 label=score_to_tens
  $B3B5 Advance to the tens place.
@ $B3B6 label=score_bump_tens
  $B3B6 Bump the tens digit once per unit taken off #REGc; the units digit stays '0'.
@ $B3C2 label=score_redraw
  $B3C2 Restore the terminator bit, then print the live score double-height at the score readout.
N $B3D4 QUIRK: during the compare the live score's last digit carries the print terminator flag, which the high-score number's plain digits lack. The last digit is therefore never found equal, and the all-digits-equal exit is unreachable. A tie with the high score counts as an overtake.
  $B3D4 Compare the live score digits against the high-score number, most significant digit first.
@ $B3D9 label=score_overtake_loop
  $B3D9 Test one digit pair; equal advances, live-below stops, live-above is an overtake.
  $B3DF Live score is below the high score: clear the overtake flag and stop.
  $B3E3
@ $B3E4 label=score_overtake_next
  $B3E4 Digits equal so far: advance to the next pair.
  $B3E8 All 8 digits equal: clear the overtake flag and stop. Unreachable – see the quirk note.
  $B3EC
@ $B3ED label=score_overtake_set
  $B3ED Live score has reached or passed the high score: set the flag and redraw the high-score readout on screen from the live score.
@ $B3FD label=highscore_passed
g $B3FD High-score overtake flag
D $B3FD Whether the live score has reached the high score: 0 for no, 1 for yes
@ $B3FE label=inc_score_digit
c $B3FE Increment one score digit with carry
D $B3FE Increments one ASCII decimal digit, and carries toward more significant digits. A byte with bit 7 set stops the carry at the field boundary.
R $B3FE I:HL address of the digit to increment
R $B3FE O:HL unchanged, so a caller can carry into the same field again
  $B3FE Hold the digit's address for the caller.
@ $B3FF label=score_digit_carry_loop
  $B3FF Stop if this byte is the field boundary – the carry cannot pass it.
  $B404
@ $B405 label=score_digit_bump
  $B405 Bump the ASCII digit; past '9' wrap it to '0' and carry into the next digit.
  $B40D Step to the next more significant digit (lower address) and repeat the carry.
@ $B410 label=score_digit_done
  $B410 The digit did not wrap, so no carry is owed: drop the saved pointer and return.
  $B411
@ $B412 label=check_highscore
c $B412 Check whether the just-finished score makes the high-score table
D $B412 Decides on game over whether the score earns a place in the high-score table. A tie or better goes to #R$B448(name entry).
  $B415 Fill the attributes with bright white on black.
  $B41A Clear the print terminator on the live score's last digit, so every digit compares as plain ASCII against the table entries.
  $B41F Walk the live score against the table entries, highest first.
@ $B427 label=highscore_compare_entry
N $B427 One table entry's turn. The slot counter counts down from 10 at the top slot to 1 at the bottom. An entry that qualifies hands the #R$B448(name entry) the matched record, the live score and the slot counter.
  $B427 Save the two cursors and the slot counter, then ready the digit compare.
@ $B42C label=highscore_compare_digit
N $B42C The score is fixed-width, zero-padded ASCII, so a plain byte compare of the eight digits ranks two of them. The first digit where the live score is greater qualifies it and branches to name entry. A smaller digit abandons the entry and steps to the next record. All eight equal is a tie, and it qualifies.
  $B42C Compare one digit: live score against table entry.
  $B42E Equal digit: compare the next one.
  $B430 Live digit higher: the score beats this entry, go enter the name.
  $B432 Live digit lower: this entry outranks the score, try the next.
@ $B434 label=highscore_digit_equal
  $B434 Step to the next (less-significant) digit; all 8 matched falls through.
  $B438 All 8 digits equal: a tie qualifies too.
@ $B43A label=highscore_next_entry
  $B43A Reject this entry: advance the table cursor by the 22-byte record stride, restore the live-score cursor, and loop to the next-lower entry.
  $B443 Score below all 10 entries: redisplay the table without name entry.
@ $B446 label=name_entry_cursor
g $B446 Name entry: cursor index along the name-entry strip
D $B446 The name-entry strip cell the cursor sits on.
@ $B447 label=name_entry_pos
c $B447 Enter a name for the high-score table
D $B447 The high-score name-entry screen, shown when the player's score qualifies. The player spells a name off the #R$B656(name-entry strip).
B $B447,1 Write position in the #R$B75A(entry buffer): where the next confirmed letter is stored.
@ $B448 label=enter_highscore_name
C $B448
  $B448 Take the caller's three saved words back. The slot counter of the entry that qualified decides how much of the table moves.
  $B451 Every slot above the bottom needs the records under it pushed down one place, so measure how far.
@ $B458 label=highscore_scroll
  $B458 Total that as a byte count.
  $B45B Slide the block down to open the new record's slot.
@ $B45D isub=LD HL,highscore_entries+$C5
@ $B460 isub=LD DE,highscore_entries+$DB
@ $B465 label=highscore_draw
  $B465 Start the write position at the first name cell and the cursor on the strip's first cell. Print the two captions and the strip, then copy the live score and the separator into the entry buffer.
@ $B467 isub=LD (name_entry_pos),A
@ $B479 isub=LD HL,SCREEN_BASE+$A5
@ $B484 isub=LD HL,SCREEN_BASE+$801
@ $B4A9 label=highscore_holder_loop
  $B4A9 Fill the name holder with the underscore placeholder.
  $B4AE Bit 7 on the last cell makes the holder print as a terminated string.
@ $B4B1 isub=LD HL,SCREEN_BASE+$8A5
@ $B4B1 label=highscore_print_name
  $B4B1 Print the record so far, the score and the name, double-height under the strip.
@ $B4BC label=highscore_cursor_pos
  $B4BC Work out where the cursor sits on the strip so the highlight lands on it.
@ $B4C2 isub=LD HL,ATTR_BASE+$101
  $B4CF Read the player's input each pass. Fire goes on to act on the cell under the cursor.
  $B4DB The game has no left/right action, so up/forward steps the cursor right along the strip and down/back steps it left.
  $B4E3 Pause so a held control repeats at a steady rate, then loop to reposition the highlight and read the controls again.
@ $B4E8 label=highscore_confirm_char
  $B4E8 Wait for fire to be released, then act on the strip cell under the cursor. The ENTER cell finishes the name.
@ $B506 label=highscore_finalize_loop
  $B506 Walk the name for the first placeholder cell, plain or terminated.
  $B50F Cells with letters are stepped over.
@ $B514 label=highscore_clear_holder
  $B514 From the first such cell, blank the rest and terminate the string.
@ $B51C label=highscore_store_name
  $B51C Copy the finished record, the score and the name, into the table slot and repaint the score screen.
@ $B528 label=highscore_check_delete
  $B528 Not the ENTER cell, so test the DELETE one; it only bites while at least one letter has been entered.
@ $B52C isub=LD A,(name_entry_pos)
  $B538 At the far end the cell at the write position is cleared first.
@ $B548 label=highscore_delete_pos
  $B548 With the last cell already blank, step back from the far end.
@ $B549 label=highscore_delete_apply
  $B549 Step the write position back and blank the cell it lands on.
@ $B54A isub=LD (name_entry_pos),A
@ $B556 label=highscore_delete_done
  $B556 Blip, wait for the key to come up, and redraw for either outcome.
@ $B55F label=highscore_letter_check
  $B55F An ordinary letter: store it at the write position in the name, then test whether that was the last cell.
@ $B563 isub=LD A,(name_entry_pos)
@ $B56C isub=LD HL,name_entry_pos
  $B574 A name filled to the last cell is terminated where it stands.
@ $B57B label=highscore_advance_pos
  $B57B Otherwise the write position moves on to the next cell.
@ $B57C label=highscore_wait_release
  $B57C Wait for the key to come up, blip, and redraw the entry screen.
@ $B585 label=name_cursor_left
c $B585 Step the name-entry cursor left
D $B585 Steps the name-entry cursor one cell left along the #R$B656(name-entry strip). From the first cell it wraps to the last.
  $B585 Read the cursor index.
  $B588 At the left edge? If not, step left; otherwise wrap to the right end.
  $B58B A wrap off the left edge lands on the strip's rightmost cell.
@ $B58D isub=LD HL,ATTR_BASE+$101
  $B58D,5 Repaint the wrapped-from cell (the strip's leftmost) to the normal bright-white-on-black attribute. The redraw clears only the new index's neighbors, so without this the far end keeps its old highlight.
  $B594 Step one cell left.
  $B595 Commit the new cursor index and play the cursor-move blip.
  $B59B
@ $B59C label=name_cursor_right
c $B59C Step the name-entry cursor right
D $B59C Mirror of the #R$B585(left step), one cell right. On the wrap it restores the strip's rightmost attribute cell.
  $B59C Read the cursor index.
  $B59F At the right edge? If not, step right; otherwise wrap to the left end.
  $B5A3 Wrap target is the leftmost cell.
@ $B5A4 isub=LD HL,ATTR_BASE+$11E
  $B5A4,5 Repaint the wrapped-from cell (the strip's rightmost) to the normal bright-white-on-black attribute. The redraw clears only the new index's neighbors, so without this the far end keeps its old highlight.
  $B5AB Step one cell right.
  $B5AC Commit the new cursor index and play the cursor-move blip.
  $B5B2
@ $B5B3 label=draw_highscore_table
c $B5B3 Draw the high-score table screen
D $B5B3 Repaints the whole high-score screen: the heading and all ten #R$B67E(records) in double-height text.
  $B5B6 Fill the attributes with bright white ink on black paper.
@ $B5BB isub=LD HL,SCREEN_BASE+$9
  $B5BB Print the " HIGH SCORES" heading double-height at character row 0, column 9, in bright yellow ink on blue paper.
  $B5C6 The 10 record rows use bright white ink on blue paper.
@ $B5C7 isub=LD HL,SCREEN_BASE+$65
  $B5C7 First record's screen cell is character row 3, column 5. #REGb counts the ten entries.
@ $B5CF label=highscore_row_loop
  $B5CF Print this record, and keep the loop counter and this row's screen cell.
  $B5D4 Step the source past the record's terminator to the next entry – the table runs 22 bytes per record – then restore this row's screen cell.
  $B5D6,6 Drop the screen cell 2 character rows: each record is double-height, 16 pixels tall.
@ $B5E0 label=lose_life
c $B5E0 Lose a life
D $B5E0 Removes one life after the ball is lost past the bat, and redraws the #R$B306(lives indicator). The count floors at 0.
  $B5E0 If no lives remain, do nothing (floor at 0).
  $B5E5 Spend one life.
  $B5EC
@ $B5ED label=gain_life
c $B5ED Award an extra life
D $B5ED Adds one life, capped at 25, and redraws the #R$B306(lives indicator).
  $B5ED At the life cap, do nothing.
  $B5F3 Add one life.
  $B5FA
@ $B5FB label=award_score_life
c $B5FB Award a bonus life when the score passes a milestone
D $B5FB Grants one #R$B5ED(extra life) each time the score's ten-thousands digit advances, so one per 10000 points.
N $B5FB A marker byte holds the score's ten-thousands digit as of the last award. Any change copies the live digit over the marker and awards one life.
  $B5FB No new milestone while the score's ten-thousands digit still matches the saved marker.
  $B603 Record the new digit so this milestone is awarded only once.
@ $B609 label=highscore_input_delay
c $B609 Busy-wait to slow name-entry key repeat
D $B609 A fixed delay in the #R$B448(name-entry) cursor loop. It limits how fast a held key repeats.
  $B609 Busy-wait about 0.07 s to throttle the key repeat.
@ $B60C label=highscore_delay_loop
  $B611
@ $B612 label=msg_high_scores
t $B612 High-score screen captions
T $B612,13,12:1
@ $B61F label=msg_congrats
T $B61F,32,31:1
@ $B63F label=msg_input_name
T $B63F,22,21:1
T $B655,1 Unused
@ $B656 label=name_entry_strip
T $B656,30,29:1 The selectable cells: A to Z, space, full stop then the DELETE and ENTER cells
T $B674,1 Unused
T $B675,1 Carry stop for the score field, with bit 7 set
@ $B676 label=score_display
T $B676,3,3 On-screen score, the three most significant digits of the 8-digit decimal string, most significant first
@ $B679 label=score_ten_thousands
T $B679,1,1 The score's ten-thousands digit
@ $B67A label=score_thousands
T $B67A,3,3 The score's thousands, hundreds and tens digits
@ $B67D label=score_units
T $B67D,1 The score's units digit, always '0', whose bit 7 marks the end of the print string
@ $B67E label=highscore_entries
N $B67E The default high-score table holds its records highest score first. A record has the same shape as the #R$B75A(entry buffer). The score field and its separator come first, then the name, whose last cell carries the terminator bit.
T $B67E,22,21:1 The highest-ranked default entry
T $B694,22,21:1 Default entry, rank 2
T $B6AA,22,21:1 Default entry, rank 3
T $B6C0,22,21:1 Default entry, rank 4
T $B6D6,22,21:1 Default entry, rank 5
T $B6EC,22,21:1 Default entry, rank 6
T $B702,22,21:1 Default entry, rank 7
T $B718,22,21:1 Default entry, rank 8
T $B72E,22,21:1 Default entry, rank 9
T $B744,22,21:1 The lowest-ranked default entry
@ $B75A label=highscore_entry_buffer
t $B75A High-score entry buffer
D $B75A The record a new high-score name is composed into: the score field and its separator, then the name.
T $B75A,12,12 Score field and separator
@ $B766 label=highscore_new_name
T $B766,9,9 First nine cells of the name in entry
@ $B76F label=highscore_new_name_last
T $B76F,1 Last cell of the name, whose bit 7 ends the record's print string
@ $B770 label=level_caption_text
t $B770 Level caption
D $B770 The caption text, then its digit cells
T $B770,6,6 The caption text
@ $B776 label=level_caption_hundreds
T $B776,1,1 Hundreds digit of the level caption, in ASCII
@ $B777 label=level_caption_tens
T $B777,1,1 Tens digit of the level caption, in ASCII
@ $B778 label=level_caption_units
T $B778,1 Units digit of the level caption, in the game font, whose bit 7 terminates the print string
@ $B779 label=lives_digits
b $B779 Spare-lives caption
D $B779 The two-digit spare-lives count
B $B779,1 Tens digit, in ASCII
@ $B77A label=lives_digits_units
B $B77A,1 Units digit, in the game font, and the final character of the print string
@ $B77B label=score_milestone_marker
g $B77B Saved ten-thousands score digit
D $B77B Ten-thousands digit of the score at the last extra-life award
@ $B77C label=sfx_key_blip
c $B77C Play the key-press blip
D $B77C The blip that answers a key press in the menus and prompts.
N $B77C #UDGTABLE { #AUDIO(0,vol=25)(key_press_blip.wav)(#INCLUDE(PlaySoundDelays)) } TABLE#
  $B77C Chirp 1's parameters, played by a direct call.
  $B783 Chirp 2's parameters; fall through into the run to play it.
@ $B787 label=play_pitch_sweep
c $B787 Play one run of shorter and shorter periods
D $B787 Emits a run of square-wave cycles through the #R$B9B4(sound primitive). The period shortens by one each cycle.
R $B787 I:D first pitch period, which shortens by one each cycle
R $B787 I:C number of cycles to play; 0 plays 256
N $B78A Each pass plays one cycle at the current period, then steps the period down and counts the cycle off.
  $B78A,2 Raise the pitch one step and count this cycle off.
@ $B78F label=sfx_ball_b_spawn
c $B78F Play the second-ball spawn sound
D $B78F The sound when ball B spawns.
N $B78F #UDGTABLE { #AUDIO(sim=1,start=46991,stop=47002,vol=25)(second_ball_spawn.wav) } TABLE#
  $B78F Start the run at its first period.
  $B793 Emit one cycle at the current pitch period.
  $B796 Lower the pitch one step, count this cycle off, and repeat until the run is done. Mirror of the #R$B787(upward sweep), which raises it.
  $B79A
@ $B79B label=death_burst_counter
c $B79B Sound effect: death burst
D $B79B The sound when an inhabitant dies or the bat explodes on a lost ball. It also plays when the missile shot bursts on a wall, or the ball gem's flight runs out.
B $B79B,1 Step counter: 0 when the effect is disarmed, otherwise the step it has reached, 1 to 15
@ $B79C label=death_burst_periods
B $B79C,2 Never read
B $B79E,14 Pitch period for each step
B $B7AC,2 Never read
@ $B7AE label=sfx_death_burst
C $B7AE
@ $B7AE isub=LD A,(death_burst_counter)
N $B7AE #UDGTABLE { #AUDIO(0,vol=25)(death_burst.wav)(#INCLUDE(LoopADelays)) } TABLE#
  $B7AE Read the step counter; a disarmed effect has nothing to play.
  $B7B3 The counter past its last step: clear it and return. That disarms the effect.
@ $B7B8 isub=LD (death_burst_counter),A
  $B7BB
@ $B7BC label=death_burst_step
  $B7BC Advance to the next step and save the counter.
@ $B7BD isub=LD (death_burst_counter),A
N $B7C0 Each step's pitch comes from the #R$B79C(death-burst table).
  $B7C0 Take this step's period byte into #REGd.
@ $B7C3 isub=LD HL,death_burst_periods
  $B7C8 Two cycles make up each step of the sweep.
@ $B7CA label=death_burst_emit
  $B7CA Emit one cycle at the current period.
  $B7CD Lower the pitch between the two cycles, then repeat until both are done.
  $B7D1
@ $B7D2 label=spawn_counter
c $B7D2 Sound effect: inhabitant spawns
D $B7D2 The sound when an inhabitant spawns, a 9-step sequence.
B $B7D2,1 Step counter: 0 when the effect is disarmed, otherwise the step it has reached, 1 to 10
@ $B7D3 label=spawn_periods
B $B7D3,2 Never read
B $B7D5,9 Pitch period for each step
B $B7DE,1 Never read
@ $B7DF label=sfx_spawn
C $B7DF
@ $B7DF isub=LD A,(spawn_counter)
N $B7DF #UDGTABLE { #AUDIO(0,vol=25)(inhabitant_spawns.wav)(#INCLUDE(LoopBDelays)) } TABLE#
  $B7DF Read the step counter; a disarmed effect has nothing to play.
  $B7E4 The counter past its last step: clear it and return. That disarms the effect.
@ $B7E9 isub=LD (spawn_counter),A
  $B7EC
@ $B7ED label=spawn_step
  $B7ED Advance to the next step and save the counter.
@ $B7EE isub=LD (spawn_counter),A
N $B7F1 Each step's pitch comes from the #R$B7D3(spawn table).
  $B7F1 Take this step's period byte into #REGd. The counter reaches this point only at 2 to 10, so only those offsets of the #R$B7D3(table) are played.
@ $B7F4 isub=LD HL,spawn_periods
  $B7F9 Two cycles make up each step of this sweep too.
@ $B7FB label=spawn_emit
  $B7FB Emit one cycle at the current period.
  $B7FE Raise the pitch between the two cycles, then repeat until both are done. The #R$B7AE(death burst) lowers it instead.
  $B802
@ $B803 label=chew_counter
c $B803 Sound effect: orb chews the ball
D $B803 The sound while the orb chews the ball, a 49-step sequence.
B $B803,1 Step counter: 0 when the effect is disarmed, otherwise the step it has reached, 1 to 50
@ $B804 label=chew_periods
B $B804,2 Never read
B $B806,48 Pitch period for each step
@ $B836 label=sfx_chew
C $B836
@ $B836 isub=LD A,(chew_counter)
N $B836 The 49 played steps start when the #R$D078(orb's chew) reaches animation frame 20 and end before the spit.
N $B836 #UDGTABLE { #AUDIO(0,vol=25)(chew.wav)(#INCLUDE(LoopCDelays)) } TABLE#
  $B836 Read the step counter; a disarmed effect has nothing to play.
  $B83B The sweep over: clear the counter and stay silent this frame.
@ $B840 isub=LD (chew_counter),A
  $B843
@ $B844 label=chew_step
  $B844 Advance to the next step and store the counter back.
@ $B845 isub=LD (chew_counter),A
N $B848 Each step's pitch comes from the #R$B804(chew table).
  $B848 Take this step's period byte into #REGd. QUIRK: the table ends one byte below this routine. The last step reaches past its end and takes the routine's own first opcode as the period.
@ $B84B isub=LD HL,chew_periods
  $B850 Two square-wave cycles this frame
@ $B852 label=chew_emit
  $B852 Emit one cycle at the current period.
  $B855 Step the period between the two cycles, then loop.
  $B859
@ $B85A label=sfx_name_cursor
c $B85A Sound effect: name-entry cursor move
D $B85A The blip that marks each cursor step along the name-entry strip. Its pitch follows the #R$B446(cursor index).
N $B85A #UDGTABLE { #AUDIO(sim=1,start=47194,stop=47218,vol=25)(menu_move.wav) } TABLE#
  $B85A Preserve the caller's AF, BC and DE.
  $B85D Read the name-entry cursor index.
  $B860 The cursor's position along the strip sets the pitch, one value per cell.
  $B866 Fixed burst length
@ $B868 label=sfx_name_cursor_loop
  $B868 Emit one square-wave cycle at the current pitch.
  $B86B,1 Step the period across the burst.
  $B86F Hand the caller's registers back.
  $B872
@ $B873 label=sfx_load_error
c $B873 Sound effect: tape-load error
D $B873 The failure signal for a LOAD LEVELS tape load, played ten times over when the ROM loader reports failure.
  $B873 Preserve the caller's BC and DE.
  $B875 Set the first period, then reuse that same byte as the cycle count.
@ $B878 label=sfx_load_error_cycle
  $B878 Emit one square-wave cycle at the current period.
  $B87B Rotate the period left one bit each cycle, so it walks eight values in turn.
  $B882
@ $B883 label=orb_spit_timer
c $B883 Sound effect: the orb spits the ball
D $B883 The sound when the orb spits out the ball it chewed.
B $B883,1 Orb-spit sound delay: 0 when idle, otherwise one more than the ticks left before the sound, 2 to 5
@ $B884 label=sfx_orb_spit
C $B884
N $B884 #UDGTABLE { #AUDIO(sim=1,start=47236,stop=47255,vol=25)(orb_spit.wav) } TABLE#
  $B884 Preserve the caller's BC and DE.
  $B886 The first period doubles as the cycle count.
@ $B889 label=orb_spit_loop
  $B889 Emit one square-wave cycle at the current period.
  $B88C,2 Step the period down; halfway through the run it underflows past 0 and carries on from the top.
  $B893 Return the #R$B883(delay timer) to idle.
@ $B894 isub=LD (orb_spit_timer),A
  $B897
@ $B898 label=sfx_ball_bounce
c $B898 Sound effect: ball-bat bounce
D $B898 The sound when a ball reflects off the bat.
N $B898 #UDGTABLE { #AUDIO(sim=1,start=47256,stop=47270,vol=25)(ball_bounce.wav) } TABLE#
  $B898 Preserve the caller's BC and DE.
  $B89A Fixed period and burst length
  $B89E Emit the burst at the one period.
  $B8A4 Hand the caller's registers back.
  $B8A6
@ $B8A7 label=sfx_brick_hit
c $B8A7 Sound effect: brick hit
D $B8A7 The blip when the missile shot breaks a brick.
N $B8A7 #UDGTABLE { #AUDIO(sim=1,start=47271,stop=47286,vol=25)(brick_hit.wav) } TABLE#
  $B8A7 Preserve the caller's BC and DE.
  $B8A9 The first period and the two-cycle count
  $B8AD Emit one square-wave cycle at the current period.
  $B8B0 Step the period between the two cycles.
  $B8B6
@ $B8B7 label=sfx_brick_destroyed
c $B8B7 Sound effect: brick destroyed
D $B8B7 The sound of a brick hit that shatters the brick to an empty slot.
N $B8B7 #UDGTABLE { #AUDIO(sim=1,start=47287,stop=47323,vol=25)(brick_destroyed.wav) } TABLE#
  $B8B9 The first pass's base period; each pass steps it down from here.
  $B8BB One pass per step of the run
@ $B8BD label=sfx_brick_destroyed_pass
  $B8BD Save the current pass's base period and the pass counter.
  $B8BF The pass's first burst, at the base period
@ $B8C1 label=sfx_brick_destroyed_lo
  $B8C7 Shorten the period for the pass's second burst.
  $B8CB The pass's second burst, at the shortened period
@ $B8CD label=sfx_brick_destroyed_hi
  $B8D3 Restore the current pass's base period and counter.
  $B8D5 Step the base period down for the next pass.
  $B8D7 Loop back for the next pass.
  $B8D9 Hand the caller's registers back.
  $B8DB
@ $B8DC label=sfx_brick_survives
c $B8DC Sound effect: brick survives the hit
D $B8DC The sound of a brick hit that leaves the brick in place: a golden brick, or a silver brick that steps down.
N $B8DC #UDGTABLE { #AUDIO(sim=1,start=47324,stop=47339,vol=25)(brick_survives.wav) } TABLE#
  $B8DE The run's first period; it steps from here.
  $B8E0 Cycle count for the whole run.
@ $B8E2 label=sfx_brick_survives_sweep
  $B8E2 Emit one cycle, then lower the pitch a step; loop for the whole run, so no two cycles share a period.
  $B8E9 Hand the caller's registers back.
  $B8EB
@ $B8EC label=sfx_bomb_detonate
c $B8EC Sound effect: bomb detonation (one step)
D $B8EC The sound when the bomb prize detonates, a 4-step sequence.
N $B8EC #UDGTABLE { #AUDIO(0,vol=25)(bomb_detonate.wav)(#INCLUDE(LoopDDelays)) } TABLE#
  $B8EC Read the step counter; a disarmed effect has nothing to play.
  $B8F1 The effect over: clear the counter and stay silent this frame.
  $B8F9
@ $B8FA label=sfx_bomb_detonate_step
  $B8FA Preserve BC and DE for the caller.
  $B8FC Advance to the next step and store the counter back.
  $B900 Each step of the detonation raises the base pitch.
  $B908 The frame's cycle count
@ $B90A label=sfx_bomb_detonate_cycle
  $B90A Emit one cycle at the current period.
  $B90D Rotate the period left one bit each cycle, then loop, so the frame's burst walks eight values.
  $B914
@ $B915 label=bat_grows_pitches
c $B915 Sound effect: bat grows
D $B915 The expanded bat grows downward. The table gives each step of the sweep its pitch period.
B $B915,2 Never read
B $B917,15 The played periods, one per step of the sweep. QUIRK: one step near the end breaks the even downward run, so the pitch steps back.
B $B926,4 Never read
@ $B92A label=sfx_bat_grows
C $B92A
N $B92A #UDGTABLE { #AUDIO(0,vol=25)(bat_grows.wav)(#INCLUDE(LoopEDelays)) } TABLE#
  $B92A Read the step counter; a disarmed effect has nothing to play.
  $B92F The counter past its last step: clear it and return. That disarms the effect.
  $B937
@ $B938 label=bat_grows_step
  $B938 Advance to the next step and save the counter.
  $B93C Preserve HL, DE and BC across the burst.
  $B93F Index the #R$B915(pitch table) by the new counter value; #REGd takes this step's period byte.
@ $B942 isub=LD HL,bat_grows_pitches
  $B947 Play this step's burst at its one fixed period.
@ $B949 label=bat_grows_emit
  $B94F Restore HL, DE and BC and return.
  $B952
@ $B953 label=bat_shrinks_pitches
c $B953 Sound effect: bat shrinks
D $B953 The expanded bat shrinks back to its normal size.
B $B953,2 Never read
B $B955,15 The played periods, in even steps upward
B $B964,4 Never read
@ $B968 label=sfx_bat_shrinks
C $B968
N $B968 #UDGTABLE { #AUDIO(0,vol=25)(bat_shrinks.wav)(#INCLUDE(LoopFDelays)) } TABLE#
  $B968 Read the step counter; a disarmed effect has nothing to play.
  $B96D The counter past its last step: clear it and return. That disarms the effect.
  $B975
@ $B976 label=bat_shrinks_step
  $B976 Advance to the next step and save the counter.
  $B97A Preserve HL, DE and BC across the burst.
  $B97D Index the #R$B953(pitch table) by the new counter value; #REGd takes this step's period byte.
@ $B980 isub=LD HL,bat_shrinks_pitches
  $B985 Play this step's burst at its one fixed period.
@ $B987 label=bat_shrinks_emit
  $B98D Restore HL, DE and BC and return.
  $B990
@ $B991 label=sfx_net_flash
c $B991 Sound effect: safety net flash
D $B991 The safety net prize's flash, played as the net brightens and again before it dims.
N $B991 #UDGTABLE { #AUDIO(0,vol=25)(safety_net_flash.wav)(#INCLUDE(LoopGDelays)) } TABLE#
  $B991 Read the step counter; a disarmed effect has nothing to play.
  $B996 Once the sweep is over: clear the counter and stay silent this frame.
  $B99E
@ $B99F label=sfx_net_flash_step
  $B99F Advance to the next step and store the counter; the sweep runs over seven frames.
  $B9A3 Preserve DE and BC for the caller.
  $B9A5 The pitch falls a step on each frame of the flash.
  $B9A9 The frame's burst holds one pitch – no intra-frame sweep.
@ $B9AB label=sfx_net_flash_cycle
  $B9AB Emit one cycle at the current period, then loop.
  $B9B3
@ $B9B4 label=sound_blip
c $B9B4 Emit one square-wave cycle (the sound primitive)
D $B9B4 The one place any sound effect reaches the speaker. The #R$8E9F(SOUND FX option) therefore mutes them all together.
N $B9B4 With SOUND FX off, the #R$C21C(options-menu redraw) patches this routine's first byte so it returns at once. With SOUND FX on, it restores that byte.
N $B9B4 Seven effects share this counted-step shape, written here once: #R$B7AE, #R$B7DF, #R$B836, #R$B8EC, #R$B92A, #R$B968 and #R$B991. Each is polled once a frame and returns at once while its counter reads 0. A raise of that counter arms it, and one step past the last clears it.
N $B9B4 Every armed call bumps the counter, derives that step's pitch period and emits a short burst here. Five of the seven take the period from a table indexed by the counter, bumped before the index is taken. Those tables therefore never have their first two bytes read.
R $B9B4 I:D pitch period; larger means a lower pitch
R $B9B4 O:D unchanged, so a caller can repeat the call to hold a tone
  $B9B4 Speaker high level
@ $B9B6 label=sound_lvl_hi
N $B9B6 The mute is this routine's first byte. The #R$C100(SOUND FX handler) also has a path that would disable the two speaker writes, but that branch never runs.
  $B9B6 Drive the speaker high.
N $B9B8 Each half-cycle holds the speaker in one state for as long as the pitch period sets. A period of 0 counts as 256.
  $B9B8 Load the delay count from the pitch period in D.
@ $B9B9 label=sound_hi_delay
  $B9B9 Hold the high level for D loop iterations.
  $B9BB Speaker low level
@ $B9BC label=sound_lvl_lo
  $B9BC Drive the speaker low.
  $B9BE Reload the delay count from D.
@ $B9BF label=sound_lo_delay
  $B9BF Hold the low level for D iterations, then return.
  $B9C1
@ $B9C2 label=sfx_net
g $B9C2 Effect step counters
D $B9C2 The step counters of four of the counted-step effects described at the #R$B9B4(sound primitive), one byte per effect.
B $B9C2,1 Safety net flash
@ $B9C3 label=sfx_bomb
B $B9C3,1 Bomb detonation
@ $B9C4 label=sfx_grow
B $B9C4,1 Bat grows
@ $B9C5 label=sfx_shrink
B $B9C5,1 Bat shrinks
@ $B9C6 label=draw_sp_save
g $B9C6 Sprite drawer's saved stack pointer
B $B9C6,2
@ $B9C8 label=update_objects
c $B9C8 Update and draw all active objects
D $B9C8 Draws the object pool (#R$B9D2), then runs the two buffer stages that put the frame on screen.
  $B9C8 Draw every active object, blit the dirty cells to the display, then recompose the background behind them.
  $B9D1
@ $B9D2 label=draw_all_objects
c $B9D2 Process every active on-screen object
D $B9D2 Draws every active object whose Y lies on the visible playfield, via the #R$B9FC(sprite drawer). Inactive and off-screen entries are skipped.
  $B9D2 Start at the first pool entry.
  $B9D6 Count the entries.
@ $B9DA label=draw_all_objects_loop
  $B9DA Save the loop state for this entry.
  $B9DD Active? Skip if not.
  $B9E3 Y position off the bottom of the playfield? Skip.
  $B9EA Off the top? Skip.
  $B9EE On-screen and active: draw it.
@ $B9F1 label=draw_all_objects_next
  $B9F1 Advance to the next pool entry – 9 bytes per slot – and loop.
  $B9FB
@ $B9FC label=draw_object
c $B9FC Draw one object's sprite into the back buffer
D $B9FC Draws one object's 16×16 sprite into the back buffer with an OR-blit. It then stamps the dirty counter of every cell it covered.
R $B9FC I:IX the object's sprite record
  $B9FC Turn the object's position into a screen address.
  $B9FF #R$BB11 left the sprite's sub-cell horizontal pixel offset in #REGa. Non-zero means the sprite is not byte-aligned – take the shifted-blit path; zero falls through to the byte-aligned blit.
  $BA04 Save SP, then point it at the sprite data so each POP reads a 16-pixel row.
  $BA0F Sixteen rows to draw
@ $BA11 label=draw_object_row
  $BA11 Park the row counter in the alternate accumulator – the blit below needs #REGa itself.
  $BA12 Read the next two sprite bytes (one row).
  $BA13 OR-blit the row's two halves into the back buffer – sprites overlay.
  $BA1B Step down one pixel row, and carry across the character and third boundaries.
@ $BA33 label=draw_object_third_cross
  $BA33 The row crossed a screen third: wrap the low byte and step into the next third.
@ $BA37 label=draw_object_next_row
  $BA37 Loop until all 16 rows are drawn.
  $BA3B Restore SP, then stamp the covered cells' dirty counters. A cell-aligned sprite covers two columns on each of two rows.
@ $BA47 isub=ADD A,WORKBUF_FB/$100
  $BA5D
@ $BA5E label=draw_object_stamp_lower
  $BA5E A sprite that straddles a row boundary also stamps the dirty counter of the lower row of cells.
@ $BA73 label=draw_object_aligned_done
  $BA73
@ $BA74 label=draw_object_shifted
  $BA74 A sprite whose X is not cell-aligned takes the shifted path. Twice the pixel shift becomes the offset byte of the jump that enters the shift staircase.
@ $BA75 isub=LD (draw_shifted_dispatch+1),A
@ $BA86 label=draw_shifted_row
  $BA86 Top of the shifted path's per-row loop, re-entered from the #R$BAC5(row-loop test) for every row after the first. Park the row counter and take the row's two sprite bytes; the staircase needs #REGa clear.
@ $BA89 label=draw_shifted_dispatch
@ $BA8B label=draw_shifted_body
c $BA8B Blit an object's sprite shifted N pixels, over three columns
D $BA8B Blits each row of a sprite shifted right by N pixels across three back-buffer columns, then stamps the dirty counters of the cells it covered. It is entered by a jump.
  $BA8B Shift staircase: Eight less N of these ADD HL,HL / ADC A,A pairs run. They shift the row right by N pixels into A:H:L.
N $BA9B The shifted row spans three columns. The base column has its leftmost N pixels blank, then comes the middle column, and the rest spills into a third column on the right.
  $BA9B OR-blit A, H and L into three consecutive back-buffer columns, then step C back to the base column.
  $BAA9 Step down one pixel row, and carry across the character-cell and third boundaries.
@ $BAC1 label=draw_shifted_third
  $BAC1 That row crossed a screen third: wrap the low byte and step into the next third.
@ $BAC5 label=draw_shifted_next_row
  $BAC5 Loop until all 16 rows are drawn.
  $BAC9 Restore SP, then stamp the work buffer's dirty counter for every cell the sprite covered, across all three columns. A sprite flush with a character row covers only two rows of them.
@ $BAD5 isub=ADD A,WORKBUF_FB/$100
  $BAF1
@ $BAF2 label=draw_shifted_stamp_low
  $BAF2 A sprite that straddles a character row covers three rows of cells.
  $BB10
@ $BB11 label=object_backbuf_addr
c $BB11 Compute an object's back-buffer address from its pixel position
D $BB11 Computes the back-buffer address of an object's top-left pixel, and the sub-byte shift its X leaves.
R $BB11 I:IX the object's sprite record
R $BB11 O:BC back-buffer address of its top-left pixel
R $BB11 O:A the sub-byte shift, 0 when byte-aligned
R $BB11 O:IX unchanged
  $BB11 Turn X into the object's character column, in C.
  $BB1A Take the Y pixel coordinate.
  $BB1D Take the pixel row within the character cell from the low bits of Y.
  $BB21 Build the high byte from the back-buffer's base page, the screen third and the pixel row.
@ $BB28 isub=ADD A,BACKBUF_BASE/$100
  $BB2B Build the low byte from the character row within the third and the column.
  $BB32 Return the pixel offset into the byte as the shift, 0 when X is byte-aligned.
  $BB37
@ $BB38 isub=LD HL,WORKBUF_FB+$5F
@ $BB38 label=recompose_cells
c $BB38 Recompose flagged cells into the back buffer
D $BB38 Recomposes every flagged work-buffer cell into the back buffer. The scan skips the top three character rows, which are static, as the #R$BBA4(blit) does.
  $BB38 Start one cell before the first scanned playfield cell; the loop's INC HL lands on it.
  $BB3B Clear the accumulator for the flag test.
@ $BB3C label=recompose_next_cell
  $BB3C Advance to the next cell; a zero flag is a clean cell – skip it.
  $BB41 The $FF terminator wraps to 0 here, and the scan ends
  $BB43 Save the work-buffer pointer.
  $BB44 Drop 3 pages to the same cell in the tile map.
  $BB47 Read the cell's tile code.
  $BB48 The empty tile erases the cell – take the clear path.
  $BB4D Save the tile pointer.
  $BB4E Point HL at the tile's glyph in the tile set, 8 bytes per tile.
  $BB58 Move the glyph source into BC.
  $BB5A Restore the tile pointer.
  $BB5B Turn the tile page into the back-buffer page of the cell's top pixel row. The low byte keeps the column.
@ $BB61 isub=ADD A,BACKBUF_BASE/$100
  $BB64 Copy the 8 glyph rows into the back buffer.
  $BB82 Restore the work-buffer pointer.
  $BB83 Resume the scan with the flag accumulator cleared. The flag stays set for the #R$BBA4(blit) to age by one.
@ $BB87 label=erase_cell
  $BB87 Build the same back-buffer page from the tile pointer.
@ $BB8D isub=ADD A,BACKBUF_BASE/$100
  $BB90 Zero fill value
  $BB91 Erase the cell: zero its 8 back-buffer rows.
  $BBA0,1 Restore the work-buffer pointer.
@ $BBA4 isub=LD HL,WORKBUF_FB+$5F
@ $BBA4 label=blit_dirty_cells
c $BBA4 Blit dirty cells to the display and age their counters
D $BBA4 Copies every dirty playfield cell from the back buffer to the display file and ages its dirty counter.
N $BBA4 The sprite drawer stamps each covered cell's counter to 2. The blit shows the composed cell and ages the counter to 1. Behind it, the #R$BB38(recompose pass) then rebuilds the clean background. A frame later the blit copies that background back, so the sprite leaves no trail.
  $BBA4 Scan from one cell before the first playfield cell. The top three character rows are static and never redrawn. Rows 0 and 1 hold the score panel, and row 2 the top wall's upper half.
@ $BBA8 label=find_dirty_cell
  $BBA8 Advance to the next dirty cell; #REGa ORs the flags so clean (0) cells are skipped without a separate test.
  $BBAD Counter $FF is the end-of-list terminator that each #R$8BD0(level's setup) plants; stop here.
  $BBAF Age this cell's dirty counter by one frame. The #R$B9FC(sprite drawer) re-stamps it every frame a sprite covers the cell, so it stays non-zero until one frame after the sprite leaves.
  $BBB1 Find the cell on the screen and in the back buffer. The page of the list that holds the cell picks the screen third, one page per third. A stray cell past the end of the list gets no real third. Its copy then lands in the attribute file and reads from the tile map (see #LINK(Defects#scramble)(Scramble)).
  $BBBF Copy the cell's 8 pixel-row bytes from the back buffer to the display file. Consecutive rows of a char cell are $100 apart, so INC H/INC D walk both pointers down one row in lockstep. A real cell never touches the attribute file. The stray cell above writes tile codes there, so the attributes read them as colors.
  $BBDD Restore the flag pointer, reset the accumulator, and continue the scan.
@ $BBE2 label=next_random
c $BBE2 Draw the next pseudo-random byte
D $BBE2 Returns the next pseudo-random byte and advances the #R$BBFF(16-bit seed). The game's general random source.
R $BBE2 O:A the next pseudo-random byte
  $BBE2 Preserve the caller's #REGhl and #REGde.
@ $BBE4 isub=LD HL,(rng_seed)
  $BBE4 Advance the seed: add its own low byte to its high byte, add a constant, and write it back.
@ $BBEF isub=LD (rng_seed),HL
  $BBF2 Index the entropy window by the new seed's low byte.
  $BBF8,4 Mix the Z80 refresh register, the seed's low byte and the window byte into #REGa. The refresh register and the memory byte add entropy from when the draw happens.
@ $BBFF label=rng_seed
B $BBFF,2 The 16-bit seed
@ $BC01 label=mirror_sprite_bank
c $BC01 Horizontally mirror the object sprite bank in place
D $BC01 Flips the object sprite bank left-to-right in place so every sprite faces the active play side. The mirror is its own inverse.
  $BC01 Hold the bit-reverse table's page in the alternate bank for byte translation.
  $BC05 Mirror the sprite bank in place, from its base.
  $BC08 Walk the whole sprite bank, two bytes at a time.
@ $BC0B label=mirror_row
  $BC0B Read the row's two bytes.
  $BC0F Pass the pair into the alternate bank for table lookup.
N $BC12 The bit-reverse table is 256 bytes in the page at the tile-glyph base. The lowest tile codes are never written to the tile map, so those bytes are free for it. The tile glyphs begin one page higher.
  $BC12 Mirror each byte through the bit-reverse table.
  $BC16 Carry the mirrored bytes back into the sprite bank.
  $BC19 Write the mirrored bytes back in swapped order and advance to the next row.
  $BC1D Loop until all rows are mirrored.
  $BC22
@ $BC23 label=controls
g $BC23 Player control state
D $BC23 The live control bits, then the input device.
B $BC23,1
@ $BC24 label=input_device
B $BC24,1 Input device: 0 for the keyboard, 1 for a Kempston joystick, 2 and 3 for the two key-set joysticks on the 6–0 keyboard row
@ $BC25 label=read_ctrl
c $BC25 Read the player's controls into the control bitfield
D $BC25 Rebuilds the #R$BC23(control bitfield) from scratch on each call.
N $BC25 The #R$BC23(control bitfield) it builds, whose bits 0–1 and 5–7 are always 0: #TABLE(default) { =h Bit | =h When set } { 2 | Down/back held } { 3 | Up/forward held } { 4 | Fire held } TABLE#
N $BC25 The control bitfield's two motion bits are forward and back along the bat's fixed edge.
N $BC25 Per-device reads, by #R$BC24(input device) value: #TABLE(default) { =h Device code | =h Device | =h Fire | =h Up (bit 3) | =h Down (bit 2) } { 0 | Keyboard | Space | P | L } { 1 | Kempston | port bit 4 | port bit 3 | port bit 2 } { 2 | Cursor | key 0 | key 7 | key 6 } { 3 | Sinclair | key 0 | key 9 | key 8 } TABLE#
  $BC25 Point HL at the control bitfield.
  $BC29 Zero it; every control bit is rebuilt from scratch each call.
  $BC2A Read the selected input device.
  $BC2E
  $BC31 Kempston joystick
  $BC35 Cursor keys
@ $BC3A isub=LD BC,KBD_ROW_6_0
  $BC3A Sinclair joystick, the fall-through – read the 6/7/8/9/0 keyboard half-row.
N $BC3F Each scheme tests its inputs and sets the output bit for each one. The field is zeroed at entry, so nothing is cleared mid-read. A pressed key on the keyboard and the two key-set joysticks reads as 0. The Kempston port reads a pressed input as 1.
  $BC3F Keep the five key bits.
  $BC41 Key 0 (fire) up?
  $BC45 Fire held
@ $BC47 label=read_ctrl_sinclair_up
  $BC47 Key 9 (up) up?
  $BC4B Up held
  $BC4D
@ $BC4E label=read_ctrl_sinclair_down
  $BC4E Key 8 (down) up?
  $BC51 Down held
  $BC53
@ $BC54 label=read_ctrl_kempston
  $BC54 Kempston: read the joystick port.
  $BC56 Keep only the fire/up/down bits.
  $BC58 Fire pressed?
  $BC5C Fire held
@ $BC5E label=read_ctrl_kempston_up
  $BC5E Up pressed?
  $BC62 Up held
  $BC64
@ $BC65 label=read_ctrl_kempston_down
  $BC65 Down pressed?
  $BC68 Down held
  $BC6A
@ $BC6B label=read_ctrl_cursor
@ $BC6B isub=LD BC,KBD_ROW_6_0
  $BC6B Cursor keys: read the 6/7/8/9/0 keyboard half-row.
  $BC72 Key 0 (fire) up?
  $BC76 Fire held
@ $BC78 label=read_ctrl_cursor_up
  $BC78 Key 7 (up) up?
  $BC7C Up held
  $BC7E
@ $BC7F label=read_ctrl_cursor_down
  $BC7F Key 6 (down) up?
  $BC82 Down held
  $BC84
@ $BC85 label=read_ctrl_keyboard
@ $BC85 isub=LD BC,KBD_ROW_B_SPACE
  $BC85 Keyboard: read Space for fire, on the B/N/M/SymShift/Space half-row.
  $BC90 Fire held
@ $BC92 label=read_ctrl_keyboard_up
@ $BC92 isub=LD BC,KBD_ROW_Y_P
  $BC92 Read P for up, on the Y/U/I/O/P half-row.
  $BC9D Up held
  $BC9F
@ $BCA0 label=read_ctrl_keyboard_down
@ $BCA0 isub=LD BC,KBD_ROW_H_ENTER
  $BCA0 Read L for down, on the H/J/K/L/Enter half-row.
  $BCAA Down held
  $BCAC
@ $BCAD label=wait_no_key
c $BCAD Wait until no key is pressed
D $BCAD Loops until all keys are released.
  $BCAD Select all keyboard half-rows at once.
  $BCB0 Read them.
  $BCB2 Keep the five key bits.
  $BCB4 Invert the value read, then loop while any key is still down.
  $BCB8
@ $BCB9 label=kstate_save
c $BCB9 Front end: title screen, input-device menu, and attract cycle
D $BCB9 Runs the game's front end, and returns only when the player starts a game. It leaves the chosen #R$BC24(input device) set.
B $BCB9,8 Saved copy of the ROM keyboard state
@ $BCC1 label=frames_save
B $BCC1,3 Saved copy of the #R$5C78(ROM FRAMES counter): its low word first, then its high byte
@ $BCC4 label=menu_attr_ptr
B $BCC4,2 The attribute-cell address of the input-device line the menu highlights, low byte first
@ $BCC6 label=title_screen
C $BCC6
N $BCC6 Setup: black border, cleared bitmap, bright white attributes, logo and menu drawn, credits scroller primed, title tune cued. Falls into the menu loop.
  $BCC6,3 Black border
  $BCCC,5 Paint every attribute cell bright white on black.
  $BCDA Point the #R$D566(tune pointer) at the start of the title tune.
@ $BCE0 label=title_menu_loop
N $BCE0 One pass per loop. Poll the 1–4 device keys and pulse the selected menu line. Check the O key, play one tune note, then run one attract/frame step. An option key does nothing when its device is already current, so a second press of the active option neither beeps nor redraws. There is no option 5 on the menu, so its key is ignored.
  $BCE0 Stash the current input device in A' for the re-select check below.
  $BCE4 Read the 1/2/3/4/5 keyboard half-row and keep the five key bits.
  $BCEB Key 1 down? If not, fall through to the key-2 test.
  $BCEF Already keyboard? Then just keep the pulse – no reselect.
@ $BCF3 isub=LD HL,ATTR_BASE+$10A
  $BCF3,4 Otherwise arm the keyboard and select the KEYBOARD line's attributes.
@ $BCF9 label=title_check_key2
  $BCF9 Key 2 down? If not, fall through to the key-3 test.
  $BCFD Already Kempston? Then just keep the pulse.
@ $BD02 isub=LD HL,ATTR_BASE+$14A
  $BD02,5 Otherwise arm Kempston and select the KEMPSTON line's attributes.
@ $BD09 label=title_check_key3
  $BD09 Key 3 down? If not, fall through to the key-4 test.
  $BD0D Already the cursor keys? Then just keep the pulse.
@ $BD12 isub=LD HL,ATTR_BASE+$18A
  $BD12,5 Otherwise arm the cursor keys and select the CURSOR line's attributes.
@ $BD19 label=title_check_key4
  $BD19 Key 4 down? If not, nothing is selected – go pulse the current line.
  $BD1D Already the Sinclair joystick? Then just keep the pulse.
@ $BD22 isub=LD HL,ATTR_BASE+$1CA
  $BD22 Otherwise arm the Sinclair/Interface II joystick and select that line's attributes; falls into the setter.
@ $BD27 isub=LD (menu_attr_ptr),HL
@ $BD27 label=title_set_device
N $BD27 Commit the newly chosen option. Remember the line's attribute address for the pulse and store the device. Redraw the menu to clear the old highlight, and beep.
  $BD27 Save the selected line's attribute address (in the buffer just below this routine) for the pulse animation.
  $BD2A Store the chosen device.
@ $BD33 isub=LD HL,(menu_attr_ptr)
@ $BD33 label=title_pulse_menu
N $BD33 Pulse the selected option. Both character rows of the line step through the bright inks magenta, green, cyan, yellow and white once per frame. From white they wrap back to magenta. The line comes from the choice made by the option keys, the KEYBOARD line by default.
  $BD33 Load the selected line's attribute address; keep a copy for the second row.
  $BD37 Pulse every cell of the line's first character row.
@ $BD39 label=title_pulse_loop1
  $BD39 Step this cell's attribute, and wrap at the end of the run.
@ $BD3F label=title_pulse_set1
  $BD3F Store the stepped attribute, advance to the next cell, and repeat for all 20.
@ $BD45 label=title_pulse_wrap1
  $BD45 Past bright white – restart the cell at bright magenta.
@ $BD49 label=title_pulse_line2
  $BD49 Drop to the menu line's second character row and pulse it the same way.
@ $BD4F label=title_pulse_loop2
  $BD4F Step each cell of the second row the same way.
@ $BD55 label=title_pulse_set2
  $BD55 Write the stepped ink back to this cell.
@ $BD5B label=title_pulse_wrap2
  $BD5B Past bright white – restart the cell at bright magenta.
@ $BD5F label=title_check_options
@ $BD5F isub=LD BC,KBD_ROW_Y_P
N $BD5F Check the O key (options), then advance the title tune by one note. At the terminator the tune loops.
  $BD5F Read the Y/U/I/O/P half-row and keep the five key bits.
  $BD66 O pressed? Enter the options screen.
  $BD6B Play the next title-tune note. Has the tune reached its terminator?
  $BD70 Not the end – skip the rewind.
  $BD72 Tune finished – rewind the tune pointer to loop it.
@ $BD78 label=title_attract_loop
N $BD78 Per-frame step of the menu loop. It busy-waits to set the pace, then waits for one frame, the front end's only interrupt sync. The ROM keyboard state and frame counter are saved and restored around it, because they lie inside the #R$5C00(sprite bank). Then scroll the credits two pixels, read the player's controls, and test the start inputs.
  $BD78 Pace the loop with a busy-wait.
  $BD7E Park IY at zero before the frame sync, because the interrupt's ROM handler writes through it. The keyboard scan sets a flag bit in the byte after IY on each new key. The frame tick increments a byte at a fixed offset from IY each time FRAMES wraps. Parked at zero, both writes land in ROM and do nothing. After a game IY still points at a game record, where they would land in game memory.
  $BD82 Save the ROM keyboard state (KSTATE) into the buffer below this routine. Those bytes are also the head of the sprite bank, and the interrupt that ends the HALT below rewrites them. The same interrupt also writes the byte after them, which nothing restores – see #LINK(Defects#speck)(Defects).
@ $BD85 isub=LD DE,kstate_save
  $BD8D Save the ROM frame counter (FRAMES).
@ $BD90 isub=LD (frames_save),HL
@ $BD96 isub=LD (frames_save+$2),A
  $BD99 Wait for the next frame interrupt.
@ $BD9C isub=LD HL,kstate_save
  $BD9C Restore KSTATE so the interrupt's keyboard scan does not perturb it.
@ $BDA7 isub=LD HL,(frames_save)
  $BDA7 Restore the ROM frame counter.
@ $BDAD isub=LD A,(frames_save+$2)
  $BDB3 Scroll the credits two pixels this frame (two steps).
  $BDB9,5 Credits exhausted? Switch to the high-score display.
  $BDC1 Fire held? Return to start the game.
@ $BDC7 isub=LD BC,KBD_ROW_6_0
  $BDC7 Read the 0/9/8/7/6 half-row and keep the five key bits.
  $BDCE,5 Key 0 up? Loop the menu. Key 0 (START) pressed falls through to RET and starts the game.
@ $BDD4 label=title_attract_check
N $BDD4 Credits finished: show the high-score table and play the title tune once. Any key, the end of the tune, or fire restarts the front end. The game cannot be started from this screen – fire here only loops back to the menu.
  $BDD7 Rewind the #R$D566(tune pointer) for the high-score wait.
@ $BDDD label=title_attract_cont
  $BDDD Pace the high-score wait.
  $BDE3 Play the next tune note. Has the tune reached its terminator?
  $BDE8 Restart the whole front end.
  $BDEB Read all key half-rows at once and keep the five key bits.
  $BDF4 Any key down? End the wait and restart the front end.
  $BDF9 Loop until fire is pressed, then restart.
@ $BE00 label=title_attract_end
  $BE00 Fire or any key: back to the top of the front end.
@ $BE03 isub=LD HL,SCREEN_BASE+$49
@ $BE03 label=draw_title_logo
c $BE03 Draw the KRAKOUT title logo
D $BE03 Draws the KRAKOUT title logo, a 14-by-3 block of glyph cells with its own per-cell attribute block.
  $BE03 Pass 1 destination: the logo's top-left display cell, character row 2 column 9.
  $BE06 Glyph bitmaps: 8 bytes per cell, cell after cell.
  $BE09 Walk the logo's character rows (rows 2–4).
@ $BE0B label=logo_row
  $BE0B Hold the row counter and this row's first cell across the columns below.
  $BE0D Walk this row's cells (columns 9–22).
@ $BE0F label=logo_col
  $BE0F Hold the column counter and this cell's address across the glyph copy.
  $BE11 Draw this cell's glyph with a throwaway attribute. Pass 2 repaints every cell's color.
  $BE17 Step to the next column in the same row. After the 14th column, take the row's start cell back, step down one character row and repeat.
@ $BE22 isub=LD HL,ATTR_BASE+$49
N $BE22 Pass 2 copies the #R$C049(attribute block) into the attribute file, cell for cell, which is what gives the logo its multicolor look. Pass 1 left every cell a throwaway attribute.
  $BE22 Pass 2 destination: the attribute cell for character row 2 column 9.
  $BE25 Per-cell attribute block: the logo's final colors. They replace the throwaway attributes that pass 1 wrote.
@ $BE2A label=logo_attr_row
  $BE2A Hold the row counter and this row's first attribute cell across the columns below.
@ $BE2E label=logo_attr_col
  $BE2E,4 Copy one cell's final attribute into the attribute file.
  $BE34 Take the row's start cell back, step down one character row and repeat.
  $BE3B
@ $BE3C label=draw_title_menu
c $BE3C Print the front-end menu text
D $BE3C Prints the seven front-end menu lines at #R$987B(double height) from the #R$BE8A(menu text), each in a set ink.
  $BE3C Line 1, character row 6 column 8.
@ $BE3F isub=LD DE,main_menu_text
  $BE3F Menu text, each line closed by a terminator
  $BE42 Bright white
  $BE47 Line 2, character row 8 column 8.
N $BE4A Lines print top to bottom from the #R$BE8A(menu text).
  $BE4A Step DE past the terminator to the next line; repeats before each line below.
  $BE4B Bright yellow
  $BE50 Line 3, character row 10 column 8.
  $BE54 Bright magenta
  $BE59 Line 4, character row 12 column 8.
  $BE5D Bright green
  $BE62 Line 5, character row 14 column 8.
  $BE66 Bright cyan
  $BE6B Line 6, character row 16 column 8.
  $BE6F Bright white
@ $BE74 isub=LD HL,SCREEN_BASE+$10A4
  $BE74 Line 7, copyright, character row 21 column 4.
  $BE78 Bright yellow ink on blue paper.
  $BE7D Repaint column 8 of character rows 10–17 to bright white. There column 8 holds the keycap digits 2, 3 and 4, and a blank on the OPTIONS line. The keycaps of START GAME and KEYBOARD keep their own line color. The white is a cosmetic emphasis, and the selected line has a highlight of its own.
  $BE80 Walk down the keycap column, one attribute row at a time.
@ $BE82 label=menu_paint_col
  $BE82 Force the bright-white attribute into the cell.
  $BE89
@ $BE8A label=main_menu_text
T $BE8A,12,11:1 Start-game line
@ $BE96 label=menu_line_keyboard
T $BE96,10,9:1 Keyboard line
@ $BEA0 label=menu_line_kempston
T $BEA0,19,18:1 Kempston joystick line
@ $BEB3 label=menu_line_cursor
T $BEB3,17,16:1 Cursor joystick line
@ $BEC4 label=menu_line_if2
T $BEC4,14,13:1 Interface II line
@ $BED2 label=menu_line_options
T $BED2,13,12:1 Options line
@ $BEDF label=menu_copyright
T $BEDF,26,25:1 Copyright line
@ $BEF9 label=title_logo_glyphs
b $BEF9 KRAKOUT title-logo glyph bitmaps
D $BEF9 The KRAKOUT title logo: 42 glyph cells in a 14-by-3 grid, then their 42 attribute bytes in the same order.
N $BEF9 #UDGTABLE { #UDGARRAY14,,2($BEF9-$C041-8)[$C049-$C072](title_logo) } TABLE#
B $BEF9,336,8
@ $C049 label=title_logo_attrs
B $C049,42,7
@ $C073 label=options_menu
c $C073 Options / start menu
D $C073 Runs the options screen, where the player sets the bat side, sound effects, ball speed, control type and its inertia or dual-speed value. The player can also load a fresh level set from tape, and Q returns to the #R$BCC6(title screen).
N $C073 Entry setup: #R$9829(clear the display) and flood every attribute with $47 (bright white ink on black paper). Then #R$C21C(draw the menu text and current settings), and fall into the input loop.
  $C073 Clear the display, then flood all attributes to bright white ink on black.
@ $C07E label=options_loop
N $C07E Top of the input loop, re-entered after every change. A fixed busy-wait paces the cursor blink, then the selected row is recolored. The controls are read once (#R$BC25), and the held direction or fire is dispatched.
  $C07E Pace the cursor blink with a busy-wait of 10000 iterations.
N $C084 Highlight the selected row. Its ink advances to the next color on every pass of the loop, and paper, bright and flash stay. The highlight cycles through the ink colors.
  $C084 Fetch the selected row's screen address from the #R$C2A9(options-row screen addresses), a word per row.
  $C093 Convert the screen address to its attribute-file address.
  $C09C Step the row's ink on to the next of the eight, and keep paper, bright and flash, across the whole row.
@ $C0A7 label=options_highlight
  $C0A7 Flood the new attribute across the row's 21 cells.
  $C0AB Read the controls into the #R$BC23(control bits).
  $C0AE Play the #R$B77C(key-press blip) to acknowledge any held control.
  $C0B6 If up is held (bit 3), move the cursor up; otherwise check down.
  $C0BA Redraw to erase the old highlight before the move.
  $C0BD Cursor 0 wraps up to the last row; otherwise decrement.
@ $C0C7 label=options_cursor_up
  $C0C7 Any other cursor row just steps back one.
@ $C0C8 label=options_cur_store_up
  $C0C8 Store the cursor and rerun the loop.
@ $C0CE label=options_check_down
  $C0CE If down is held (bit 2), move the cursor down; otherwise check fire.
  $C0D2 Redraw to erase the old highlight before the move.
  $C0D5 The last row wraps down to 0; otherwise increment.
@ $C0DF label=options_cursor_down
  $C0DF Any other row steps forward one.
@ $C0E0 label=options_cur_store_down
  $C0E0 Store the cursor and rerun the loop.
@ $C0E6 label=options_fire
  $C0E6 Fire held (bit 4)? If not, nothing changed – poll for Q to quit.
N $C0EB Fire acts on the row the cursor sits on. Each row's own entry states the values it accepts. #TABLE(default) { =h Row | =h Option | =h Variable } { 0 | Bat side | #R$8E9E } { 1 | Sound effects | #R$8E9F } { 2 | Ball speed | #R$8EA0 } { 3 | Control type | #R$8EA1 } { 4, control type 0 | Inertia rate | #R$8EA4 } { 4, control type 1 | Dual-speed slow | #R$8EA2 } { 4, control type 2 | Dual-speed fast | #R$8EA3 } { 5 | LOAD LEVELS | – } TABLE#
  $C0EB Dispatch on the cursor row; row 0 is bat side.
  $C0F1 Bat side: toggle it between 0 and 1, the edge the bat rides.
  $C0FA Mirror every sprite to face the new side, then apply.
@ $C100 label=options_opt_sound
N $C100 Sound FX (row 1). Toggle the #R$8E9F(sound-effects flag) between 0 (off) and 1 (on), then redraw. The #R$C21C(redraw) is what actually mutes, through the #R$B9B4(sound primitive). This handler also restores the two speaker-port writes inside it, the #R$B9B6(high write) and the #R$B9BC(low write). Its path to disable them when off never runs.
  $C100 The sound-FX row
  $C104 Toggle the sound-effects flag between 0 (off) and 1 (on).
  $C10D Redraw. This re-patches the first byte of the #R$B9B4(sound primitive) to RET when sound is off.
N $C110 BUG: the #R$C11D(sound-off branch) is unreachable. It is taken only when the #R$C21C(redraw) returns with the zero flag set. That routine always returns with it reset, because its last action, a #R$9844(string print), returns on the set bit 7 of the string's terminator. The two speaker writes are therefore always restored. The mute still works through the #R$B9B4(sound primitive). The path that disables the speaker writes is dead code.
  $C110 Restore the two OUT ($FE),A writes inside the #R$B9B4(sound primitive). This runs whether sound is on or off.
@ $C115 nowarn
@ $C118 nowarn
@ $C11D label=options_sound_off
  $C11D Sound off (unreachable): blank the two speaker writes to NOP NOP.
@ $C120 nowarn
@ $C123 nowarn
@ $C126 label=options_applied
  $C126 Either way, redraw the options page with the new value.
@ $C129 label=options_opt_speed
  $C129 The ball-speed row
  $C12D Ball speed: cycle it up, and wrap the top of the range back to the bottom.
@ $C137 label=options_set_speed
  $C137 Store the speed and rewrite the digit shown on the #R$C326(BALL SPEED line).
@ $C142 label=options_opt_control
  $C142 The control-type row
  $C146 Control type: cycle it up by 1, and wrap the last value back to 0.
@ $C14F label=options_set_control
  $C14F Store the type, then apply. The #R$C21C(redraw) refreshes the row text.
@ $C155 label=options_ctrl_value
N $C155 Row 4 edits one of three values, picked by the current #R$8EA1(control type).
  $C155 The control-type value row
  $C159 Branch on control type: 0 edits inertia here, and non-zero edits a #R$C174(dual-speed value).
  $C15F Inertia: cycle it up, and wrap the top of the range back to the bottom.
@ $C169 label=options_set_inertia
  $C169 Store and rewrite the digit on the #R$C375(INERTIA line).
@ $C174 label=options_opt_dual_slow
  $C174 Dual-speed: the lower type edits slow, the higher fast.
  $C178 Dual-speed slow: cycle it up, and wrap the top of the range back to the bottom.
@ $C182 label=options_set_dual_slow
  $C182 Store and rewrite the digit on the #R$C34D(DUAL SPEED SLOW line).
@ $C18C label=options_opt_dual_fast
  $C18C Dual-speed fast: cycle it up, and wrap the top of the range back to the bottom.
@ $C196 label=options_set_dual_fast
  $C196 Store and rewrite the digit on the DUAL SPEED FAST line.
@ $C1A0 label=options_opt_load
N $C1A0 LOAD LEVELS (row 5). Reached only with the cursor on row 5. Its guard sends any other row to the #R$C207(apply tail). Waits for all keys to #R$BCAD(release), then prints the #R$C3A9(PRESS PLAY ON TAPE prompt). It then loads a fresh level set from tape through the ROM tape loader into the level-data region. The #R$C1D4(post-load continuation) runs once the load finishes.
  $C1A0 Only the LOAD LEVELS row loads; any other goes to the apply tail.
  $C1A4 Wait for all keys to release.
  $C1A7 Print the #R$C3A9(PRESS PLAY ON TAPE prompt).
  $C1B2 Set up the ROM tape load: a fresh level set straight into the level-data region.
@ $C1BC nowarn
  $C1BC Hold the post-load continuation in HL, and save the flag byte and the load carry in AF', as the ROM loader's own entry does.
  $C1C2 Border white, stack the post-load continuation as the loader's return, then jump into the ROM tape loader.
@ $C1D4 label=load_result
c $C1D4 Post-load handler for the LOAD LEVELS tape read
D $C1D4 Handles the ROM tape loader's return from the #R$C1A0(LOAD LEVELS option), and returns to the options menu either way. On a failed load it first shows "ERROR IN LOADING!" and buzzes the #R$B873(load-error tone) ten times.
N $C1D4 Both exits merge at the #R$C207(apply tail). Each branch #R$9829(clears the bitmap) and #R$9837(fills the attributes) bright white on black.
R $C1D4 I:F carry set when the load succeeded, clear when it failed
  $C1D4 Load failed (carry reset)? Take the error branch.
  $C1D6 Success: black border, clear the screen, then return to the options menu.
  $C1E1 Rejoin the options apply/quit tail.
@ $C1E3 label=load_error
  $C1E3 Clear the screen to bright white on black.
@ $C1EB isub=LD HL,SCREEN_BASE+$886
  $C1EB Print "ERROR IN LOADING!" at its screen cell.
  $C1F6 Buzz the load-error tone ten times.
@ $C1F8 label=load_error_beep
  $C1F8 One load-error buzz; loop ten times.
  $C1FF Clear the screen again, then fall through to the options apply/quit tail.
@ $C207 label=options_apply_tail
c $C207 Redraw the options screen, then poll Q to quit
D $C207 Tail shared by every fire-triggered option change: it #R$C21C(redraws the option lines) so the new value shows, then polls Q. A held Q leaves to the #R$BCC6(title screen), and otherwise the #R$C07E(menu input loop) resumes.
  $C207 Repaint the page so the new value shows.
@ $C20A label=options_poll_quit
N $C20A Alternate entry, taken from the #R$C0E6(fire test) when fire is not held: nothing changed, so it skips the redraw and polls Q straight away.
  $C20A Read the "Q W E R T" keyboard half-row.
  $C20F Keep the five key bits; a pressed key reads as 0.
  $C211 Q held? (bit 0, active low).
  $C213 Q up: re-enter the menu input loop to re-read the cursor and fire.
  $C216 Q held: wait for every key to release, then return to the title screen.
@ $C21C isub=LD HL,SCREEN_BASE+$2B
@ $C21C label=draw_options_menu
c $C21C Draw the options screen
D $C21C Renders the whole options screen from the current option values. It draws the "OPTIONS" heading, the "Q returns" line and the "LOAD LEVELS" prompt. One line per option shows its value.
D $C21C Reads the #R$8E9E(bat side), the #R$8E9F(sound-effects flag) and the #R$8EA1(control type) to choose each line's text. Side effect: makes the #R$B9B4(sound primitive) play or mute to match the sound-effects flag.
  $C21C "OPTIONS" heading in double height, bright yellow on blue
@ $C227 isub=LD HL,SCREEN_BASE+$10E3
  $C227 The "Q" RETURNS TO MAIN MENU line in bright white on black, the attribute reused by every line below until reset
  $C232 Bat-side line
  $C235 A non-zero bat side selects "BAT IS ON THE - LEFT".
  $C240 Bat side 0 selects "BAT IS ON THE - RIGHT".
  $C243 Print whichever was chosen.
  $C246 Sound line
  $C249 Sound effects: mute them on 0, and enable them on any other value.
  $C24F Sound on: write the "LD A,n" opcode over the first byte, to restore its normal "LD A,$10" so the speaker primitive runs; pick the "SOUND FX - ON" text.
@ $C251 nowarn
  $C259 Sound off: write the RET opcode over the first byte so the primitive returns at once and stays silent; pick the "SOUND FX - OFF" text.
@ $C25B nowarn
  $C261 Render the sound line (the on and off paths merge here).
  $C264 Print the ball-speed line. The speed handler writes the speed digit (1–6) into the string.
  $C26D "BAT CONTROL TYPE" header in bright white on red
  $C278 Bat-control value line
  $C27B Control type: the first direct-control type selects "DUAL SPEED SLOW - n". The option handlers write each digit n into its string.
  $C28A The second direct-control type selects "DUAL SPEED FAST - n".
  $C28F Inertia control selects "INERTIA - n".
  $C292 Print whichever was chosen.
  $C297 Print the "LOAD LEVELS" prompt. Fire on this line #R$C1A0(loads the level set from tape).
  $C2A2
@ $C2A3 label=delay
c $C2A3 Busy-wait delay of BC iterations
D $C2A3 Busy-waits BC iterations (0 means 65536) – the game's general-purpose pause for attract screens and inter-screen waits.
R $C2A3 I:BC iteration count; 0 means 65536
R $C2A3 O:BC zero, because the loop runs until the count reaches it
  $C2A3 Count the 16-bit value down and loop until it reaches zero.
  $C2A8
@ $C2A9 label=opt_row_addrs
w $C2A9 Options-row screen addresses
W $C2A9,12,2 The display-file address of each options row, in menu order
@ $C2B5 label=options_text
t $C2B5 Options-screen lines
T $C2B5,9,8:1 The OPTIONS heading
@ $C2BE label=opt_return
T $C2BE,24,23:1
@ $C2D6 label=opt_bat_right
T $C2D6,21,20:1
@ $C2EB label=opt_bat_left
T $C2EB,21,20:1
@ $C300 label=opt_sound_on
T $C300,19,18:1
@ $C313 label=opt_sound_off
T $C313,19,18:1
@ $C326 label=opt_ball_speed
T $C326,16,16 The BALL SPEED option line, up to its value cell
@ $C336 label=ball_speed_digit
T $C336,2,1:1 The ball-speed value cell, then the line's terminator
@ $C338 label=opt_bat_control
T $C338,21,20:1
@ $C34D label=opt_dual_slow
T $C34D,18,18 The DUAL SPEED SLOW option line, up to its value cell
@ $C35F label=dual_slow_digit
T $C35F,2,1:1 The slow-step value cell, then the line's terminator
@ $C361 label=opt_dual_fast
T $C361,18,18 The DUAL SPEED FAST option line, up to its value cell
@ $C373 label=dual_fast_digit
T $C373,2,1:1 The fast-step value cell, then the line's terminator
@ $C375 label=opt_inertia
T $C375,16,16 The INERTIA option line, up to its value cell
@ $C385 label=inertia_digit
T $C385,6,5:1 The inertia value cell, then the pad that clears the wider dual-speed lines
@ $C38B label=msg_load_levels
T $C38B,11,10:1
@ $C396 label=msg_load_error
T $C396,19,18:1
@ $C3A9 label=msg_press_play
T $C3A9,20,19:1
@ $C3BD label=options_cursor
g $C3BD Options-menu cursor and credits-marquee state
D $C3BD The options-menu cursor, then the credits marquee's pixel phase and read pointer.
B $C3BD,1 Options-menu cursor row, 0 to 5
@ $C3BE label=credits_scroll_phase
B $C3BE,1 Credits-marquee pixel phase, 0 to 7
@ $C3BF label=credits_read_ptr
W $C3BF,2 Read pointer into the #R$C443(credits message)
@ $C3C1 isub=LD HL,ATTR_BASE+$277
@ $C3C1 label=credits_scroll_init
c $C3C1 Reset the title-screen credits marquee to the start of its message
D $C3C1 Resets the credits scroller so the message restarts from its first character, with the load column blanked. It then runs on into the #R$C3D0(first scroll step).
N $C3C1 The marquee is one character row tall at screen row 19, over columns 8–23. New glyphs are dropped into the rightmost cell (the load column) and scroll leftward into view. That cell is black ink on black paper, so a freshly fed glyph stays hidden until it scrolls into the next cell.
  $C3C1 Blank the load column (rightmost marquee cell, row 19 column 23): black ink on black paper hides the glyph fed there until it scrolls left.
  $C3C6 Point the read pointer at the first character of the #R$C443(credits message).
  $C3CC Reset the pixel-phase counter to 0.
@ $C3D0 label=credits_scroll_step
c $C3D0 Advance the credits marquee one pixel and report exhaustion
D $C3D0 Scrolls the credits marquee left by one pixel and reports whether the message is finished. The text scrolls two pixels per frame.
N $C3D0 A phase counter cycles through eight pixel steps. On the eighth it #R$C41E(drops the next glyph) into the rightmost cell. One whole character is therefore consumed per eight pixel steps.
R $C3D0 O:A $FF when the credits message is exhausted, else 0
  $C3D0 Bump the phase counter; every 8th call (one full character width) it is time to feed the next glyph.
  $C3D8 Feed the next glyph. On the message terminator, discard this frame's return and return $FF in #REGa straight to the attract loop, past the shift below.
  $C3DB On the feed path, restart the phase at 0.
  $C3DC Store the phase counter (0 just after a feed, otherwise the incremented value).
@ $C3DF isub=LD HL,SCREEN_BASE+$1077
  $C3DF Point at the top pixel row of the rightmost marquee cell (row 19 column 23).
  $C3E2 Walk the cell's pixel rows.
  $C3E4 Dead: C only feeds the two dead loads below. SLA shifts a blank pixel in at the right edge on its own.
  $C3E6 Save the row's start byte for the next pixel row.
  $C3E7 Dead: A and D are reloaded from the seed each row but never read.
  $C3E9 Shift this 128-pixel row left one pixel. SLA seeds 0 into the rightmost pixel and its high bit into carry. The RL chain walks that carry leftward across the rest of the strip's cells, one byte at a time.
  $C418 Advance to the next pixel row of the cell and repeat for all 8 rows.
  $C41C Return 0 in #REGa: the message still has bytes to come.
  $C41D
@ $C41E label=credits_scroll_feed
c $C41E Load the next credits glyph into the marquee's load column
D $C41E Loads the next credit character from the #R$C443(credits message) into the hidden rightmost marquee cell and advances the read pointer. At the message terminator it ends the scroll and reports the message exhausted.
N $C41E At the message terminator that frame's pixel shift is skipped.
R $C41E O:A $FF at the message terminator; otherwise the glyph is copied and the pointer advanced
  $C41E Fetch the read pointer.
  $C421 Read the next character; $00 marks the end of the message.
  $C425 End of message: discard the return address back into the #R$C3D0(scroll step), so RET goes to the attract loop. #REGa signals that the message is over.
  $C428
@ $C429 label=credits_feed_have_char
  $C429 Advance the read pointer past this character.
  $C42D Point HL at the code's glyph in the font, 8 bytes per glyph.
@ $C433 isub=LD DE,FONT_BASE
@ $C437 isub=LD DE,SCREEN_BASE+$1077
  $C437 Destination: top pixel row of the rightmost marquee cell.
  $C43A Walk the glyph's pixel rows.
@ $C43C label=credits_feed_copy_loop
  $C43C Copy each glyph row to the next pixel line of the cell (INC D steps down one line).
  $C442
@ $C443 label=credits
t $C443 Credits and greetings scroll
D $C443 The conversion credits, the thanks, the greetings and the sign-off, as one zero-terminated message. One row of this entry is one marquee width.
T $C443,384,16 The scrolled message
T $C5C3,1 The terminator
@ $C5C4 label=calc_spawn_coords
c $C5C4 Compute an object's spawn position
D $C5C4 Computes a spawn position for an object into the #R$5B7A(work X) and #R$5B7B(work Y), from an entry of the current level's #R$86F8(spawn-cell table). It draws nothing.
N $C5C4 Each table entry packs one cell of the brick grid as a column and a row. The spawn position is that cell's on-screen position, mirrored when the bat is on the left.
  $C5C4 Index the current level's 4-entry spawn-cell table, 4 bytes per level.
  $C5D1 Fixed-position flag set: use the table's first entry.
  $C5DB Flag clear: pick a random entry 0–3.
  $C5E1 Read the chosen packed cell.
  $C5E5 Split the cell number into its row, counted in #REGb, and its column, the remainder left in #REGa.
  $C5F0 Stash the column, then turn the row into the work Y, 16 pixels per row below the field's top edge.
  $C5FB Bat on the left? Mirror the column.
  $C601 Bat on the right: turn the column into the work X, then return.
  $C60C
  $C60D Bat on the left: count the column from the far side, then turn it into the work X. That mirrors the column.
  $C61C
@ $C61D label=process_wave_script
c $C61D Spawn objects from the current level's wave script
D $C61D Spawns at most one object per frame from one slot of the current level's #R$8888(wave script). That object is the ball gem as the secondary object, or an inhabitant in a free inhabitant record.
  $C61D Spawn nothing while the global move-freeze holds.
  $C622 Spawn nothing while the death pause runs.
  $C627 Index this level's wave script, 8 bytes per level.
  $C634 Draw a random byte; a value 0–7 (a 1-in-2 chance) selects the script slot, otherwise bail this frame.
  $C63F Read the selected slot's value (the type to spawn).
  $C642 Empty slot – spawn nothing.
  $C644 The comet is the one type that skips the throttle.
  $C648 Throttle normal spawns: bump the spawn throttle, and spawn only when it reaches its limit. Short of that, return without a spawn.
  $C652
  $C653 On the fiftieth, reset the counter and let the spawn through.
  $C655 Recover the slot value the throttle test pushed aside.
  $C656 Dispatch on the slot value: the lowest spawns the ball gem, and anything else spawns a generic inhabitant.
N $C65B The ball-gem entry spawns the ball gem as the secondary object. It refuses while any ball or gem state that would conflict is active: #R$5B7D, #R$5B7E, #R$5B38, #R$5B50, #R$5B59, #R$5B58, #R$5B66, #R$5B82, #R$5B86.
  $C65B Abort the spawn if any ball or gem state flag that would conflict is set.
  $C688 Mark the ball gem out and request a fixed-position spawn.
  $C693 Write the computed position into the ball gem's sprite record.
  $C6A7 Initialize the ball gem's #R$CB2C(logic record): an up-right heading, speed 1, and a cleared travel counter, then return.
  $C6B7
N $C6B8 Generic spawn for any type other than the ball gem. Reject a duplicate singleton and claim a free inhabitant record. Choose the position mode by type, then fall through to the #R$C73D(logic-record initialization).
  $C6B8 Scan the five inhabitant records for one that already holds this type.
  $C6D2 Matched: if that instance is a singleton refuse to spawn a second.
  $C6D7 Find a free inhabitant record – one whose type is 0; none free means abort.
  $C6EE
  $C6EF The orb only: skip the spawn while the capture slide runs.
  $C6F9 Claim the free record: store the type into it.
  $C6FD The wheel also arms the #R$5B95(wheel swarm trigger).
  $C706 Types 6, 9 and $0D spawn at the fixed table entry 0; all others at a random entry.
  $C715 Clear the fixed-position flag to request a random spawn position.
  $C71B Raise the fixed-position flag to request the fixed entry-0 spawn position.
  $C720 Either way, pick the spawn cell.
  $C723 Point IX at this slot's sprite record, 9 bytes per slot.
  $C731 Write the spawn position into the sprite record from the work X and work Y. Then fall through into the #R$C73D(logic-record initialization).
@ $C73D label=spawn_object_init
c $C73D Initialize an object from the spawn tables
D $C73D Initializes a freshly allocated logic record, laid out as the #R$CB2C(secondary object's logic record), from the type's #R$CAF0(initial heading), #R$CB04(speed) and #R$CB18(singleton flag). It clears the record's counters and animation, and sets the state to spawn.
R $C73D I:B object type (0 to $13)
R $C73D I:IY address of the object's 16-byte record
  $C73D The heading comes from the type's entry in the initial-heading table.
  $C748 The movement speed comes from the type's own entry.
  $C750 The singleton flag comes from the type's entry; non-zero blocks a second live instance.
  $C758 Clear the two counters and the animation frame.
  $C764 Clear the animation timer and set the state to spawn, the state the spawn animation runs from.
  $C76C
@ $C76D label=spawn_wheel_swarm
c $C76D Fill the free inhabitant slots with wheels
D $C76D When the #R$5B95(wheel swarm trigger) is set, clears it and fills every free #R$CB3C(inhabitant record) with a wheel. Each new wheel sits 16 pixels below the last, under the wheel that set the trigger.
N $C76D The new wheels are ordinary inhabitants, run by the #R$D1B9(wheel handler).
  $C76D Do nothing unless the wheel swarm trigger is set.
  $C772 Consume the trigger (one-shot).
  $C776 Find the record of the wheel that set the trigger among the inhabitant records; none found means done.
  $C78E
  $C78F Point IX at that source object's sprite record to read its position.
  $C79B Reset the vertical stack offset to 0.
N $C79F Fill every free inhabitant slot that is left with a new wheel, each stacked 16 pixels below the last.
  $C79F Step to the next inhabitant record; stop after the last inhabitant; skip occupied records.
  $C7A5 Walk on to the next record.
  $C7B5 Claim the free record as a wheel.
  $C7B9 Point IY at the new slot's sprite record.
  $C7C7 Give the new wheel the source wheel's X.
  $C7CD Advance the vertical stack offset one sprite down.
  $C7D5 Give the new wheel the source wheel's Y, lowered by the stack offset.
  $C7DF Restore the record pointer, set #REGb to the wheel's object type, and initialize the record.
  $C7E6 Loop to fill the next free slot.
@ $C7E8 label=object_avoid_walls
c $C7E8 Steer an object around solid playfield tiles
D $C7E8 Steers an object around solid playfield tiles each frame. When a cell ahead of it is solid, it takes a new heading from the #R$CB8C(steer table).
N $C7E8 Each heading owns an entry in the #R$CB8C(steer table) that names up to two cells to test, as offsets from the saved #R$C872(probe-tile pointer). An entry can skip either test. The two results form a blocked code in the #R$5B81(wall-probe result): first cell only, second cell only, or both. With neither cell solid, the routine keeps the heading. Otherwise it reads the new heading from the entry by that code. The #R$C897(wheel bias) then adjusts the result for the wheel.
R $C7E8 I:IX the object's #R$8F68 sprite record, with its pixel X and Y
R $C7E8 I:IY the object's logic record (#R$CB2C), read for its heading
  $C7E8 Read the heading. The down, down-left, left and up-left headings put the probe to the right of the object.
@ $C7F6 label=avoid_probe_x_low
  $C7F6 The other four headings put it to the left of the object.
@ $C7FB label=avoid_probe_x_col
  $C7FB Take the probe's tile column, 0–31.
  $C801 The up, up-right, right and up-left headings put the probe below the object. The other four put it above.
@ $C80C label=avoid_probe_y_high
  $C80C Put the probe below the object.
@ $C813 label=avoid_probe_y_low
  $C813 Put the probe above the object.
@ $C818 label=avoid_probe_y_row
  $C818 Take the probe's tile row, and save the probe cell's tile-map address for the #R$C874(tile test) to index.
  $C829 Point at this heading's entry in the #R$CB8C(steer table).
  $C830 Clear the blocked-probe accumulator.
  $C834 Read the entry's first cell offset. A heading with no first cell to probe skips the test below.
  $C83F Test that cell, and store 1 into the accumulator if it is solid.
@ $C845 label=avoid_probe_second
  $C845 Read the entry's second cell offset. A heading with no second cell to probe skips the test below.
  $C84B Test that cell; if it is passable, leave the accumulator unchanged.
  $C851 Second cell solid: add its weight to the accumulator.
@ $C859 label=avoid_apply
  $C859 Accumulator 0 (both cells passable): keep the current heading.
  $C85E Otherwise take the new heading from the entry byte one past the accumulator. That is byte 2 if only the first cell is blocked, byte 3 if only the second, and byte 4 if both.
  $C86E,3 Store the new heading.
@ $C872 label=probe_tile_ptr
g $C872 Saved probe-tile pointer
D $C872 The tile-map cell that an object in motion probes.
@ $C874 label=object_tile_check
c $C874 Test whether a candidate tile blocks movement
D $C874 Tests whether a candidate playfield tile blocks movement.
R $C874 I:A byte offset added to the saved probe-tile pointer (#R$C872)
R $C874 O:A 1 if the tile is solid (blocks movement), 0 if passable
  $C876 Read the tile ID at offset A past the probe pointer.
  $C87E Empty space is passable.
  $C882 Lower IDs are solid walls and border.
  $C886 Tiles below the brick range are passable.
  $C88A Tiles above the brick range are passable. Brick tiles fall through as solid.
@ $C88E label=tile_solid
  $C88E Report the tile as solid.
  $C892
@ $C893 label=tile_passable
  $C893 Passable: return 0.
  $C896
@ $C897 label=object_steer
c $C897 Bias a replacement heading for the wheel
D $C897 Post-processes a candidate heading (E) chosen by #R$C7E8. For every object except the wheel it returns E unchanged. The wheel homes on the bat's edge, so the routine biases its heading toward that edge.
N $C897 The wheel only. If the candidate heading is vertical, the travel counter is cleared and the wheel steers toward the bat's edge. It steers rightward when the bat is on the right, and leftward when it is on the left. If the candidate is not vertical, a vertical heading is forced instead, opposite to the saved one. It is up when the saved one is down, and otherwise down.
R $C897 I:E candidate heading from #R$C7E8
R $C897 I:IY the object's logic record (#R$CB2C)
R $C897 O:E the heading: unchanged, or steered toward the bat's edge for the wheel
  $C897 Bias only the wheel; other types keep E.
  $C89D A vertical candidate heading? Steer toward the bat.
  $C8A5 Non-vertical candidate: force a vertical heading, opposite to the saved heading, whose down value clears E.
  $C8AE
@ $C8AF label=steer_vertical_alt
  $C8AF Otherwise take the other vertical heading.
  $C8B1
@ $C8B2 label=steer_toward_bat
  $C8B2 Clear the travel counter.
  $C8B6 Bat on the right edge?
  $C8BC Yes: head rightward, toward the bat.
  $C8BE
@ $C8BF label=steer_toward_left
  $C8BF Bat on the left edge: head leftward, toward it.
  $C8C1
@ $C8C2 label=pick_wander_heading
c $C8C2 Pick a new wander heading on a timer
D $C8C2 Drives the wander of an inhabitant or the ball gem: after a random 33–64 frames it picks a new heading.
N $C8C2 The restriction in #REGa limits the new heading. It allows any of the eight headings, only the four diagonals or only the four straight ones. It can also allow only right or left, or only up or down.
R $C8C2 I:A heading restriction: 0 for any heading, 1 for diagonal only, 2 for straight only, 3 for right or left only, 4 or more for up or down only
R $C8C2 I:IY the object's logic record (#R$CB2C)
  $C8C2 Save the heading restriction in #REGb.
  $C8C3 Wander timer not yet expired? Hold the heading.
  $C8C9 Count the timer down and return.
  $C8CC
@ $C8CD label=wander_new_heading
  $C8CD Timer expired: reload it with a random wander time.
  $C8D7 Any random heading
  $C8E3
@ $C8E4 label=wander_odd
  $C8E4 A random diagonal heading
  $C8F2
@ $C8F3 label=wander_even
  $C8F3 A random straight heading
  $C8FF
@ $C900 label=wander_horizontal
  $C900 A horizontal heading, rightward or leftward
  $C910
@ $C911 label=wander_vertical
  $C911 A vertical heading, up or down
  $C91B
@ $C91C label=head_toward_target
c $C91C Steer an object toward a target object
D $C91C Sets the heading of the object that steers, in its #R$CB2C(logic record), to one of eight headings. That heading points from its sprite position toward a target object's sprite position.
N $C91C Both objects' positions are read from their #R$8F68(sprite records). X increases rightward and Y increases downward. The heading is the direction of the vector from the steerer to the target. The headings run clockwise: 0 for up, 2 for right, 4 for down and 6 for left, with the diagonals between them. Equal X yields 0 (target level or above) or 4 (target below). Equal Y yields 2 (target right) or 6 (target left).
R $C91C I:IY logic record of the object that steers (#R$CB2C); its heading receives the result
R $C91C I:IX sprite record of the object that steers (#R$8F68), read for its position
R $C91C I:B target's pool-slot index: 0 for the bat, 1 for ball A
  $C91C Save the steerer's records and the target id across the slot lookup.
  $C921 Point #REGiy at target slot #REGb's #R$8F68(sprite record). #REGix stays on the steerer's own sprite record.
  $C92C Pick the heading from where the target lies. This three-way split compares X, and each branch compares Y.
@ $C938 label=heading_same_column
  $C938 Same column (X equal), target below: head down.
@ $C944 label=heading_straight_up
  $C944 Target level or above: heading up.
@ $C947 label=heading_target_left
  $C947 Target to the left and below: 5 (down-left).
@ $C955 label=heading_left
  $C955 Level with the target: due left.
@ $C959 label=heading_up_left
  $C959 Target above: up-left
@ $C95D label=heading_target_right
  $C95D Target to the right and below: 3 (down-right).
@ $C96B label=heading_right
  $C96B Level with the target: due right.
@ $C96F label=heading_up_right
  $C96F Target above: up-right
@ $C971 label=store_heading
  $C971,5 Store the chosen heading as the steerer's new heading.
@ $C977 label=inhabitant_offscreen
c $C977 Remove an inhabitant that has left the far playfield edge
D $C977 Deactivates the inhabitant if it has moved off the playfield edge on the bat's side. The inhabitant crosses toward the bat and exits past it. Carry comes back set so the handler stops. It comes back clear when the inhabitant lives on.
R $C977 I:IX the object's sprite record (#R$8F68), whose X is tested
R $C977 I:IY the object's logic record (#R$CB2C); its type is cleared on despawn
R $C977 I:C the object's pool-slot index
R $C977 O:F carry set when the object is despawned, clear when it is kept
  $C977 The far edge is the one on the bat's side. Read the bat side: 0 for the right, non-zero for the left.
  $C97D Bat on the right: the far edge is the right one – off-field once its #R$8F68(sprite X) reaches it.
@ $C986 label=offscreen_left_bat
  $C986 Bat on the left: the far edge is the left one – off-field once sprite X drops under it.
@ $C98D label=despawn_inhabitant
  $C98D Off the far edge: for the ball gem's pool slot also clear the ball gem frame, then empty the slot.
@ $C996 label=despawn_clear_slot
  $C996 Empty the slot – clear its type and its active flag – and return carry set.
  $C99F
@ $C9A0 label=offscreen_keep
  $C9A0 Still on the field: return carry clear and keep the object.
  $C9A1
@ $C9A2 label=test_step_collision
c $C9A2 Test the level tiles in the path of an object in motion for a collision
D $C9A2 Reports whether the next step of an object in motion is blocked, in the #R$5B8B(step-blocked flag) and the #R$5B8C(wall flag). It registers a #R$A99B(brick hit) on any brick in the path.
N $C9A2 Three phases. First build the cell pointer. The object's position is nudged a couple of pixels back toward where it came from, so the sample lands on its rear edge. It is then converted to the tile-map cell it falls in.
N $C9A2 The routine saves the pointer as the #R$C872(probe-tile pointer), the base the sampler offsets from. The nudge only rounds the sample onto a cell next to it. The per-heading offsets carry the real heading. On an axis the object does not travel along, the nudge is only a shift that rounds.
N $C9A2 Second, clear both result flags. Third, index the per-heading #R$CBCC(step-collision offset table) for up to two cell offsets. The #R$CA08(cell classifier) classifies the cell at each offset that is not skipped. So each call tests one or two cells picked for the object's heading.
R $C9A2 I:IY the object's logic record (#R$CB2C), read for its heading and its type
R $C9A2 I:IX the object's sprite record (#R$8F68), with its X and Y pixel position
  $C9A2 Nudge the sample X right of the sprite for the headings from down round to up-left. The rest jump to the subtract below.
@ $C9B0 label=step_collision_x_sub
  $C9B0 The other headings nudge it left instead.
@ $C9B5 label=step_collision_col
  $C9B5 Divide the sample X by 8 to a column (0–31), kept in #REGd.
  $C9BB Up, up-right and right take the downward nudge below.
  $C9C2 The headings from down-right round to left take the upward nudge. Up-left falls through to the downward one.
@ $C9C6 label=step_collision_y_add
  $C9C6 Nudge the sample Y down.
@ $C9CD label=step_collision_y_sub
  $C9CD Nudge the sample Y up.
@ $C9D2 label=step_collision_cell
  $C9D2 Find the sample's tile-map cell from its row and column, and save it as the probe-tile pointer.
  $C9E3 Clear both result flags before the sample.
  $C9EA Look up this heading's two cell offsets, two bytes per heading.
  $C9F5 First offset: skip it when the heading has no first cell to probe, else classify that cell.
@ $C9FD label=step_collision_cell2
  $C9FD Second offset: skip it when the heading has no second cell to probe, else classify that cell too.
  $CA05
@ $CA06 label=sample_tile_ptr
W $CA06,2 Scratch slot for the tile-map pointer of the cell that the #R$CA08(cell classifier) examines
@ $CA08 label=sample_step_tile
c $CA08 Classify one tile-map cell and update the step-collision flags
D $CA08 Reads the cell at the #R$C872(probe-tile pointer) plus the given offset and updates the flags for the #R$C9A2(step collision test). A passable cell leaves the flags untouched. A wall or border sets both the #R$5B8B(step-blocked flag) and the #R$5B8C(wall flag). A brick sets the step-blocked flag and records the #R$5B8A(brick hit-type). It then registers the hit through the #R$A99B(brick-hit routine).
R $CA08 I:A cell offset added to #R$C872 to reach the cell to test (0–255)
R $CA08 I:IY the object's logic record
  $CA08 Offset the probe pointer, save the result as the sampled-tile pointer, and read the tile there.
@ $CA10 nowarn
  $CA15 Empty space: passable, nothing to flag.
  $CA18 Below the passable tiles: a wall or border tile
  $CA1C A wall or border: set both result flags.
  $CA24
@ $CA25 label=sample_tile_brick
  $CA25 Not a brick: passable, nothing to flag
  $CA2B A brick: mark it blocked and record the hit type.
  $CA33 The #R$D2C6(starburst) gets its own hit type, which clears any brick, the golden one included. Every other inhabitant keeps the default hit type, which spares golden.
@ $CA3F label=sample_brick_hit
  $CA3F Register the hit on the struck brick, and keep all registers.
@ $CA46 nowarn
  $CA53
@ $CA54 label=move_object
c $CA54 Advance an object one step along its heading
D $CA54 Moves an object one step along its heading. It also publishes the heading code for that heading in the per-slot #R$A14F(heading-code array).
N $CA54 Two jobs per frame. First publish the heading code. The object's heading is mapped through the #R$CAE8(heading-code table) to a heading code in the ball-angle code set. The code goes in the object's cell of the #R$A14F(heading-code array). For the ball gem that cell is #R$A151(ball B's heading code). Then, unless the #R$5B8E(move-freeze flag) is set, advance the sprite one step along the heading.
N $CA54 The #R$5B80(pixel step) equals the movement speed for speeds 0 and 1, and is one less for any greater speed.
N $CA54 The heading chooses which axes move. Rightward headings move X right and leftward headings move it left. Downward headings move Y down and upward headings move it up. So the pure left and right headings move horizontally only, and the pure up and down headings vertically only. The diagonal headings move by the same step on both axes.
R $CA54 I:IY the object's logic record (#R$CB2C), read for its heading and speed
R $CA54 I:IX the object's sprite record (#R$8F68), whose position is advanced
R $CA54 I:C the object's pool-slot index, which selects its heading-code cell in #R$A14F
  $CA54 Publish the heading code: map the heading to its heading code and store it in the per-slot array at the object's index #REGc.
@ $CA5A isub=LD HL,heading_dir_table
  $CA65 Skip all movement while the move-freeze flag is set; the heading code above is still published.
  $CA6A Take the movement speed as the pixel step, less one above the two slowest speeds.
@ $CA7E label=move_object_parity
  $CA7E BUG: at the slowest movement speed, the code tries to move only on alternate frames via a parity flag. But the flag address $0002 is ROM, so the store is discarded and the RET Z never fires. The #R$5B80(pixel step) keeps its value, and the object still moves a pixel every frame.
@ $CA87 label=move_object_apply_x
  $CA87 Move along X by the heading; 5, 6 and 7 run leftward.
@ $CA96 label=move_object_x_sub
  $CA96 Those take the step off the position.
@ $CAA3 label=move_object_x_right
  $CAA3 Not that heading; the rightward group is the next three.
@ $CAAF label=move_object_x_add
  $CAAF Those put the step onto the position.
@ $CAB8 label=move_object_apply_y
  $CAB8 Move along Y by the heading; 7, 0 and 1 run upward.
@ $CAC7 label=move_object_y_sub
  $CAC7 Those take the step off the position.
  $CAD2
@ $CAD3 label=move_object_y_down
  $CAD3 The downward group is the next three.
@ $CADE label=move_object_y_add
  $CADE Those put the step onto the position.
  $CAE7
@ $CAE8 label=heading_dir_table
B $CAE8,8,1 The heading code for each of the eight headings
@ $CAF0 label=spawn_heading_table
b $CAF0 Per-type initial heading
D $CAF0 Each object type's heading at spawn, coded as in the #R$CB2C(logic record), indexed by object type.
B $CAF0,20,1
  $CAF0 Empty slot
  $CAF1 Ball gem
  $CAF2 Face monster
  $CAF3 UFO
  $CAF4 Diamond
  $CAF5 Bowling ball
  $CAF6 Hive
  $CAF7 Bee
  $CAF8 Capsule
  $CAF9 Orb
  $CAFA H-rotor
  $CAFB Unused – no handler
  $CAFC Unused – no handler
  $CAFD Wheel
  $CAFE Visor
  $CAFF Starburst
  $CB00 Hockey mask
  $CB01 Comet
  $CB02 Warp gate
  $CB03 Dart
@ $CB04 label=spawn_speed_table
b $CB04 Per-type movement speed
D $CB04 Each object type's movement speed, indexed by object type.
B $CB04,20,1
  $CB04 Empty slot
  $CB05 Ball gem
  $CB06 Face monster
  $CB07 UFO
  $CB08 Diamond
  $CB09 Bowling ball
  $CB0A Hive
  $CB0B Bee
  $CB0C Capsule
  $CB0D Orb
  $CB0E H-rotor
  $CB0F Unused – no handler
  $CB10 Unused – no handler
  $CB11 Wheel
  $CB12 Visor
  $CB13 Starburst
  $CB14 Hockey mask
  $CB15 Comet
  $CB16 Warp gate
  $CB17 Dart
@ $CB18 label=spawn_singleton_table
b $CB18 Per-type singleton flag
D $CB18 Indexed by object type: 1 marks a type allowed only one live instance.
B $CB18,20,1
  $CB18 Empty slot
  $CB19 Ball gem
  $CB1A Face monster
  $CB1B UFO
  $CB1C Diamond
  $CB1D Bowling ball
  $CB1E Hive
  $CB1F Bee
  $CB20 Capsule
  $CB21 Orb
  $CB22 H-rotor
  $CB23 Unused – no handler
  $CB24 Unused – no handler
  $CB25 Wheel
  $CB26 Visor
  $CB27 Starburst
  $CB28 Hockey mask
  $CB29 Comet
  $CB2A Warp gate
  $CB2B Dart
@ $CB2C label=obj2_record
g $CB2C Secondary object's logic record
D $CB2C The ball gem's movement state. No other secondary object uses it.
B $CB2C,1 Heading, one of eight numbered clockwise: 0 for up, through to 7 for up-left
B $CB2D,1 Movement speed
S $CB2E,5 Unused
B $CB33,1 Wander timer: frames left before a fresh heading
B $CB34,1 Object type, 0 for an empty pool slot
B $CB35,2 Two counters a handler times its own state on. The ball gem runs them as one 16-bit travel count, low byte first. The orb keeps its hunt timer in the first byte and its hold timer in the second.
B $CB37,1 Animation frame: the index into the handler's frame table
B $CB38,1 Reaction state: 0 for the run state, 1 for spawn, 2 for dying. Values 3 to 5 belong to the type's own handler.
B $CB39,1 Singleton flag: 1 for a type allowed only one live instance
B $CB3A,1 Animation timer: a frame lasts two game frames.
B $CB3B,1 Scratch. The wheel keeps its last vertical heading here.
@ $CB3C label=inhabitant_records
g $CB3C Logic records – the five inhabitants
D $CB3C One 16-byte record per inhabitant slot, in the layout of the #R$CB2C(secondary object's logic record). Their sprite records are in the #R$8F68(object pool).
S $CB3C,16 First inhabitant's record
S $CB4C,16 Second inhabitant's record
S $CB5C,16 Third inhabitant's record
S $CB6C,16 Fourth inhabitant's record
S $CB7C,16 Fifth inhabitant's record
@ $CB8C label=wall_avoid_steer
b $CB8C Per-heading test-cell offset table
D $CB8C Tile-map offsets of the cells to test ahead of an object, and the replacement headings, per heading. $FF means no test at that slot.
N $CB8C Each entry is 8 bytes: the two cell offsets, then the replacement heading for the first cell only, the second cell only, and both. The rest of the entry is unread.
B $CB8C,8,8 Up
B $CB94,8,8 Up-right
B $CB9C,8,8 Right
B $CBA4,8,8 Down-right
B $CBAC,8,8 Down
B $CBB4,8,8 Down-left
B $CBBC,8,8 Left
B $CBC4,8,8 Up-left
@ $CBCC label=step_collision_offsets
b $CBCC Step-collision probe offsets
D $CBCC Two tile-map offsets per heading, relative to the #R$C872(probe-tile pointer). They name the cells just ahead of an object. $FF means no probe. The values equal the first two bytes of each #R$CB8C(steer table) entry as the image holds them.
B $CBCC,16,2
@ $CBDC label=advance_anim
c $CBDC Advance an object's animation
D $CBDC Advances the object's animation by one frame on every other call. It does not wrap the animation frame, so the caller resets it at the animation's length.
R $CBDC I:HL base of this animation's frame table (a word per frame, each a sprite-data pointer)
R $CBDC I:IX the object's 9-byte sprite record (one slot of #R$8F68)
R $CBDC I:IY the object's 16-byte logic record (layout at #R$CB2C)
  $CBDC Act only on every other call: tick the animation timer and return until it comes round.
  $CBE5 Reset the animation timer to 0 for the next pair of calls.
  $CBE9 Index the frame table by the animation frame, two bytes per entry.
  $CBF1 Read that frame's sprite-data pointer.
  $CBF4 Store it into the sprite record's pointer so the next draw shows this frame.
  $CBFA Step to the next frame.
  $CBFD
@ $CBFE label=inhabitant_react_state
c $CBFE Spawn and death reaction state machine
D $CBFE The reaction state machine shared by every inhabitant handler. It animates an object's spawn and its death. Every other reaction state passes through to the handler.
N $CBFE The spawn reaction plays a 10-frame spawn animation. On its first played frame it sets the sprite's active flag and arms the spawn sound. At the end it leaves the inhabitant live.
N $CBFE The death reaction plays a 16-frame animation. On its first frame it arms the #R$B79B(death burst) sound. At the end it empties the slot and clears the sprite's active flag so nothing draws it. The #R$CBDC(animation step) advances a frame every other call, so each animation spans twice its frame count in game frames. That is 20 game frames for spawn and 32 for death.
N $CBFE Death means the same for every handler that sets it. Each handler calls this machine before its update. Only the warp gate first pins its position. While a reaction is in progress the machine tells the handler to skip its own code for every frame of the animation. No handler can therefore cut a death short or clear it early. It always runs to the end that empties the slot.
N $CBFE There is therefore no inhabitant that starts dying, springs back and carries on. The object is destroyed and its pool slot freed. That holds whether the death came from a #R$CCD2(ball kill) or the #R$CD16(sweep). It holds equally for an #R$A717(overlap with a named slot) or a #R$C9A2(blocked step).
N $CBFE The knock-backs objects do survive are handler-private states instead: the #R$D2C6(starburst's) ball-knock and the #R$D05B(orb's) chew and spit. Those run in the handler, which this machine passes through when no reaction is in progress.
R $CBFE I:IX the object's 9-byte sprite record (one slot of #R$8F68)
R $CBFE I:IY the object's 16-byte logic record (layout at #R$CB2C)
R $CBFE O:F carry set if a reaction ran (skip the normal update); clear to proceed
  $CBFE Read the reaction state; with none in progress the handler proceeds normally.
  $CC04 The spawn animation
  $CC08 On the first played frame only, activate the sprite and arm the spawn sound.
  $CC0F Set the sprite's active flag so it becomes visible.
  $CC13 Arm the 9-step spawn sound.
@ $CC15 isub=LD (spawn_counter),A
@ $CC18 isub=LD HL,anim_ball_b_spawn+$14
@ $CC18 label=play_spawn_anim
  $CC18 Advance the spawn animation through its 10-frame table.
  $CC1E When the animation frame reaches the end of its sequence, the spawn is complete.
  $CC25 Reset the animation frame and clear state – the inhabitant is now live.
@ $CC2C label=react_spawn_busy
  $CC2C Carry set: a reaction ran this frame, so the handler skips its normal update.
  $CC2D
@ $CC2E label=react_check_dying
  $CC2E The death animation; any other state proceeds normally.
  $CC32 On the first frame only, arm the death sound.
  $CC38 Arm the 14-step death burst.
@ $CC3A isub=LD (death_burst_counter),A
@ $CC3D isub=LD HL,anim_death_burst+$2
@ $CC3D label=play_death_anim
  $CC3D Advance the death animation from its 16-frame table.
  $CC43 The death animation is complete once the animation frame runs off the end of its sequence.
  $CC4A Empty the slot: clear its type so the #R$CC7E(inhabitant loop) skips it from now on.
  $CC4E Clear the sprite's active flag so nothing draws it.
@ $CC52 label=react_death_busy
  $CC52 Carry set: a reaction ran this frame, skip the normal update.
  $CC53
@ $CC54 label=react_idle
  $CC54 Carry clear: no reaction in progress, the handler does its normal update.
  $CC55
@ $CC56 label=handler_table
c $CC56 Update the objects' behaviors
D $CC56 The table of word pointers to the per-type behavior handlers in the #R$CCD2(inhabitant-behavior block), indexed by object type, comes first.
D $CC56 The per-frame inhabitant processor. It walks the five #R$CB3C(inhabitant records). Each non-empty slot goes to the behavior handler its type selects in the #R$CC56(handler table). On entry it also ages the #R$5B8F(move-freeze timer) and ends the freeze once the timer reaches 512 frames.
W $CC56,2 No handler
W $CC58,2 No handler, the ball gem's type
W $CC5A,2
W $CC5C,2
W $CC5E,2
W $CC60,2
W $CC62,2
W $CC64,2
W $CC66,2
W $CC68,2
W $CC6A,2
W $CC6C,2 No handler
W $CC6E,2 No handler
W $CC70,2
W $CC72,2
W $CC74,2
W $CC76,2
W $CC78,2
W $CC7A,2
W $CC7C,2
@ $CC7E label=update_inhabitants
C $CC7E
  $CC7E While the move-freeze flag is set, age its 16-bit freeze timer. Clear the flag and both timer bytes 512 frames after the freeze began.
@ $CC9D label=scan_inhabitants
  $CC9D Start at the first inhabitant slot: its index in C, its logic record in IY and its sprite record in IX.
@ $CCA7 label=inhabitant_slot_loop
  $CCA7 Read the slot's type. Skip an empty slot, or else double the type into a table offset.
@ $CCB1 isub=LD HL,handler_table
  $CCB1 Point HL at this type's entry in the handler table.
@ $CCB6 isub=LD (inhabitant_slot_loop+$18),A
  $CCB6 Copy the entry's two bytes into the operand of the CALL below – a dispatch that modifies its own code.
@ $CCBB isub=LD (inhabitant_slot_loop+$19),A
N $CCBE A handler scores only when a ball reaches the inhabitant, and it banks the points into the #R$5B6F(pending score). Most inhabitants take that through the #R$CCD2(ball kill). The orb and the dart take it through the #R$A717(plain overlap) instead. The starburst scores through the plain overlap on the touch, and through the ball kill during its knock-back slide. The #R$CD16(sweep) kills an inhabitant and scores nothing. Every handler is entered the same way: #TABLE(default) { =h Register | =h What it carries } { #REGix | The inhabitant's 9-byte sprite record in the #R$8F68(object pool) } { #REGiy | Its 16-byte logic record, laid out as the #R$CB2C(secondary object's logic record) } { #REGc | Its pool-slot index } TABLE#
  $CCBE Run this inhabitant's behavior handler.
@ $CCC1 label=inhabitant_next_slot
  $CCC1 Step to the next slot, a record and a sprite entry on, and loop through the last inhabitant slot.
  $CCD1
@ $CCD2 label=ball_kill
c $CCD2 Ball kill, the shared overlap helpers, then the per-type handlers
D $CCD2 Tests one inhabitant against the live balls and kills it on a wide overlap. This entry also opens the inhabitant-behavior block. The shared helpers come first: this one, the #R$CD16(sweep) and the #R$CD6B(wide overlap). The per-type handlers follow, from the #R$CDB1(face monster's handler) on.
D $CCD2 Most handlers run the #R$CBFE(reaction-state machine) and #R$CBDC(advance the animation). They then move or steer, #R$C977(despawn off the far edge), and call these helpers. They differ only in movement and in what an overlap does.
N $CCD2 The test is the #R$CD6B(wide overlap) between the inhabitant's sprite and a ball's. Ball A is always tested. Ball B shares the secondary object's place and is tested only while that holds a ball. The slot holds a ball when its sprite pointer is the #R$5CE0(ball sprite). Either overlap is a kill.
R $CCD2 I:C the inhabitant's own pool-slot index (#R$8F68)
R $CCD2 I:IY the inhabitant's logic record (#R$CB2C), whose animation frame and state a kill sets
R $CCD2 I:B the per-type death payload, banked into #R$5B6F on a kill
R $CCD2 O:F carry set on a kill, clear on a miss
  $CCD2 Name the inhabitant (#REGc) as the first overlap operand and ball A as the second, then run the wide overlap test.
  $CCDE Wide overlap with ball A: take the kill path.
  $CCE1 Test the secondary object only while its sprite pointer shows it holds a ball. Otherwise take the miss path.
  $CCF7 Name the secondary object as the second overlap operand and test it the same way. An overlap also kills.
@ $CD06 label=ball_kill_miss
  $CD06 No overlap: clear carry and return.
  $CD07
@ $CD08 label=ball_kill_hit
  $CD08 Kill: zero the animation frame, start the death reaction, bank #REGb into the pending score, set carry and return.
  $CD15
@ $CD16 label=overlap_sweep
c $CD16 Sweep this inhabitant against the pool objects that are not balls
D $CD16 Tests this inhabitant against the other pool objects, the bat included, and reports the first overlap. A hit is always a plain kill: the death sequence, and no score.
N $CD16 Loops over every object but the #R$8FB0(bat extension), which is never swept. It skips ball A, the secondary object while its sprite pointer shows the #R$5CE0(ball sprite), and the inhabitant itself. The sweep applies those skips itself, so an inhabitant that never runs the #R$CCD2(ball kill) still gets them. A slot counts only while it is active.
N $CD16 A hit is reported when the slot is within 12 pixels of the inhabitant on both axes. The window reaches 12 pixels one way and 11 the other on each axis, with the same one-short fold as the #R$A717(plain overlap). The gap is measured slot minus inhabitant.
R $CD16 I:IX the inhabitant's #R$8F68 record, with its screen X,Y
R $CD16 I:C the inhabitant's own pool-slot index, so it does not test itself
R $CD16 O:A 1 on a hit, 0 on none
  $CD16 Walk the objects, with the object index in A.
@ $CD17 label=overlap_sweep_loop
  $CD17 Skip ball A's slot. Skip the secondary object's slot too while its sprite pointer shows it holds a ball.
@ $CD2A label=overlap_sweep_test
  $CD2A Skip the inhabitant's own slot, then walk to the record of slot #REGa.
@ $CD37 label=overlap_sweep_advance
@ $CD3A label=overlap_sweep_object
  $CD3A Park the slot index in A'; skip the slot unless it is active.
  $CD45 Read the slot's X and Y (X into #REGa, Y into #REGd) and form the X gap to the inhabitant. A negative gap folds to one less than its magnitude.
@ $CD4F label=overlap_sweep_dx
  $CD4F X gap inside the window: form the Y gap, a positive one used as it stands.
  $CD5A A negative gap folds to one less than its magnitude.
@ $CD5B label=overlap_sweep_dy
  $CD5B Both gaps inside the window is a hit – restore the parked slot index and return 1 in A; otherwise fall through to the next slot.
  $CD62
@ $CD63 label=overlap_sweep_skip
  $CD63 This slot is inactive or too far to count. Take the slot index back.
@ $CD64 label=overlap_sweep_step
  $CD64 Advance to the next object. After the last object with no hit, return 0.
  $CD6A
@ $CD6B label=overlap_wide
c $CD6B Wide overlap test between two named objects
D $CD6B The wide overlap test between the two pool objects named by the #R$5B42(first overlap operand) and the #R$5B43(second overlap operand). It returns 1 in A when both objects are active and their sprites are within 14 pixels on both axes, and 0 otherwise.
N $CD6B The #R$CCD2(ball kill) uses it as the inhabitant-versus-ball test: the first operand names the inhabitant slot and the second a ball slot. Either object inactive is an immediate miss. The window reaches 14 pixels one way and 13 the other on each axis, with the same one-short fold as the #R$A717(plain overlap).
R $CD6B O:A 1 if the two objects overlap, 0 otherwise
  $CD6B Resolve the first overlap operand to its sprite record. Miss if it is inactive.
  $CD7A Save that object's X and Y, resolve the second overlap operand's sprite record, and miss if it is inactive.
  $CD8E Form the X gap between the two objects. A negative gap folds to one less than its magnitude.
@ $CD96 label=overlap_wide_dx
  $CD96 X gap inside the window: form the Y gap the same way.
@ $CDA2 label=overlap_wide_dy
  $CDA2 Y gap inside it too: report overlap with 1 in A and restore IX, BC.
  $CDAB
@ $CDAC label=overlap_wide_miss
  $CDAC No overlap: return 0 in A, and restore IX and BC.
  $CDB0
@ $CDB1 label=update_face_monster
c $CDB1 Face-monster behavior handler
D $CDB1 Runs the face monster each frame. It wanders on a random heading.
N $CDB1 Animation: the three face sprites ping-pong, each held 6 game frames. Movement: the #R$C8C2(wander step) re-randomizes the heading, unconstrained, when the slot's wander timer expires. The #R$C7E8(wall-avoid probe) then steers it clear, and the #R$CA54(move routine) advances it one step and publishes the heading code.
R $CDB1 I:IX the inhabitant's #R$8F68 sprite record
R $CDB1 I:IY the inhabitant's #R$CB2C logic record
R $CDB1 I:C the inhabitant's pool-slot index
  $CDB1 Run the reaction-state step first; while a spawn or death animation plays, it returns carry and the rest of the handler is skipped.
  $CDB5 Animate from the face frame table, one step every other frame. Wrap the animation frame at the table's end.
@ $CDC6 label=face_steer
  $CDC6 Leave the wander unconstrained: every heading is allowed.
  $CDC7 Wander: re-randomize the heading when the slot's wander timer runs out.
  $CDCA Steer clear of the playfield walls.
  $CDCD Advance one step along the heading and publish the heading code.
  $CDD0 Despawn once it has crossed off the far edge; carry returns and the handler stops.
  $CDD4 Ball kill: a ball overlap kills the monster for 50 points, banked into the pending score. The handler then stops.
  $CDDA The sweep hits: restart the animation and start the death sequence (no score).
  $CDE7
@ $CDE8 label=update_ufo
c $CDE8 UFO behavior handler
D $CDE8 Runs the UFO each frame. Nothing reaches it in the shipped game. No #R$8888(wave script) and no handler spawns the UFO. This handler therefore never runs. What follows is what it would do.
N $CDE8 Unlike the face monster, it neither wanders nor avoids walls. Each frame it forces a fixed horizontal heading straight toward the bat's losing edge, and glides across. It dies on a ball kill (50 points). It despawns at the far edge. A sweep hit restarts its animation and starts the #R$CBFE(death sequence).
N $CDE8 Heading select: leftward when the bat plays on the left, rightward when it plays on the right. Those headings therefore always point across the field toward the bat.
N $CDE8 Animation: two wing sprites alternate, each shown for 4 frames.
  $CDE8 Run the reaction-state step; carry skips the rest while a spawn or death animation plays.
  $CDEC Pick the heading from the bat side. The bat on the right takes the next case, and the bat on the left jumps to the leftward case.
  $CDF2 Bat on the right: head rightward, toward it.
@ $CDF6 label=ufo_head_left
  $CDF6 Bat on the left: head leftward, toward it.
@ $CDF8 label=ufo_set_heading
  $CDF8 Store the chosen heading in the UFO's logic record.
  $CDFB Animate from the UFO's frame table. Each of the two sprites holds two table entries, so each stays up for two animation steps. Wrap the animation frame at the table's end.
@ $CE0C label=ufo_move
  $CE0C Advance one step along the fixed heading and publish the heading code. There is no wander or wall-avoidance.
  $CE0F Despawn at the far edge.
  $CE13 Ball kill: a ball overlap kills it for 50 points, banked into the pending score.
  $CE19 The sweep hits: restart the animation and start the death sequence (no score).
  $CE26
@ $CE27 label=update_diamond
c $CE27 Diamond behavior handler
D $CE27 Per-frame behavior handler for the diamond. It homes toward ball A, so it chases the ball around the playfield. Its death payload is the face monster's (#R$CDB1).
N $CE27 Animation: the four diamond sprites ping-pong, each shown 4 game frames. Movement: each frame it #R$C91C(points its heading at ball A). Then it #R$C7E8(avoids walls) and #R$CA54(advances one step).
R $CE27 I:IX the inhabitant's #R$8F68(sprite record)
R $CE27 I:IY the inhabitant's #R$CB3C(logic record)
R $CE27 I:C the inhabitant's pool-slot index
  $CE27 Run the reaction-state step; carry skips the rest during a spawn or death animation.
  $CE2B Animate from the diamond frame table (4 sprites, played forward and back). Wrap the animation frame at the table's end.
@ $CE3C label=diamond_steer
  $CE3C Home: turn the heading toward ball A, so the diamond tracks the ball.
  $CE41 Steer clear of the walls.
  $CE44 Advance one step and publish the heading code.
  $CE47 Despawn at the far edge.
  $CE4B Ball kill: it dies for 50 points, banked into the pending score.
  $CE51 The sweep hits: restart the animation and start the death sequence (no score).
  $CE5E
@ $CE5F label=update_bowling_ball
c $CE5F Bowling-ball behavior handler
D $CE5F Per-frame behavior handler for the bowling ball. It charges the bat. When it reaches the bat, it freezes the bat and self-destructs. It dies on a ball kill, worth 200 points.
N $CE5F Animation: the three ball sprites roll forward, each shown 4 game frames. Movement: it #R$C91C(steers toward the bat), #R$C7E8(avoids walls) and #R$CA54(advances). Test order: the #R$CCD2(ball kill) comes first. Then the #R$A717(overlap test) checks the bat alone. On a hit the bowling ball dies and raises the bat freeze, which locks the bat for 15 frames until the #R$9988(bat mover) releases it. Otherwise the #R$CD16(sweep) takes it in a plain kill.
R $CE5F I:IX the inhabitant's #R$8F68(sprite record)
R $CE5F I:IY the inhabitant's #R$CB3C(logic record)
R $CE5F I:C the inhabitant's pool-slot index
  $CE5F Run the reaction-state step; carry skips the rest during a spawn or death animation.
  $CE63 Animate from the bowling-ball frame table (3 sprites, forward roll). Wrap the animation frame at the table's end.
@ $CE74 label=bowling_steer
  $CE74 Home: turn the heading toward the bat, so the ball charges it.
  $CE79 Steer clear of the walls.
  $CE7C Advance one step and publish the heading code.
  $CE7F Ball kill: it dies for 200 points, banked into the pending score.
@ $CE85 label=bowling_freeze_test
  $CE85 Stage the inhabitant (#REGc) and the bat as the operand pair, then test the overlap with the bat alone.
  $CE90 No bat overlap: fall through to the sweep.
@ $CE93 label=bowling_bat_freeze
  $CE93 Reached the bat: restart the animation and start the death sequence. Raise the bat freeze and zero the freeze timer, so the bat is locked out for 15 frames.
  $CEA4
@ $CEA5 label=bowling_sweep
  $CEA5 Otherwise the sweep hits: restart the animation and start the death sequence (no score).
  $CEB2
@ $CEB3 label=update_hive
c $CEB3 Hive behavior handler
D $CEB3 Runs the hive each frame. It wanders sideways, homes on the bat's row and spawns bees above itself.
R $CEB3 I:IX the hive's #R$8F68(sprite record), with its screen X,Y
R $CEB3 I:IY the hive's #R$CB3C(logic record)
R $CEB3 I:C the hive's pool-slot index, passed to the overlap and offscreen helpers
  $CEB3 Reaction-state machine first; carry means skip this frame.
  $CEB7 Play the burst while the hive spawns a bee.
N $CEBE During the spawn, play the #R$9520(burst frames) once. The #R$CBDC(animation step) moves a frame every other call, so this spans 18 game frames. At anim frame 9 it returns to idle. Until then it returns without a move, so the hive holds still while the new bee spawns.
  $CEBE Spawn-burst animation: one bitmap pointer per frame
  $CEC4,5 Hold until the burst completes.
  $CECA,8 Burst done: reset the frame counter and return to idle.
@ $CED3 label=hive_idle
N $CED3 In the idle state the hive wanders and homes on the bat's row.
  $CED3 Idle animation
  $CED9 Wrap the idle loop.
@ $CEE4 label=hive_move
N $CEE4 Pick a #R$C8C2(horizontal wander heading), right or left, then home vertically on the bat's row. The bat's row is the Y byte of its sprite record. While the hive runs right or left, its row is compared against the bat's. The comparison tilts the heading one step up or down. The horizontal run becomes a diagonal that closes on the bat's row.
  $CEE4 Constrain the wander to a horizontal heading.
  $CEE9 The bat's row is the Y byte of its sprite record.
  $CEEC Only steer while the heading is horizontal.
  $CEF3 Run to the right: tilt the heading one step up when the bat is level with or above the hive.
@ $CEFE label=hive_nudge_a
  $CEFE The bat sits below, so tilt the other way.
@ $CF03 label=hive_steer_left
  $CF03 Run to the left: tilt the heading one step up when the bat is level with or above the hive.
@ $CF12 label=hive_nudge_b
  $CF12 The bat sits below, so tilt the other way.
@ $CF15 label=hive_clamp_top
N $CF15 Keep the hive out of the top strip. When the hive moves into the top strip of the play area, force the downward heading. That steers it back down.
  $CF15 Too near the top of the screen: force the downward vertical heading.
@ $CF21 label=hive_apply_move
  $CF21 Steer away from walls.
  $CF24 Advance one step along the heading.
  $CF27 Despawn once off the far edge; carry means gone.
  $CF2B Award 100 points if a ball hits it, banked into the #R$5B6F(pending score). Carry means killed.
  $CF31 The sweep: non-zero means a hit.
  $CF37,8 On a hit, restart the animation and die.
@ $CF40 label=hive_try_spawn
N $CF40 Spawn attempt, only on idle anim frame 0, so at most once per idle cycle. First scan the inhabitant records (#R$CB3C) for a bee already alive. A second bee is not spawned while one is. It is the only duplicate check a bee gets. The bee's entry in the singleton table (#R$CB18) is clear, so the generic spawn #R$C6B8 does not refuse a bee that a wave script places.
  $CF40,4 Spawn only on idle frame 0.
  $CF45 Set up to walk the inhabitant records.
@ $CF4D label=hive_scan_bee
  $CF4D,5 A live bee already exists?
  $CF54 Step to the next logic record and continue the scan.
  $CF5B No bee found in any slot, so a spawn is allowed.
@ $CF5D label=hive_bee_exists
  $CF5D Bee already alive: do not spawn.
  $CF5F
@ $CF60 label=hive_spawn_roll
N $CF60 Roll the #R$BBE2(RNG) and proceed only when its low nibble is 0. Then find a free pool slot: walk the #R$CB3C(inhabitant records) and the parallel inhabitant entries of the #R$8F68(sprite records) for an empty type. With no free slot, give up this frame.
  $CF60 Balance the scan's stack push.
  $CF62 Roll the RNG: 1-in-16 chance to spawn this frame.
  $CF68 Set up to scan the 5 records and object slots for a free one.
@ $CF76 label=hive_find_slot
  $CF76,4 A free slot?
  $CF7C Step both records on and look again.
  $CF88 No free slot: give the saved registers back and drop the spawn.
  $CF8C
@ $CF8D label=hive_emit_bee
N $CF8D Claim the free slot as a bee and place it at the hive's column, 14 pixels above the hive. The #R$C73D(spawn initializer) sets the bee's heading and timers. The hive then flashes the spawn burst.
  $CF8D Claim the slot for a bee.
  $CF91 Recover the hive's own sprite record.
  $CF92 Put the bee in the hive's column.
  $CF97,7 The bee spawns a fixed distance above the hive's row.
  $CF9F The new object is a bee.
  $CFA1,3 Initialize the new bee.
  $CFA8,8 Switch the hive to its spawn burst.

@ $CFB1 label=update_bee
c $CFB1 Bee behavior handler
D $CFB1 Per-frame handler for the bee, which flies horizontally toward the bat's losing edge and stings on contact. A sting freezes the player's control of the bat until the player loses the last ball or the next level starts.
N $CFB1 Two bees can be live at once, because only the #R$CEB3(hive) checks whether one is already alive. A wave script can place a bee past that #R$CF40(check).
R $CFB1 I:IX the bee's #R$8F68(sprite record)
R $CFB1 I:IY the bee's #R$CB3C(logic record)
R $CFB1 I:C the bee's pool-slot index
  $CFB1 Reaction-state machine first; carry means skip this frame.
  $CFB5 Run the bee animation, and wrap at its last frame.
@ $CFC6 label=bee_home
N $CFC6 Home on the bat's losing edge. The heading is rightward when the #R$8E9E(bat is on the right) and leftward when it is on the left. Then #R$CA54(advance one step). The bee tracks whichever wall the bat occupies.
  $CFC6 Bat on the right: take the rightward heading.
@ $CFD0 label=bee_aim_alt
  $CFD0 Bat on the left: take the leftward heading instead.
@ $CFD2 label=bee_set_heading
  $CFD2 Commit the heading and advance one step toward the bat's losing edge.
  $CFD8 Despawn off the far edge; carry means gone.
  $CFDC Award 100 points if a ball hits it. Carry means killed.
  $CFE2 Name this inhabitant (its slot in #REGc) as the first overlap operand.
  $CFE6 Name the bat as the second overlap operand.
@ $CFEA label=bee_check_bat
  $CFEA,4 Reached the bat?
@ $CFF0 label=bee_sting
  $CFF0 Yes: restart the animation and die.
  $CFF8,5 Raise the sting freeze: the player loses control of the bat.
@ $CFFE label=bee_sweep
N $CFFE The sweep's window sits a pixel the other way from the #R$A717(bat test) above. A bee that arrives exactly 12 px below or right of the bat is killed against it, and no sting happens.
  $CFFE No sting: the sweep still takes it in a plain kill.
  $D003,8 Restart the animation and die.
@ $D00C label=update_capsule
c $D00C Capsule behavior handler
D $D00C Per-frame handler for the capsule, worth 50 points to a ball kill. The capsule wanders freely until its step lands on a brick.
N $D00C The handler runs the #R$CBFE(reaction state machine) first, then animates and tests for a brick strike. A hit kills it. Otherwise it wanders freely, avoids walls, moves, and runs the offscreen, ball-kill and sweep tests.
R $D00C I:IX the capsule's #R$8F68(sprite record)
R $D00C I:IY the capsule's #R$CB3C(logic record), read for its heading, animation frame and state
R $D00C I:C the capsule's pool-slot index
  $D00C Reaction-state machine first; carry means skip this frame.
  $D010 Cycle the capsule animation, and wrap at its last frame.
@ $D021 label=capsule_brick
N $D021 Test for a brick strike with the shared #R$C9A2(step collision test), which sets two flags: the #R$5B8B(blocked flag) and the #R$5B8C(wall qualifier). When the wall qualifier is 0 and the blocked flag is non-zero the capsule hit a brick, so it dies. Otherwise it moves normally.
  $D021 Test for a brick collision.
  $D024 Brick struck – the wall qualifier clear and the blocked flag set?
  $D030,8 Yes: restart the animation and die.
@ $D039 label=capsule_move
N $D039 No brick: #R$C8C2(wander in any direction), #R$C7E8(avoid walls), #R$CA54(step), and #R$C977(despawn off the far edge).
  $D039 Free wander: every heading is allowed.
  $D03A Count down the wander timer, and turn when it runs out.
  $D03D Steer away from walls.
  $D040 Advance one step.
  $D043 Despawn off the far edge; carry means gone.
  $D047 Award 50 points if a ball hits it. Carry means killed.
  $D04D The sweep: non-zero means a hit.
  $D052,8 On a hit, restart the animation and die.
@ $D05B label=update_orb
c $D05B Orb (ball-capturer) behavior handler
D $D05B Behavior handler for the orb, which captures ball A and spits it back out. On top of the shared #R$CBFE(spawn and death reactions) it runs its own hunt, chew, spit and give-up.
N $D05B A capture of the ball scores 500 points. An orb that catches nothing within 250 frames turns into a #R$D00C(capsule).
N $D05B The orb homes on ball A and captures it. In its default state it chases ball A. When it #R$A717(overlaps) ball A, it chews the ball for 110 frames, then spits it back toward the bat.
N $D05B Hunt, the default: it forces the #R$6240(hunt sprite) into the sprite record each frame, then steers. While the #R$5B0B(bat holds ball A), for a serve or a glue catch, the orb #R$C8C2(wanders on a random heading). In free flight it #R$C91C(homes on the ball).
N $D05B It #R$C7E8(avoids walls), #R$CA54(advances), and leaves play at the #R$C977(far edge). A counter in its record counts to 250 frames, and at 250 the orb gives up. It then #R$A717(tests for the catch). An overlap enters the chew. Otherwise the #R$CD16(sweep) destroys it.
N $D05B Chew: on the first frame it deactivates the ball. It clears ball A's active flag so nothing draws the ball. It runs the #R$94B2(chew animation), and loops frames 21–28.
N $D05B For its first 10 frames, timed by a counter in its record, the orb still #R$C91C(homes on the ball) and #R$CA54(moves). The ball stays where it was caught. After that, a second counter is a hold timer that ticks to 100 frames. The ball's Y is pinned to the orb's Y while it ticks. At animation frame 20 it arms the #R$B803(chew sound). When the hold timer reaches 100 it switches to the spit.
N $D05B Spit: it plays the continuation of the #R$94B2(orb animation), and at animation frame 6 it arms the #R$B883(orb-spit sound). From animation frame 8 on it points ball A's sprite at the #R$6420(spat-out ball). It also re-arms the #R$5B89(capture slide), which makes the ball active again and walks it back to the bat side.
N $D05B QUIRK: the spit code carries a death transition on animation frame 14. It sits on the branch for frames below 8, where the frame can never be 14. The orb therefore never dies here. From frame 8 onward it merely re-arms the ball every frame. The spit has no self-exit.
N $D05B The slot is reclaimed externally, via the ball-loss path. Each frame it re-arms the #R$5B89(capture slide). The slide walks the caught ball to the bat's losing edge at 5 px/frame and, on arrival, #R$9FFF(loses the ball). With ball B in play, ball B takes over as ball A and the re-armed slide carries it off too. When the last ball goes, the #R$A03E(last-ball branch) zeroes the type field of every #R$CB3C(inhabitant record). The #R$CC7E(dispatcher) therefore skips the now-empty orb slot on the next pass.
N $D05B Give up: it zeroes the anim frame, state and both counters. It then rewrites the type field. The slot becomes a #R$D00C(capsule) on the next frame.
R $D05B I:IX the orb's #R$8F68(sprite record)
R $D05B I:IY the orb's #R$CB3C(logic record)
R $D05B I:C the orb's pool-slot index
  $D05B Run the shared reaction machine; while a spawn or death animation plays it returns carry and the orb skips its own update this frame.
  $D05F Branch on the reaction state: the chew runs here; the spit, give-up and hunt below.
  $D066 On the first chew frame only, deactivate the captured ball.
  $D06C Clear ball A's active flag so nothing draws the ball.
  $D078 Partway through the chew animation, arm the 49-step #R$B803(chew sound).
@ $D07E isub=LD (chew_counter),A
  $D081 Advance the chew animation by one frame.
  $D087 Loop the chew tail: wrap the animation frame back to 21 at the tail's end, so frames 21–28 cycle.
  $D092 Early in the chew, close on the ball. Once the chew count reaches its limit, hold the ball in place.
  $D099 Hold timer: once it runs out, switch to the spit.
  $D0A3 Begin the spit and reset the animation frame.
  $D0AB Pin the ball's Y to the orb's so it tracks the orb while held.
  $D0B9
  $D0BA Under 10 frames in: step toward the ball and advance.
  $D0C5
  $D0C6 Spit the chewed ball back out.
  $D0CA Partway through the spit animation, arm the #R$B883(orb-spit sound).
@ $D0D3 isub=LD (orb_spit_timer),A
@ $D0D6 isub=LD HL,anim_orb+$3A
  $D0D6 Advance the spit animation (the continuation of the #R$94B2(orb animation)).
  $D0DC Past the first frames of the spit, release the ball.
  $D0E3 Re-arm the capture slide that walks the ball back to the bat side.
  $D0E8 Point ball A's sprite at the spat-out ball.
  $D0F9
  $D0FA QUIRK dead code: the branch above enters only while the spit animation is in its early frames. This later frame therefore never matches, and the death it would set never fires.
  $D105
  $D106 Give up the hunt.
  $D10A Reset the animation frame, state and both counters.
  $D117,4 Morph into a capsule: rewrite the type field so the #R$D00C(capsule handler) runs this slot next frame.
  $D11C Hunt timer: once it runs out with no catch, give up.
  $D126 Arm the give-up reset.
  $D12A Force the orb's hunt sprite into the sprite record each frame.
  $D133 While the bat holds ball A, for a serve or a glue catch, wander. In free flight, home on it.
  $D139 Ball on the bat: wander on a random heading.
  $D13F Free flight: steer toward the ball.
  $D144 Avoid walls, advance, and despawn off the far edge.
  $D14E Test the orb against ball A for a catch through the first and second overlap operands.
  $D15D No catch: the sweep destroys the orb.
  $D162 Die: restart the animation and enter the death reaction.
  $D16A
  $D16B Catch: zero the anim frame and both counters and enter the chew.
  $D179 Flag the capture: set the ball-captured flag and request the glue release.
  $D180 Award 500 points for the catch, banked as this frame's pending points.
  $D185
@ $D186 label=update_h_rotor
c $D186 H-rotor behavior handler
D $D186 Runs the H-rotor each frame. It animates a 12-frame loop from its sprite table and #R$CA54(moves along its spawned heading).
N $D186 Its heading is set at spawn and changes only when a #R$C7E8(wall turns it aside). The #R$C977(far edge) takes it. Destruction is its only response to a hit. Its speed, 4, comes from the #R$CB04(speed table) at spawn.
  $D186 Run the shared reaction machine; skip the update while a spawn or death animation plays.
  $D18A Advance its 12-frame animation.
  $D190 Loop the animation: wrap the frame back to 0 at the table's end.
  $D19B Travel along the spawned heading, steered only by walls, until the far edge takes it.
  $D1A5 A ball kill destroys it for 50 points.
  $D1AB The sweep kills it, and the death animation runs.
  $D1B8
@ $D1B9 label=update_wheel
c $D1B9 Wheel behavior handler
D $D1B9 Runs the wheel each frame. It animates an 8-frame loop and follows its spawned heading.
N $D1B9 It #R$C7E8(bounces off solid tiles). It remembers its last vertical heading (up or down) in its logic record. While its heading is horizontal (right or left) the travel counter in its record ticks once per pass. At the eighth count it toggles the saved vertical heading between up and down and steers that way.
N $D1B9 Every horizontal run starts from zero. The spawn clears the counter, and so does the #R$C897(wall-avoid bias) each time a blocked probe sends the wheel horizontally toward the bat. A wheel blocked before its eighth count never flips. The counter does not tick while the wheel heads vertically. The result is a vertical zig-zag whose horizontal legs last at most eight passes.
N $D1B9 It #R$CA54(advances), and the #R$C977(far edge) takes it. It runs no sweep, so only a ball kill can destroy it.
  $D1B9 Run the shared reaction machine; skip the update while a spawn or death animation plays.
  $D1BD Advance its 8-frame animation.
  $D1C3 Loop the animation, and wrap the frame at the end of its table.
  $D1CE Is the heading vertical – straight up or straight down?
  $D1D8 If so, save it as the last vertical direction.
  $D1DB Zig-zag only while the move is horizontal.
  $D1E6 Is this the frame that flips the heading?
  $D1F0 A saved downward heading flips to up.
  $D1FA Anything else flips to down.
  $D1FC Steer that way.
  $D1FF Bounce off walls, advance, and despawn off the far edge.
  $D209 A ball kill destroys it for 100 points; the result is ignored.
  $D20E
@ $D20F label=update_visor
c $D20F Visor behavior handler
D $D20F Runs the visor each frame. It has a two-phase life. While dormant it animates an 8-frame loop in place – no movement call – for 64 frames, then wakes. Once awake it #R$C91C(homes on ball A), #R$CA54(advances) and animates the same loop. In either phase it dies to a ball kill and to the sweep. The #R$C977(far edge) takes it.
  $D20F Run the shared reaction machine; skip the update while a spawn or death animation plays.
  $D213 Branch on the state: the awake hunt runs here, the dormant warm-up below.
  $D21A Awake: advance its 8-frame animation.
  $D220 Cycle the animation, and wrap the frame at the end of its table.
  $D22B Home on the ball and advance.
  $D233 Despawn off the far edge.
  $D237 A ball kill destroys it for 50 points.
  $D23D The sweep kills it, and the death animation runs.
  $D24A
  $D24B Dormant: animate the same 8-frame loop, but in place (no movement).
  $D251 Run the animation on a loop, and wrap at the end of its table.
  $D25C Warm-up timer: once it runs out, start the hunt.
  $D26A Even while dormant, a ball kill destroys it for 50 points.
  $D270 The sweep kills a dormant visor too.
  $D27D
@ $D27E label=knockback_table
c $D27E Starburst behavior handler
D $D27E Per-frame handler for the starburst. It wanders the playfield until a ball touches it. The touch scores 100, and knocks it into a slide along that ball's heading. The #R$A9ED(force-clear path) empties every brick the slide crosses, the golden brick included.
R $D27E I:IX the starburst's #R$8F68(sprite record)
R $D27E I:IY the starburst's #R$CB3C(logic record), read for its animation frame, its state and the knock-back immunity counter
R $D27E I:C the starburst's pool-slot index
B $D27E,72,1 Knock-back heading for each ball heading code, counted from the first code.
@ $D2C6 label=update_starburst
C $D2C6
  $D2C6 Reaction-state machine first; while a spawn or death animation plays it returns carry and the rest is skipped.
  $D2CA Split on state: the knock-back arm runs here, and any other state takes the normal wander. Only the wander arm reaches the sweep.
  $D2D1 Knock-back: advance and wrap the 3-frame animation.
@ $D2E2 label=starburst_knock_edge
  $D2E2 In the slide along the ball's heading, a step onto a wall raises the wall qualifier. It then resets the animation and dies, and scores nothing.
  $D2F3
@ $D2F4 label=starburst_knock_step
  $D2F4 Slide one step along the heading; despawn if it has left the field.
  $D2FB Immune for the first four slide frames. The kill below runs from the fifth.
  $D305
@ $D306 label=starburst_knock_kill
  $D306 Past the immunity window a ball kill takes it for another 100 points on top of the catch, so one starburst can pay 200.
  $D30B
@ $D30C label=starburst_wander
  $D30C Normal path: advance and wrap the 3-frame animation.
@ $D31D label=starburst_wander_move
  $D31D Wander: re-pick the heading when the move timer expires, avoid walls, step, then despawn off the far edge.
N $D32B While it wanders the starburst uses the 12-px overlap, narrower than the #R$CCD2(ball kill) that most handlers use. A ball has to come closer to catch it.
  $D32B Test ball A against the starburst through the first and second overlap operands. An overlap takes the catch.
@ $D33A label=starburst_test_ball2
  $D33A No overlap with ball A: test ball B too, but only while the secondary object shows the #R$5CE0(ball sprite). An overlap takes the catch.
@ $D35F label=starburst_sweep
  $D35F No overlap with a ball: the sweep kills it; otherwise it survives the frame.
  $D36C
@ $D36D label=starburst_catch_ball1
  $D36D Ball A catch: read ball A's heading code.
@ $D372 label=starburst_catch_ball2
  $D372 Ball B catch: read ball B's heading code.
@ $D375 label=starburst_catch_apply
  $D375 Enter the knock-back. Reset the animation, set the slide speed so each #R$CA54(step) moves it 4 px, and clear the immunity counter. Map the ball's heading code through the knock-back table, offset from the base of the heading range, to orient the heading. Stage the 100-point reward as this frame's pending points.
@ $D38A isub=LD HL,knockback_table
  $D397
@ $D398 label=hockey_mask
c $D398 Hockey-mask behavior handler
D $D398 Runs the hockey mask, which travels in a straight line that turns only at walls and bricks. While the player holds fire, the mask drops a #R$D44B(comet).
R $D398 I:IX the mask's sprite record (#R$8F68)
R $D398 I:IY the mask's logic record (#R$CB2C)
R $D398 I:C the mask's pool-slot index
  $D398 Reaction-state machine first; while a spawn or death animation plays it returns carry and skips the rest.
  $D39C Run the shared wall-avoid, step and off-edge despawn.
  $D3A6 A ball kill removes it for 200 points, banked into the #R$5B6F(pending score).
  $D3AC The sweep kills it.
  $D3BA
@ $D3BB label=comet_scan_inflight
  $D3BB No hit: scan the five inhabitant records for a comet already in flight.
@ $D3C3 label=comet_scan_loop
  $D3C3 Walk the records, one stride each. A record of the comet's type means a comet is already in flight.
@ $D3D3 label=comet_busy_frame
  $D3D3 A comet is already in flight: show the mask unarmed and do not fire.
  $D3DE
@ $D3DF label=comet_ready
N $D3DF The fire read is level-triggered. Held fire therefore drops a fresh comet as soon as the last one clears the field.
  $D3DF None in flight: show the mask armed with a comet. Return unless fire is pressed.
  $D3F0 Fire pressed: show the mask unarmed, then scan the inhabitant records and their #R$8F68(sprite records) for a free slot.
@ $D407 label=comet_free_scan
  $D407 Walk the five records, one stride of each per step, for the first free slot; none free means no comet this press.
  $D41D
@ $D41E label=comet_spawn
  $D41E Free slot found: arm it as a comet. Copy the mask's X and set its Y just below the mask. Initialize its record from the type. Clear its state so it skips the spawn animation. Give it the comet frame, and set its active flag.
  $D44A
@ $D44B label=update_comet
c $D44B Comet behavior handler
D $D44B Runs the comet, which falls straight down. It has two sources. The #R$8888(wave scripts) rain it past the #R$5B8D(spawn throttle). The #R$D398(hockey mask) drops one on the fire button. It moves straight down along the heading that the #R$C73D(spawn initializer) fixes, with no wander or wall-avoidance.
N $D44B Animation is the #R$9508(3-frame table), wrapped at frame 3. A ball kill removes it for 50 points. When its #R$C9A2(step test) finds a wall or brick, it ends in the death reaction, which frees the slot. Like the wheel it runs no sweep, so the bat and the other objects do not stop it. A wall or a brick under it does, through that same step test.
  $D44B Reaction-state machine first; while a spawn or death animation plays it returns carry and skips the rest.
  $D44F Advance and wrap the 3-frame animation.
@ $D460 label=comet_fly
  $D460 A ball kill removes it for 50 points, banked into the #R$5B6F(pending score).
  $D466 Test the step. A blocked step means it hit a wall or brick, so reset the animation and die.
  $D477
@ $D478 label=comet_step
  $D478 Otherwise step one frame along the heading.
  $D47B
@ $D47C label=update_warp_gate
c $D47C Warp-gate behavior handler
D $D47C Runs the warp gate, which sits static. Each frame its X is re-pinned to the bat's fixed edge column, read from the bat's #R$8F68(sprite record), and its Y is held at 40. Its speed is 0, so it does not move. Animation is the #R$95C8(4-frame table), wrapped at frame 4.
N $D47C A ball kill destroys it for 1000 points. An overlap with the bat raises the #R$8EA6(warp flag) and loads a random 2-to-5 #R$8EA7(warp countdown). The main loop then advances the level once per frame until the countdown clears. That carries the player forward 1 to 4 levels.
  $D47C Pin the X position to the bat's column; fix Y at a constant row.
  $D48F Reaction-state machine; while a spawn or death animation plays it returns carry and skips the rest.
  $D493 Head away from the bat's side: leftward when the bat is on the right.
@ $D49D label=warp_gate_bat_left
  $D49D Bat on the left: take the rightward heading.
@ $D49F label=warp_gate_animate
  $D49F Store the heading, then advance and wrap the 4-frame animation.
@ $D4B3 label=warp_gate_move
  $D4B3 Run the step, which leaves it in place at speed 0. A ball kill removes it for 1000 points, banked into the #R$5B6F(pending score).
@ $D4BC label=warp_gate_bat_test
  $D4BC Test overlap with the bat itself through the first and second overlap operands.
@ $D4CA label=warp_gate_advance
  $D4CA On the bat overlap, raise the warp flag and load a random 2-to-5 countdown. The main loop advances the level while it counts down.
  $D4D9
@ $D4DA label=warp_gate_sweep
  $D4DA No bat overlap: the sweep kills it.
  $D4E7
@ $D4E8 label=update_dart
c $D4E8 Dart behavior handler
D $D4E8 Per-frame handler for the dart. It wanders the playfield and dies on the sweep. When the ball destroys it the player scores 500 and the global #R$5B8E(move-freeze) is triggered. The freeze halts inhabitant movement and spawns for 512 frames, aged by the same inhabitant walk.
N $D4E8 Animation is the #R$9594(8-frame table), advanced by the #R$CBDC(animation step) and wrapped at frame 8. The wander and the per-frame tests are the shared pattern with two exceptions. Its ball test is the #R$A717(12-px overlap), narrower than the one the other inhabitants take through the #R$CCD2(ball-kill test). Its ball kill triggers the move-freeze and the 500-point award.
R $D4E8 I:IX the dart's sprite record (#R$8F68)
R $D4E8 I:IY the dart's logic record (#R$CB2C)
R $D4E8 I:C the dart's pool-slot index
  $D4E8 Reaction-state machine first; while a spawn or death animation plays it returns carry and skips the rest.
  $D4EC Advance and wrap the 8-frame animation.
@ $D4FD label=dart_wander
  $D4FD Wander: re-pick the heading when the move timer expires, avoid walls, step, then despawn off the far edge.
  $D50B Test overlap with ball A through the first and second overlap operands. An overlap jumps to the ball-kill.
@ $D51A label=dart_test_ball2
  $D51A No overlap with ball A: test ball B too, but only while its sprite pointer points at the #R$5CE0(ball sprite slot). An overlap jumps to the ball-kill.
@ $D53F label=dart_sweep
  $D53F No overlap with a ball: the sweep kills it; otherwise it survives the frame.
  $D54C
@ $D54D label=dart_ball_kill
  $D54D Ball-kill: reset the animation and enter the death reaction. Raise the global move-freeze flag and zero its expiry counter. Stage the 500-point award in the pending score.
  $D565
@ $D566 label=tune_ptr
g $D566 Active tune pointer
D $D566 Pointer to the next byte of the tune in play.
@ $D568 label=play_tune_note
c $D568 Play the next note of the active tune
D $D568 Advances the #R$D566(tune pointer) past the next byte of the active tune. Plays that byte as a square-wave note or a silent rest, or returns it when it is the terminator.
N $D568 A caller points the #R$D566(tune pointer) at a tune and calls this once per byte until the terminator comes back. A tune is a byte stream with three byte classes. $0D ends the tune, $FE is a rest, and any other value is a note.
N $D568 A note byte is a byte offset into the #R$D5A5(period/duration table), so it is always even, at twice the note index. A rest borrows the table's first entry for its length and plays it silently.
R $D568 O:A $0D at end-of-tune, otherwise a non-$0D speaker residue
  $D568 Fetch the next tune byte through the tune pointer and advance it by 1.
  $D570 The terminator: return it in #REGa for the caller's end test.
  $D573 A rest falls through to the rest path; any other value is a note.
  $D578 Rest: patch the speaker write to two NOPs to silence it, and select table entry 0 in #REGa for the rest's duration.
@ $D57B nowarn
  $D582 Note: patch the speaker write to OUT ($FE),A so the tone sounds.
@ $D585 nowarn
  $D588 Index the period/duration table by the raw byte value.
  $D58F Read the period, which sets the pitch, into #REGe and the duration in speaker half-cycles into #REGb.
  $D592 Point HL at the start of ROM so the delay loop's store hits ROM harmlessly. Start #REGa at the first speaker level, with the border bits clear for black.
N $D596 Square-wave generator. Each half-cycle flips the speaker and holds it for a delay set by the note's period. The border bits are never touched, so the border stays black for the whole note. The speaker write is patched at run time, so the disassembly from the #R$D599(speaker write) onward is mis-aligned with the run-time code. At run time the speaker write takes two bytes, followed by the time-burn store. The disassembly re-syncs with the run-time path at the delay loop below.
  $D596 Save the period so it can be reloaded each half-cycle.
  $D597 Flip the speaker bit (ULA bit 4).
B $D599,1
@ $D599 label=tone_out_patch
  $D59D Inner delay: spin #REGe times to set the half-period. A lower #REGe gives a higher pitch.
@ $D59E isub=JR NZ,tone_out_patch+$2
  $D5A0 Reload the period for the next half-cycle.
  $D5A2,2 Repeat for #REGb half-cycles, the note's duration.
@ $D5A5 label=note_table
b $D5A5 Note period/duration table
D $D5A5 The playable pitches, an equal-tempered chromatic ladder with one semitone per slot.
N $D5A5 Two bytes per slot: the period first, then the duration. A lower period gives a higher pitch, and the duration counts the speaker half-cycles the note is held for.
N $D5A5 Down the table the period falls as the duration rises, so a note lasts about one frame whatever its pitch. The 8-bit period runs out of resolution toward the top of the table. The top two slots sound about a semitone above the notes they name.
B $D5A5,96,2
  $D5A5 C4, middle C
  $D5A7 D♭4
  $D5A9 D4
  $D5AB E♭4
  $D5AD E4
  $D5AF F4
  $D5B1 G♭4
  $D5B3 G4
  $D5B5 A♭4
  $D5B7 A4
  $D5B9 B♭4
  $D5BB B4
  $D5BD C5
  $D5BF D♭5
  $D5C1 D5
  $D5C3 E♭5
  $D5C5 E5
  $D5C7 F5
  $D5C9 G♭5
  $D5CB G5
  $D5CD A♭5
  $D5CF A5
  $D5D1 B♭5
  $D5D3 B5
  $D5D5 C6
  $D5D7 D♭6
  $D5D9 D6
  $D5DB E♭6
  $D5DD E6
  $D5DF F6
  $D5E1 G♭6
  $D5E3 G6
  $D5E5 A♭6
  $D5E7 A6
  $D5E9 B♭6
  $D5EB B6
  $D5ED C7
  $D5EF D♭7
  $D5F1 D7
  $D5F3 E♭7
  $D5F5 E7
  $D5F7 F7
  $D5F9 G♭7
  $D5FB G7
  $D5FD A♭7
  $D5FF A7
  $D601 B♭7
  $D603 B7 – the top slot
@ $D605 label=game_over_tune
b $D605 Game-over tune
D $D605 The tune heard after the GAME OVER banner, 61 bytes with its terminator.
N $D605 #UDGTABLE { #AUDIO(sim=1,start=36174,stop=36195,vol=25)(game_over_tune.wav) } TABLE#
@ $D642 label=title_tune
b $D642 Title tune
D $D642 The tune heard on the title screen, in the high-score wait, and while the game-over screen waits for a restart.
N $D642 #UDGTABLE { #AUDIO(sim=1,start=36207,stop=35775,vol=25)(title_tune.wav) } TABLE#
@ $D743 label=prize_reveal_tune
b $D743 Prize-reveal tune
D $D743 The four-note tune heard when a ball reveals a prize, 5 bytes with its terminator.
N $D743 #UDGTABLE { #AUDIO(0,vol=25)(prize_reveal_tune.wav)(#INCLUDE(PrizeRevealTuneDelays)) } TABLE#
@ $D748 label=unused_d748
u $D748 Unused bytes
B $D748,5
S $D74D,179
@ $D800 label=sprite_mirror_lut
b $D800 Bit-reverse lookup table
D $D800 Entry n is n with its bits in the opposite order.
N $D800 The rows below hold the entries 8 at a time, two rows for each value of the high nibble of n.
B $D800,256,8,8
@ $D900 label=tile_glyphs
b $D900 Tile graphics
D $D900 The tile glyphs, eight bytes per glyph, indexed by tile code. The set runs from the empty tile's slot out to the #R$E000(source bank).
N $D900 The virtual base of the tile-glyph set is this label minus the room taken by the codes below the empty tile. The first real tile sits 8 bytes above this label.
S $D900,8 The slot for the empty tile, and so blank
N $D908 These are the glyphs of the indestructible border and wall frame. The composed frame is pictured under #LINK(Graphics#walls-playfield-frame)(Walls / playfield frame).
B $D908,8 #HTML(#UDG$D908,71,2,tindex=1,alpha=0(tile_21))
B $D910,8 #HTML(#UDG$D910,71,2,tindex=1,alpha=0(tile_22))
B $D918,8 #HTML(#UDG$D918,71,2,tindex=1,alpha=0(tile_23))
B $D920,8 #HTML(#UDG$D920,71,2,tindex=1,alpha=0(tile_24))
B $D928,8 #HTML(#UDG$D928,71,2,tindex=1,alpha=0(tile_25))
B $D930,8 #HTML(#UDG$D930,71,2,tindex=1,alpha=0(tile_26))
B $D938,8 #HTML(#UDG$D938,71,2,tindex=1,alpha=0(tile_27))
B $D940,8 #HTML(#UDG$D940,71,2,tindex=1,alpha=0(tile_28))
B $D948,8 #HTML(#UDG$D948,71,2,tindex=1,alpha=0(tile_29))
B $D950,8 #HTML(#UDG$D950,71,2,tindex=1,alpha=0(tile_2a))
B $D958,8 #HTML(#UDG$D958,71,2,tindex=1,alpha=0(tile_2b))
B $D960,8 #HTML(#UDG$D960,71,2,tindex=1,alpha=0(tile_2c))
B $D968,8 #HTML(#UDG$D968,71,2,tindex=1,alpha=0(tile_2d))
B $D970,8 #HTML(#UDG$D970,71,2,tindex=1,alpha=0(tile_2e))
B $D978,8 #HTML(#UDG$D978,71,2,tindex=1,alpha=0(tile_2f))
B $D980,8 #HTML(#UDG$D980,71,2,tindex=1,alpha=0(tile_30))
B $D988,8 #HTML(#UDG$D988,71,2,tindex=1,alpha=0(tile_31))
B $D990,8 #HTML(#UDG$D990,71,2,tindex=1,alpha=0(tile_32))
B $D998,8 #HTML(#UDG$D998,71,2,tindex=1,alpha=0(tile_33))
B $D9A0,8 #HTML(#UDG$D9A0,71,2,tindex=1,alpha=0(tile_34))
B $D9A8,8 #HTML(#UDG$D9A8,71,2,tindex=1,alpha=0(tile_35))
B $D9B0,8 #HTML(#UDG$D9B0,71,2,tindex=1,alpha=0(tile_36))
B $D9B8,8 #HTML(#UDG$D9B8,71,2,tindex=1,alpha=0(tile_37))
B $D9C0,8 #HTML(#UDG$D9C0,71,2,tindex=1,alpha=0(tile_38))
B $D9C8,8 #HTML(#UDG$D9C8,71,2,tindex=1,alpha=0(tile_39))
B $D9D0,8 #HTML(#UDG$D9D0,71,2,tindex=1,alpha=0(tile_3a))
B $D9D8,8 #HTML(#UDG$D9D8,71,2,tindex=1,alpha=0(tile_3b))
B $D9E0,8 #HTML(#UDG$D9E0,71,2,tindex=1,alpha=0(tile_3c))
B $D9E8,8 #HTML(#UDG$D9E8,71,2,tindex=1,alpha=0(tile_3d))
B $D9F0,8 #HTML(#UDG$D9F0,71,2,tindex=1,alpha=0(tile_3e))
B $D9F8,8 #HTML(#UDG$D9F8,71,2,tindex=1,alpha=0(tile_3f))
B $DA00,8 #HTML(#UDG$DA00,71,2,tindex=1,alpha=0(tile_40))
B $DA08,8 #HTML(#UDG$DA08,71,2,tindex=1,alpha=0(tile_41))
B $DA10,8 #HTML(#UDG$DA10,71,2,tindex=1,alpha=0(tile_42))
B $DA18,8 #HTML(#UDG$DA18,71,2,tindex=1,alpha=0(tile_43))
B $DA20,8 #HTML(#UDG$DA20,71,2,tindex=1,alpha=0(tile_44))
S $DA28,96 Blank slots between the frame glyphs and the shatter glyphs
N $DA88 The eight frames of the #R$AB84(plain shatter). Each frame fills all four quarters of the cell with one glyph.
B $DA88,8 #HTML(#UDG$DA88,71,2,tindex=1,alpha=0(tile_51))
B $DA90,8 #HTML(#UDG$DA90,71,2,tindex=1,alpha=0(tile_52))
B $DA98,8 #HTML(#UDG$DA98,71,2,tindex=1,alpha=0(tile_53))
B $DAA0,8 #HTML(#UDG$DAA0,71,2,tindex=1,alpha=0(tile_54))
B $DAA8,8 #HTML(#UDG$DAA8,71,2,tindex=1,alpha=0(tile_55))
B $DAB0,8 #HTML(#UDG$DAB0,71,2,tindex=1,alpha=0(tile_56))
B $DAB8,8 #HTML(#UDG$DAB8,71,2,tindex=1,alpha=0(tile_57))
B $DAC0,8 #HTML(#UDG$DAC0,71,2,tindex=1,alpha=0(tile_58))
N $DAC8 These are the brick-design glyphs, which a brick takes in 2×2 groups. The composed bricks are pictured under #LINK(Graphics#bricks)(Bricks).
B $DAC8,8 #HTML(#UDG$DAC8,71,2,tindex=1,alpha=0(tile_59))
B $DAD0,8 #HTML(#UDG$DAD0,71,2,tindex=1,alpha=0(tile_5a))
B $DAD8,8 #HTML(#UDG$DAD8,71,2,tindex=1,alpha=0(tile_5b))
B $DAE0,8 #HTML(#UDG$DAE0,71,2,tindex=1,alpha=0(tile_5c))
B $DAE8,8 #HTML(#UDG$DAE8,71,2,tindex=1,alpha=0(tile_5d))
B $DAF0,8 #HTML(#UDG$DAF0,71,2,tindex=1,alpha=0(tile_5e))
B $DAF8,8 #HTML(#UDG$DAF8,71,2,tindex=1,alpha=0(tile_5f))
B $DB00,8 #HTML(#UDG$DB00,71,2,tindex=1,alpha=0(tile_60))
B $DB08,8 #HTML(#UDG$DB08,71,2,tindex=1,alpha=0(tile_61))
B $DB10,8 #HTML(#UDG$DB10,71,2,tindex=1,alpha=0(tile_62))
B $DB18,8 #HTML(#UDG$DB18,71,2,tindex=1,alpha=0(tile_63))
B $DB20,8 #HTML(#UDG$DB20,71,2,tindex=1,alpha=0(tile_64))
B $DB28,8 #HTML(#UDG$DB28,71,2,tindex=1,alpha=0(tile_65))
B $DB30,8 #HTML(#UDG$DB30,71,2,tindex=1,alpha=0(tile_66))
B $DB38,8 #HTML(#UDG$DB38,71,2,tindex=1,alpha=0(tile_67))
B $DB40,8 #HTML(#UDG$DB40,71,2,tindex=1,alpha=0(tile_68))
B $DB48,8 #HTML(#UDG$DB48,71,2,tindex=1,alpha=0(tile_69))
B $DB50,8 #HTML(#UDG$DB50,71,2,tindex=1,alpha=0(tile_6a))
B $DB58,8 #HTML(#UDG$DB58,71,2,tindex=1,alpha=0(tile_6b))
N $DB60 A revealed prize glyph is a 2×2 tile block. Some glyphs share a bottom-row tile with another prize's glyph. Prize effects are listed at the #R$B0DF(prize handler).
N $DB60 Safety net prize glyph: letter S. #UDGTABLE { #UDGARRAY2,7,3,tindex=1,alpha=0($DB60,$46;$DB68,$44;$DB70,$46;$DB78,$44)(tile_prize_safety_net) } TABLE#
B $DB60,32,8 Safety net prize glyph
N $DB80 Glyphs of the golden brick's #R$AC31(gleam), a sequence that nothing plays. The composed animations are pictured under #LINK(Graphics#bricks)(Bricks).
B $DB80,72,8 Break-sequence glyphs
N $DBC8 Glue prize glyph: letter G. Its bottom-right tile is safety net's, and the block's last tile is unused. #UDGTABLE { #UDGARRAY2,7,3,tindex=1,alpha=0($DBC8,$46;$DBD0,$44;$DBD8,$46;$DB78,$44)(tile_prize_glue) } TABLE#
B $DBC8,32,8 Glue prize glyph
N $DBE8 Bomb prize glyph: letter B. Its bottom-left tile is glue's, and the block's third tile is unused. #UDGTABLE { #UDGARRAY2,7,3,tindex=1,alpha=0($DBE8,$46;$DBF0,$44;$DBD8,$46;$DC00,$44)(tile_prize_bomb) } TABLE#
B $DBE8,32,8 Bomb prize glyph
N $DC08 Missile prize glyph: letter M, on tiles of its own. #UDGTABLE { #UDGARRAY2,7,3,tindex=1,alpha=0($DC08,$46;$DC10,$44;$DC18,$46;$DC20,$44)(tile_prize_missile) } TABLE#
B $DC08,32,8 Missile prize glyph
N $DC28 Expand prize glyph: letter E. Its bottom-left tile is glue's, and the block's third tile is unused. #UDGTABLE { #UDGARRAY2,7,3,tindex=1,alpha=0($DC28,$46;$DC30,$44;$DBD8,$46;$DC40,$44)(tile_prize_expand) } TABLE#
B $DC28,32,8 Expand prize glyph
N $DC48 Double bat prize glyph: letter D. Its bottom row is glue's and bomb's, and the block's last two tiles are unused. #UDGTABLE { #UDGARRAY2,7,3,tindex=1,alpha=0($DC48,$46;$DC50,$44;$DBD8,$46;$DC00,$44)(tile_prize_doublebat) } TABLE#
B $DC48,32,8 Double bat prize glyph
N $DC68 Double score prize glyph: a small multiply sign over a 2, on tiles of its own. #UDGTABLE { #UDGARRAY2,7,3,tindex=1,alpha=0($DC68,$46;$DC70,$44;$DC78,$46;$DC80,$44)(tile_prize_double_score) } TABLE#
B $DC68,32,8 Double score prize glyph
N $DC88 Extra life prize glyph: letter X, on tiles of its own. #UDGTABLE { #UDGARRAY2,7,3,tindex=1,alpha=0($DC88,$46;$DC90,$44;$DC98,$46;$DCA0,$44)(tile_prize_extra_life) } TABLE#
B $DC88,32,8 Extra life prize glyph
N $DCA8 Slow ball prize glyph frames, animated by #R$AEAC. #UDGTABLE { #UDGARRAY2,7,3,tindex=1,alpha=0($DCA8,$46;$DCB0,$44;$DCB8,$46;$DCC0,$44)(tile_prize_slowball_0) | #UDGARRAY2,7,3,tindex=1,alpha=0($DCC8,$46;$DCD0,$44;$DCD8,$46;$DCE0,$44)(tile_prize_slowball_1) | #UDGARRAY2,7,3,tindex=1,alpha=0($DCE8,$46;$DCF0,$44;$DCF8,$46;$DD00,$44)(tile_prize_slowball_2) | #UDGARRAY2,7,3,tindex=1,alpha=0($DD08,$46;$DD10,$44;$DD18,$46;$DD20,$44)(tile_prize_slowball_3) } TABLE#
B $DCA8,128 Slow ball prize glyph frames
N $DD28 These are more brick-design glyphs. The composed bricks are pictured under #LINK(Graphics#bricks)(Bricks).
B $DD28,8 #HTML(#UDG$DD28,71,2,tindex=1,alpha=0(tile_a5))
B $DD30,8 #HTML(#UDG$DD30,71,2,tindex=1,alpha=0(tile_a6))
B $DD38,8 #HTML(#UDG$DD38,71,2,tindex=1,alpha=0(tile_a7))
B $DD40,8 #HTML(#UDG$DD40,71,2,tindex=1,alpha=0(tile_a8))
B $DD48,8 #HTML(#UDG$DD48,71,2,tindex=1,alpha=0(tile_a9))
B $DD50,8 #HTML(#UDG$DD50,71,2,tindex=1,alpha=0(tile_aa))
B $DD58,8 #HTML(#UDG$DD58,71,2,tindex=1,alpha=0(tile_ab))
B $DD60,8 #HTML(#UDG$DD60,71,2,tindex=1,alpha=0(tile_ac))
B $DD68,8 #HTML(#UDG$DD68,71,2,tindex=1,alpha=0(tile_ad))
B $DD70,8 #HTML(#UDG$DD70,71,2,tindex=1,alpha=0(tile_ae))
B $DD78,8 #HTML(#UDG$DD78,71,2,tindex=1,alpha=0(tile_af))
B $DD80,8 #HTML(#UDG$DD80,71,2,tindex=1,alpha=0(tile_b0))
B $DD88,8 #HTML(#UDG$DD88,71,2,tindex=1,alpha=0(tile_b1))
B $DD90,8 #HTML(#UDG$DD90,71,2,tindex=1,alpha=0(tile_b2))
B $DD98,8 #HTML(#UDG$DD98,71,2,tindex=1,alpha=0(tile_b3))
B $DDA0,8 #HTML(#UDG$DDA0,71,2,tindex=1,alpha=0(tile_b4))
B $DDA8,8 #HTML(#UDG$DDA8,71,2,tindex=1,alpha=0(tile_b5))
B $DDB0,8 #HTML(#UDG$DDB0,71,2,tindex=1,alpha=0(tile_b6))
B $DDB8,8 #HTML(#UDG$DDB8,71,2,tindex=1,alpha=0(tile_b7))
B $DDC0,8 #HTML(#UDG$DDC0,71,2,tindex=1,alpha=0(tile_b8))
B $DDC8,8 #HTML(#UDG$DDC8,71,2,tindex=1,alpha=0(tile_b9))
B $DDD0,8 #HTML(#UDG$DDD0,71,2,tindex=1,alpha=0(tile_ba))
B $DDD8,8 #HTML(#UDG$DDD8,71,2,tindex=1,alpha=0(tile_bb))
B $DDE0,8 #HTML(#UDG$DDE0,71,2,tindex=1,alpha=0(tile_bc))
B $DDE8,8 #HTML(#UDG$DDE8,71,2,tindex=1,alpha=0(tile_bd))
B $DDF0,8 #HTML(#UDG$DDF0,71,2,tindex=1,alpha=0(tile_be))
B $DDF8,8 #HTML(#UDG$DDF8,71,2,tindex=1,alpha=0(tile_bf))
B $DE00,8 #HTML(#UDG$DE00,71,2,tindex=1,alpha=0(tile_c0))
B $DE08,8 #HTML(#UDG$DE08,71,2,tindex=1,alpha=0(tile_c1))
B $DE10,8 #HTML(#UDG$DE10,71,2,tindex=1,alpha=0(tile_c2))
B $DE18,8 #HTML(#UDG$DE18,71,2,tindex=1,alpha=0(tile_c3))
B $DE20,8 #HTML(#UDG$DE20,71,2,tindex=1,alpha=0(tile_c4))
B $DE28,8 #HTML(#UDG$DE28,71,2,tindex=1,alpha=0(tile_c5))
B $DE30,8 #HTML(#UDG$DE30,71,2,tindex=1,alpha=0(tile_c6))
B $DE38,8 #HTML(#UDG$DE38,71,2,tindex=1,alpha=0(tile_c7))
B $DE40,8 #HTML(#UDG$DE40,71,2,tindex=1,alpha=0(tile_c8))
B $DE48,8 #HTML(#UDG$DE48,71,2,tindex=1,alpha=0(tile_c9))
B $DE50,8 #HTML(#UDG$DE50,71,2,tindex=1,alpha=0(tile_ca))
B $DE58,8 #HTML(#UDG$DE58,71,2,tindex=1,alpha=0(tile_cb))
B $DE60,8 #HTML(#UDG$DE60,71,2,tindex=1,alpha=0(tile_cc))
B $DE68,8 #HTML(#UDG$DE68,71,2,tindex=1,alpha=0(tile_cd))
B $DE70,8 #HTML(#UDG$DE70,71,2,tindex=1,alpha=0(tile_ce))
B $DE78,8 #HTML(#UDG$DE78,71,2,tindex=1,alpha=0(tile_cf))
B $DE80,8 #HTML(#UDG$DE80,71,2,tindex=1,alpha=0(tile_d0))
B $DE88,8 #HTML(#UDG$DE88,71,2,tindex=1,alpha=0(tile_d1))
B $DE90,8 #HTML(#UDG$DE90,71,2,tindex=1,alpha=0(tile_d2))
B $DE98,8 #HTML(#UDG$DE98,71,2,tindex=1,alpha=0(tile_d3))
B $DEA0,8 #HTML(#UDG$DEA0,71,2,tindex=1,alpha=0(tile_d4))
B $DEA8,8 #HTML(#UDG$DEA8,71,2,tindex=1,alpha=0(tile_d5))
B $DEB0,8 #HTML(#UDG$DEB0,71,2,tindex=1,alpha=0(tile_d6))
B $DEB8,8 #HTML(#UDG$DEB8,71,2,tindex=1,alpha=0(tile_d7))
B $DEC0,8 #HTML(#UDG$DEC0,71,2,tindex=1,alpha=0(tile_d8))
B $DEC8,8 #HTML(#UDG$DEC8,71,2,tindex=1,alpha=0(tile_d9))
B $DED0,8 #HTML(#UDG$DED0,71,2,tindex=1,alpha=0(tile_da))
B $DED8,8 #HTML(#UDG$DED8,71,2,tindex=1,alpha=0(tile_db))
B $DEE0,8 #HTML(#UDG$DEE0,71,2,tindex=1,alpha=0(tile_dc))
B $DEE8,8 #HTML(#UDG$DEE8,71,2,tindex=1,alpha=0(tile_dd))
B $DEF0,8 #HTML(#UDG$DEF0,71,2,tindex=1,alpha=0(tile_de))
B $DEF8,8 #HTML(#UDG$DEF8,71,2,tindex=1,alpha=0(tile_df))
B $DF00,8 #HTML(#UDG$DF00,71,2,tindex=1,alpha=0(tile_e0))
B $DF08,8 #HTML(#UDG$DF08,71,2,tindex=1,alpha=0(tile_e1))
B $DF10,8 #HTML(#UDG$DF10,71,2,tindex=1,alpha=0(tile_e2))
B $DF18,8 #HTML(#UDG$DF18,71,2,tindex=1,alpha=0(tile_e3))
S $DF20,224 Blank slots above the last tile code, up to the #R$E000(source bank)
@ $E000 org
@ $E000 label=spr_visor_1
b $E000 Visor sprite source, 3 frames
D $E000 The source bank: the boot-time source of the #R$5C00(sprite bank), one object's bitmaps per entry, in bank order. Every pixel row is two bytes: the even byte is the row's right 8-pixel column, the odd byte its left. Every bitmap is neutral, at attribute 7.
B $E000,96
N $E000 This page doubles as the back buffer.
N $E000 A sprite is four 8×8 tiles. Each render below therefore walks a column in steps of 2.
N $E000 Visor frames, animated by #R$953C(the visor animation).
N $E000 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E001,,2;$E000,,2;$E011,,2;$E010,,2)(spr_visor_1) } TABLE#
@ $E020 label=spr_visor_2
N $E020 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E021,,2;$E020,,2;$E031,,2;$E030,,2)(spr_visor_2) } TABLE#
@ $E040 label=spr_visor_3
N $E040 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E041,,2;$E040,,2;$E051,,2;$E050,,2)(spr_visor_3) } TABLE#
@ $E060 label=spr_capsule_1
b $E060 Capsule sprite source, 4 frames
D $E060 Capsule frames, animated by #R$9584(the capsule animation).
N $E060 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E061,,2;$E060,,2;$E071,,2;$E070,,2)(spr_capsule_1) } TABLE#
B $E060,128
@ $E080 label=spr_capsule_2
N $E080 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E081,,2;$E080,,2;$E091,,2;$E090,,2)(spr_capsule_2) } TABLE#
@ $E0A0 label=spr_capsule_3
N $E0A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E0A1,,2;$E0A0,,2;$E0B1,,2;$E0B0,,2)(spr_capsule_3) } TABLE#
@ $E0C0 label=spr_capsule_4
N $E0C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E0C1,,2;$E0C0,,2;$E0D1,,2;$E0D0,,2)(spr_capsule_4) } TABLE#
@ $E0E0 label=spr_ball
b $E0E0 Ball sprite source
D $E0E0 Ball.
N $E0E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E0E1,,2;$E0E0,,2;$E0F1,,2;$E0F0,,2)(spr_ball) } TABLE#
B $E0E0,32
@ $E100 label=spr_bat_normal
b $E100 Bat sprite source, 4 bitmaps
D $E100 Normal bat.
N $E100 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E101,,2;$E100,,2;$E111,,2;$E110,,2)(spr_bat_normal) } TABLE#
B $E100,128
@ $E120 label=spr_bat_exp_top
N $E120 Expanded bat, top half then bottom half.
N $E120 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E121,,2;$E120,,2;$E131,,2;$E130,,2;$E141,,2;$E140,,2;$E151,,2;$E150,,2)(spr_bat_exp) } TABLE#
@ $E140 label=spr_bat_exp_bottom
@ $E160 label=spr_bat_missile
N $E160 Missile bat.
N $E160 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E161,,2;$E160,,2;$E171,,2;$E170,,2)(spr_bat_missile) } TABLE#
@ $E180 label=spr_missile_shot_l
b $E180 Missile shot sprite source and its mirror
D $E180 Missile shot, with the bat on the right.
N $E180 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E181,,2;$E180,,2;$E191,,2;$E190,,2)(spr_missile_shot_l) } TABLE#
B $E180,64
@ $E1A0 label=spr_missile_shot_r
N $E1A0 Missile shot, mirrored.
N $E1A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E1A1,,2;$E1A0,,2;$E1B1,,2;$E1B0,,2)(spr_missile_shot_r) } TABLE#
@ $E1C0 label=spr_death_burst_1
b $E1C0 Death burst sprite source, 8 frames
D $E1C0 Death-burst frames for a dying object, animated by #R$943E(the death-burst animation).
N $E1C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E1C1,,2;$E1C0,,2;$E1D1,,2;$E1D0,,2)(spr_death_burst_1) } TABLE#
B $E1C0,256
@ $E1E0 label=spr_death_burst_2
N $E1E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E1E1,,2;$E1E0,,2;$E1F1,,2;$E1F0,,2)(spr_death_burst_2) } TABLE#
@ $E200 label=spr_death_burst_3
N $E200 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E201,,2;$E200,,2;$E211,,2;$E210,,2)(spr_death_burst_3) } TABLE#
@ $E220 label=spr_death_burst_4
N $E220 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E221,,2;$E220,,2;$E231,,2;$E230,,2)(spr_death_burst_4) } TABLE#
@ $E240 label=spr_death_burst_5
N $E240 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E241,,2;$E240,,2;$E251,,2;$E250,,2)(spr_death_burst_5) } TABLE#
@ $E260 label=spr_death_burst_6
N $E260 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E261,,2;$E260,,2;$E271,,2;$E270,,2)(spr_death_burst_6) } TABLE#
@ $E280 label=spr_death_burst_7
N $E280 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E281,,2;$E280,,2;$E291,,2;$E290,,2)(spr_death_burst_7) } TABLE#
@ $E2A0 label=spr_death_burst_8
N $E2A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E2A1,,2;$E2A0,,2;$E2B1,,2;$E2B0,,2)(spr_death_burst_8) } TABLE#
@ $E2C0 label=spr_spawn_flash_1
b $E2C0 Spawn flash sprite source, 4 frames
D $E2C0 Spawn-flash frames for an object as it spawns.
N $E2C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E2C1,,2;$E2C0,,2;$E2D1,,2;$E2D0,,2)(spr_spawn_flash_1) } TABLE#
B $E2C0,128
@ $E2E0 label=spr_spawn_flash_2
N $E2E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E2E1,,2;$E2E0,,2;$E2F1,,2;$E2F0,,2)(spr_spawn_flash_2) } TABLE#
@ $E300 label=spr_spawn_flash_3
N $E300 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E301,,2;$E300,,2;$E311,,2;$E310,,2)(spr_spawn_flash_3) } TABLE#
@ $E320 label=spr_spawn_flash_4
N $E320 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E321,,2;$E320,,2;$E331,,2;$E330,,2)(spr_spawn_flash_4) } TABLE#
@ $E340 label=spr_ball_gem_1
b $E340 Ball gem sprite source, 4 frames
D $E340 Ball-gem frames in flight, animated by #R$9460(the ball-gem animation).
N $E340 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E341,,2;$E340,,2;$E351,,2;$E350,,2)(spr_ball_gem_1) } TABLE#
B $E340,128
@ $E360 label=spr_ball_gem_2
N $E360 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E361,,2;$E360,,2;$E371,,2;$E370,,2)(spr_ball_gem_2) } TABLE#
@ $E380 label=spr_ball_gem_3
N $E380 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E381,,2;$E380,,2;$E391,,2;$E390,,2)(spr_ball_gem_3) } TABLE#
@ $E3A0 label=spr_ball_gem_4
N $E3A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E3A1,,2;$E3A0,,2;$E3B1,,2;$E3B0,,2)(spr_ball_gem_4) } TABLE#
@ $E3C0 label=spr_hockey_mask_armed
b $E3C0 Hockey mask sprite source, armed and unarmed
D $E3C0 Hockey mask armed with a comet.
N $E3C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E3C1,,2;$E3C0,,2;$E3D1,,2;$E3D0,,2)(spr_hockey_mask_armed) } TABLE#
B $E3C0,64
@ $E3E0 label=spr_hockey_mask_unarmed
N $E3E0 Hockey mask, unarmed.
N $E3E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E3E1,,2;$E3E0,,2;$E3F1,,2;$E3F0,,2)(spr_hockey_mask_unarmed) } TABLE#
@ $E400 label=spr_comet_1
b $E400 Comet sprite source, 3 frames
D $E400 Comet frames, animated by #R$9508(the comet animation).
N $E400 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E401,,2;$E400,,2;$E411,,2;$E410,,2)(spr_comet_1) } TABLE#
B $E400,96
@ $E420 label=spr_comet_2
N $E420 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E421,,2;$E420,,2;$E431,,2;$E430,,2)(spr_comet_2) } TABLE#
@ $E440 label=spr_comet_3
N $E440 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E441,,2;$E440,,2;$E451,,2;$E450,,2)(spr_comet_3) } TABLE#
@ $E460 label=spr_hive_1
b $E460 Hive sprite source, 6 frames
D $E460 Hive idle frames, animated by #R$950E(the hive idle animation).
N $E460 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E461,,2;$E460,,2;$E471,,2;$E470,,2)(spr_hive_1) } TABLE#
B $E460,192
@ $E480 label=spr_hive_2
N $E480 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E481,,2;$E480,,2;$E491,,2;$E490,,2)(spr_hive_2) } TABLE#
@ $E4A0 label=spr_hive_3
N $E4A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E4A1,,2;$E4A0,,2;$E4B1,,2;$E4B0,,2)(spr_hive_3) } TABLE#
@ $E4C0 label=spr_hive_spawn_burst_1
N $E4C0 Hive spawn-burst frames, animated by #R$9520(the hive spawn-burst animation).
N $E4C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E4C1,,2;$E4C0,,2;$E4D1,,2;$E4D0,,2)(spr_hive_spawn_burst_1) } TABLE#
@ $E4E0 label=spr_hive_spawn_burst_2
N $E4E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E4E1,,2;$E4E0,,2;$E4F1,,2;$E4F0,,2)(spr_hive_spawn_burst_2) } TABLE#
@ $E500 label=spr_hive_spawn_burst_3
N $E500 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E501,,2;$E500,,2;$E511,,2;$E510,,2)(spr_hive_spawn_burst_3) } TABLE#
@ $E520 label=spr_ufo_1
b $E520 UFO sprite source, 2 frames
D $E520 UFO frames, animated by #R$957C(the UFO animation).
N $E520 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E521,,2;$E520,,2;$E531,,2;$E530,,2)(spr_ufo_1) } TABLE#
B $E520,64
@ $E540 label=spr_ufo_2
N $E540 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E541,,2;$E540,,2;$E551,,2;$E550,,2)(spr_ufo_2) } TABLE#
@ $E560 label=spr_bee_1
b $E560 Bee sprite source, 2 frames
D $E560 Bee frames, animated by #R$9532(the bee animation).
N $E560 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E561,,2;$E560,,2;$E571,,2;$E570,,2)(spr_bee_1) } TABLE#
B $E560,64
@ $E580 label=spr_bee_2
N $E580 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E581,,2;$E580,,2;$E591,,2;$E590,,2)(spr_bee_2) } TABLE#
@ $E5A0 label=spr_warp_gate_1
b $E5A0 Warp gate sprite source, 2 frames
D $E5A0 Warp-gate frames, animated by #R$95C8(the warp-gate animation).
N $E5A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E5A1,,2;$E5A0,,2;$E5B1,,2;$E5B0,,2)(spr_warp_gate_1) } TABLE#
B $E5A0,64
@ $E5C0 label=spr_warp_gate_2
N $E5C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E5C1,,2;$E5C0,,2;$E5D1,,2;$E5D0,,2)(spr_warp_gate_2) } TABLE#
@ $E5E0 label=spr_starburst_1
b $E5E0 Starburst sprite source, 3 frames
D $E5E0 Starburst frames, animated by #R$9536(the starburst animation).
N $E5E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E5E1,,2;$E5E0,,2;$E5F1,,2;$E5F0,,2)(spr_starburst_1) } TABLE#
B $E5E0,96
@ $E600 label=spr_starburst_2
N $E600 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E601,,2;$E600,,2;$E611,,2;$E610,,2)(spr_starburst_2) } TABLE#
@ $E620 label=spr_starburst_3
N $E620 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E621,,2;$E620,,2;$E631,,2;$E630,,2)(spr_starburst_3) } TABLE#
@ $E640 label=spr_orb_hunt
b $E640 Orb sprite source, 16 bitmaps
D $E640 Orb on the hunt for the ball.
N $E640 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E641,,2;$E640,,2;$E651,,2;$E650,,2)(spr_orb_hunt) } TABLE#
B $E640,512
@ $E660 label=spr_orb_chew_1
N $E660 Orb chew frames, animated by #R$94B2(the orb chew-and-spit animation).
N $E660 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E661,,2;$E660,,2;$E671,,2;$E670,,2)(spr_orb_chew_1) } TABLE#
@ $E680 label=spr_orb_chew_2
N $E680 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E681,,2;$E680,,2;$E691,,2;$E690,,2)(spr_orb_chew_2) } TABLE#
@ $E6A0 label=spr_orb_chew_3
N $E6A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E6A1,,2;$E6A0,,2;$E6B1,,2;$E6B0,,2)(spr_orb_chew_3) } TABLE#
@ $E6C0 label=spr_orb_chew_4
N $E6C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E6C1,,2;$E6C0,,2;$E6D1,,2;$E6D0,,2)(spr_orb_chew_4) } TABLE#
@ $E6E0 label=spr_orb_chew_5
N $E6E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E6E1,,2;$E6E0,,2;$E6F1,,2;$E6F0,,2)(spr_orb_chew_5) } TABLE#
@ $E700 label=spr_orb_chew_6
N $E700 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E701,,2;$E700,,2;$E711,,2;$E710,,2)(spr_orb_chew_6) } TABLE#
@ $E720 label=spr_orb_chew_7
N $E720 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E721,,2;$E720,,2;$E731,,2;$E730,,2)(spr_orb_chew_7) } TABLE#
@ $E740 label=spr_orb_chew_8
N $E740 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E741,,2;$E740,,2;$E751,,2;$E750,,2)(spr_orb_chew_8) } TABLE#
@ $E760 label=spr_orb_chew_9
N $E760 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E761,,2;$E760,,2;$E771,,2;$E770,,2)(spr_orb_chew_9) } TABLE#
@ $E780 label=spr_orb_chew_10
N $E780 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E781,,2;$E780,,2;$E791,,2;$E790,,2)(spr_orb_chew_10) } TABLE#
@ $E7A0 label=spr_orb_chew_11
N $E7A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E7A1,,2;$E7A0,,2;$E7B1,,2;$E7B0,,2)(spr_orb_chew_11) } TABLE#
@ $E7C0 label=spr_orb_chew_12
N $E7C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E7C1,,2;$E7C0,,2;$E7D1,,2;$E7D0,,2)(spr_orb_chew_12) } TABLE#
@ $E7E0 label=spr_orb_spit_1
N $E7E0 Orb spit frames.
N $E7E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E7E1,,2;$E7E0,,2;$E7F1,,2;$E7F0,,2)(spr_orb_spit_1) } TABLE#
@ $E800 label=spr_orb_spit_2
N $E800 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E801,,2;$E800,,2;$E811,,2;$E810,,2)(spr_orb_spit_2) } TABLE#
@ $E820 label=spr_orb_ball
N $E820 Ball as the orb spits it out.
N $E820 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E821,,2;$E820,,2;$E831,,2;$E830,,2)(spr_orb_ball) } TABLE#
@ $E840 label=spr_face_monster_1
b $E840 Face monster sprite source, 3 frames
D $E840 Face-monster frames, animated by #R$954C(the face-monster animation).
N $E840 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E841,,2;$E840,,2;$E851,,2;$E850,,2)(spr_face_monster_1) } TABLE#
B $E840,96
@ $E860 label=spr_face_monster_2
N $E860 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E861,,2;$E860,,2;$E871,,2;$E870,,2)(spr_face_monster_2) } TABLE#
@ $E880 label=spr_face_monster_3
N $E880 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E881,,2;$E880,,2;$E891,,2;$E890,,2)(spr_face_monster_3) } TABLE#
@ $E8A0 label=spr_bowling_ball_1
b $E8A0 Bowling ball sprite source, 3 frames
D $E8A0 Bowling-ball frames, animated by #R$95BC(the bowling-ball animation).
N $E8A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E8A1,,2;$E8A0,,2;$E8B1,,2;$E8B0,,2)(spr_bowling_ball_1) } TABLE#
B $E8A0,96
@ $E8C0 label=spr_bowling_ball_2
N $E8C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E8C1,,2;$E8C0,,2;$E8D1,,2;$E8D0,,2)(spr_bowling_ball_2) } TABLE#
@ $E8E0 label=spr_bowling_ball_3
N $E8E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E8E1,,2;$E8E0,,2;$E8F1,,2;$E8F0,,2)(spr_bowling_ball_3) } TABLE#
@ $E900 label=spr_diamond_1
b $E900 Diamond sprite source, 4 frames
D $E900 Diamond frames, animated by #R$9564(the diamond animation).
N $E900 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E901,,2;$E900,,2;$E911,,2;$E910,,2)(spr_diamond_1) } TABLE#
B $E900,128
@ $E920 label=spr_diamond_2
N $E920 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E921,,2;$E920,,2;$E931,,2;$E930,,2)(spr_diamond_2) } TABLE#
@ $E940 label=spr_diamond_3
N $E940 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E941,,2;$E940,,2;$E951,,2;$E950,,2)(spr_diamond_3) } TABLE#
@ $E960 label=spr_diamond_4
N $E960 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E961,,2;$E960,,2;$E971,,2;$E970,,2)(spr_diamond_4) } TABLE#
@ $E980 label=spr_dart_1
b $E980 Dart sprite source, 3 frames
D $E980 Dart frames, animated by #R$9594(the dart animation).
N $E980 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E981,,2;$E980,,2;$E991,,2;$E990,,2)(spr_dart_1) } TABLE#
B $E980,96
@ $E9A0 label=spr_dart_2
N $E9A0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E9A1,,2;$E9A0,,2;$E9B1,,2;$E9B0,,2)(spr_dart_2) } TABLE#
@ $E9C0 label=spr_dart_3
N $E9C0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E9C1,,2;$E9C0,,2;$E9D1,,2;$E9D0,,2)(spr_dart_3) } TABLE#
@ $E9E0 label=spr_wheel_1
b $E9E0 Wheel sprite source, 4 frames
D $E9E0 Wheel frames, animated by #R$95D0(the wheel animation).
N $E9E0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($E9E1,,2;$E9E0,,2;$E9F1,,2;$E9F0,,2)(spr_wheel_1) } TABLE#
B $E9E0,128
@ $EA00 label=spr_wheel_2
N $EA00 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($EA01,,2;$EA00,,2;$EA11,,2;$EA10,,2)(spr_wheel_2) } TABLE#
@ $EA20 label=spr_wheel_3
N $EA20 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($EA21,,2;$EA20,,2;$EA31,,2;$EA30,,2)(spr_wheel_3) } TABLE#
@ $EA40 label=spr_wheel_4
N $EA40 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($EA41,,2;$EA40,,2;$EA51,,2;$EA50,,2)(spr_wheel_4) } TABLE#
@ $EA60 label=spr_h_rotor_1
b $EA60 H-rotor sprite source, 6 frames
D $EA60 H-rotor frames, animated by #R$95A4(the H-rotor animation).
N $EA60 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($EA61,,2;$EA60,,2;$EA71,,2;$EA70,,2)(spr_h_rotor_1) } TABLE#
B $EA60,192
@ $EA80 label=spr_h_rotor_2
N $EA80 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($EA81,,2;$EA80,,2;$EA91,,2;$EA90,,2)(spr_h_rotor_2) } TABLE#
@ $EAA0 label=spr_h_rotor_3
N $EAA0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($EAA1,,2;$EAA0,,2;$EAB1,,2;$EAB0,,2)(spr_h_rotor_3) } TABLE#
@ $EAC0 label=spr_h_rotor_4
N $EAC0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($EAC1,,2;$EAC0,,2;$EAD1,,2;$EAD0,,2)(spr_h_rotor_4) } TABLE#
@ $EAE0 label=spr_h_rotor_5
N $EAE0 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($EAE1,,2;$EAE0,,2;$EAF1,,2;$EAF0,,2)(spr_h_rotor_5) } TABLE#
@ $EB00 label=spr_h_rotor_6
N $EB00 #UDGTABLE { #UDGARRAY2,7,3,2,tindex=1,alpha=0($EB01,,2;$EB00,,2;$EB11,,2;$EB10,,2)(spr_h_rotor_6) } TABLE#
@ $EB20 label=back_buffer_tail
b $EB20 Back buffer tail
D $EB20 The span of the back buffer between the sprite bitmaps and the #R$F800(tile map).
S $EB20,3296,2,30,2,30,2,30,2,30,2,30,2,30,2,30,2,30,2,30,2,30,2,30,2,30,2,30,2,30,2,94,2,62,2,62,2,30,2,94,2,14,158,18,2,30,2,30,2,62,2,62,2,30,2,30,2,30,2,30,2,30,2,62,2,62,32,64,2,30,2,30,2,30,2,30,64,64,2,30,2,62,2,30,66,30,2,30,2,30,2,30,2,30,2,30,66,30,2,30,2,30,2,30,2,30,2,30,64,64,2,62,2,62,39,4,2,6,2,4,7,64,2,30,2,30,2,30,2,30,66,30,2,30,2,62,2,62,34,28,1,1
@ $F800 org
@ $F800 label=tilemap
g $F800 Tile map
D $F800 One tile code per character cell of the screen, in the attribute file's own order. Each row holds 32 cells, top row first.
B $F800,768,8,8,8,8
@ $FB00 org
@ $FB00 label=workbuf
g $FB00 Dirty counters
D $FB00 One dirty counter per tile-map cell.
N $FB00 The counters run in the tile map's own order. The first cell of the bottom row holds the $FF scan terminator.
S $FB00,736
B $FDE0,1 Scan terminator
S $FDE1,31 Rest of the bottom row's counters
@ $FE00 label=unused_fe00
u $FE00 Unused bytes
S $FE00,156
i $FE9C
