EPOCH 	= 0			; shorten delay during logo
PLAYER	= 0			; enable auto player, this skips game parts leaving
				; only dialogs has been used for script testing
;--------------------------------------------------------------------------------
	lib	script.i
;--------------------------------------------------------------------------------
BANK00	group	$00
;--------------------------------------------------------------------------------
	org	$00A0		; let's get famous
	db	"https://github.com/gitendo/bm7j"
;----------------------
	IF PLAYER
	org	$0043
	ld	a,1
	ld	($C0E4),a
	jp	$4000

	org	$024D
	call	$0043
	
	ENDIF
;----------------------
	org	$0142
	db	'E'		; english
;----------------------
	org	$0982		; hud str relocation
	dw	h000982
;
	org	$09B6
	dw	h0009b6
;
	org	$0A1F
	dw	h000a1f
	dw	h000a21
	dw	h000a23
	dw	h000a25
	dw	h000a25
;
	org	$161D
	dw	h00161d
;
	org	$1690
	dw	h001690
;----------------------
	org	$18A8		; game intro, basara txt expansion relocation
	call	intro_expansion
;----------------------
	org	$18C2		; game intro, mylene txt expansion relocation
	ld	a,2
	call	intro_expansion
;----------------------
	org	$18E0		; game intro, ray txt expansion relocation
	call	intro_expansion
;----------------------
	org	$18FA		; game intro, veffidas txt expansion relocation
	ld	a,2
;----------------------
	org	$1950		; game intro, ray txt expansion relocation
	call	intro_expansion
;----------------------
	org	$1AB7		; sub ptr relocation
	dw	sub_41_77A9	; 	bank 41
	dw	sub_42_72C7	; 	bank 42
	dw	sub_43_79D6	; 	bank 43
	dw	sub_44_7B7A	; 	bank 44
;----------------------
	org	$1BD8
	jp	sub_50_62A6	;	bank 50
;----------------------
	org	$1BFC
	dw	sub_41_7805	;	bank 41
	dw	sub_42_7323	;	bank 42
	dw	sub_43_7A32	;	bank 43
	dw	sub_44_7C0D	;	bank 44
;----------------------
	org	$1CC1		; options, relocate performance offset
	jp	sub_5C_41CE
;----------------------
	org	$2856		; hud, bg map for messages
	lib	1x1_hud_bg_map.s
;----------------------
	org	$38A0		; writer, 2x2 to 1x2 reduction
	ld	b,$20
;----------------------
	org	$38BD		; fonts, 1x1 table offset
	dw	$40BE
;----------------------
	org	$3A00		; hud, writer core dupe for 1x1 font
	lib	1x1_core.s
;----------------------
vram_fill:			; replace empty tiles in banks 44 & 46 with code to get more space
	push	bc
	push	hl

	ld	bc,$800
	ld	hl,$9000
	call	$030C			; zero fill

	pop	hl
	pop	bc
	call	$44A			; copy
	ret
;----------------------
	lib	intro.s	; game intro, txt expansion

;--------------------------------------------------------------------------------
BANK02	group	$02
;--------------------------------------------------------------------------------
	org	$4007		; hud, allow relative jumps in hud_ functions below
	jp	z,hud_print_msg
;----------------------
	org	$4015		; hud, read string reduced to one byte, 1x1 font
	lib	1x1_mod.s
;----------------------
	org	$411E		; hud, clear screen
	ld	a,0		;	1x1 char
	ld	e,28		;	2 lines, 14 chars each
	ld	c,$20		;	clear with ' '
	call	hud_msg_chr_offset
;----------------------
	org	$4128		; hud, clear screen
	ld	b,1		;	1x1 char
;----------------------
	org	$412A		; writer, core 1x1 mod
	call	$3A00
;----------------------
	org	$412E		; hud, clear screen
	inc	a		;	next char
;----------------------
	org	$4134		; hud, icon related strs
	dw	_msg1
	dw	_msg2
	dw	_msg3
	dw	_msg4
	dw	_msg5
	dw	_msg6
	dw	_msg7
;----------------------
	org	$4142		; hud str relocation
_msg1
	dw	_008142
	dw	_008144
	dw	_008146
	dw	_008148
	dw	_00814a
	dw	_00814c
	dw	_00814e
	dw	_008150
	dw	_008152
_msg2
	dw	_008154
	dw	_008156
	dw	_008158
	dw	_00815a
	dw	_00815c
	dw	_00815e
	dw	_008160
	dw	_008162
	dw	_008164
_msg3
	dw	_008166
	dw	_008168
	dw	_00816a
	dw	_00816c
	dw	_00816e
	dw	_008170
	dw	_008172
	dw	_008174
	dw	_008176
_msg4
	dw	_008178
	dw	_00817a
	dw	_00817c
	dw	_00817e
	dw	_008180
	dw	_008182
	dw	_008184
	dw	_008186
	dw	_008188
_msg5
	dw	_00818a
	dw	_00818c
	dw	_00818e
	dw	0
	dw	_008192
	dw	_008194
	dw	_008196
	dw	_008198
	dw	_00819a
_msg6
	dw	_00819c
	dw	_00819e
	dw	_0081a0
	dw	0
	dw	_0081a4
	dw	_0081a6
	dw	_0081a8
	dw	_0081aa
	dw	_0081ac
_msg7
	dw	_0081ae
	dw	_0081b0
	dw	_0081b2
	dw	0
	dw	_0081b6
	dw	_0081b8
	dw	_0081ba
	dw	_0081bc
	dw	_0081be

_008142
	lib	script/hud/008142.txt
_008144
	lib	script/hud/008144.txt
_008146
	lib	script/hud/008146.txt
_008148
	lib	script/hud/008148.txt
_00814a
	lib	script/hud/00814a.txt
_00814c
	lib	script/hud/00814c.txt
_00814e
	lib	script/hud/00814e.txt
_008150
	lib	script/hud/008150.txt
_008152
	lib	script/hud/008152.txt
_008154
	lib	script/hud/008154.txt
_008156
	lib	script/hud/008156.txt
_008158
	lib	script/hud/008158.txt
_00815a
	lib	script/hud/00815a.txt
_00815c
	lib	script/hud/00815c.txt
_00815e
	lib	script/hud/00815e.txt
_008160
	lib	script/hud/008160.txt
_008162
	lib	script/hud/008162.txt
_008164
	lib	script/hud/008164.txt
_008166
	lib	script/hud/008166.txt
_008168
	lib	script/hud/008168.txt
_00816a
	lib	script/hud/00816a.txt
_00816c
	lib	script/hud/00816c.txt
_00816e
	lib	script/hud/00816e.txt
_008170
_008172
	lib	script/hud/008170.txt
_008174
	lib	script/hud/008174.txt
_008176
	lib	script/hud/008176.txt
_008178
_00817e
_008180
_008186
	lib	script/hud/008178.txt

_008182
_008184
	lib	script/hud/008182.txt
_00817a
	lib	script/hud/00817a.txt
_00817c
	lib	script/hud/00817c.txt
_008188
	lib	script/hud/008188.txt
_00818a
	lib	script/hud/00818a.txt
_00818c
	lib	script/hud/00818c.txt
_00818e
	lib	script/hud/00818e.txt
_008192
	lib	script/hud/008192.txt
_008194
	lib	script/hud/008194.txt
_008196
	lib	script/hud/008196.txt
_008198
	lib	script/hud/008198.txt
_00819a
	lib	script/hud/00819a.txt
_00819c
	lib	script/hud/00819c.txt
_00819e
	lib	script/hud/00819e.txt
_0081a0
	lib	script/hud/0081a0.txt
_0081a4
	lib	script/hud/0081a4.txt
_0081a6
	lib	script/hud/0081a6.txt
_0081a8
	lib	script/hud/0081a8.txt
_0081aa
	lib	script/hud/0081aa.txt
_0081ac
	lib	script/hud/0081ac.txt
_0081ae
	lib	script/hud/0081ae.txt
_0081b0
	lib	script/hud/0081b0.txt
_0081b2
	lib	script/hud/0081b2.txt
_0081b6
	lib	script/hud/0081b6.txt
_0081b8
	lib	script/hud/0081b8.txt
_0081ba
	lib	script/hud/0081ba.txt
_0081bc
	lib	script/hud/0081bc.txt
_0081be
	lib	script/hud/0081be.txt
h0009b6:
	lib	script/hud/0009b6.txt
h000a1f:
	lib	script/hud/000a1f.txt
h000a21:
	lib	script/hud/000a21.txt
h000a23:
	lib	script/hud/000a23.txt
h000a25:
	lib	script/hud/000a25.txt
h001690:
	lib	script/hud/001690.txt	; 41C0
h00161d:
	lib	script/hud/00161d.txt	; 41D0
h000982:
	lib	script/hud/000982.txt	; 41EE

;--------------------------------------------------------------------------------
BANK04	group	$04
;--------------------------------------------------------------------------------
	org	$494E
	libbin	gfx/hud_names.chr

;--------------------------------------------------------------------------------
BANK13	group	$13
;--------------------------------------------------------------------------------
;	org	$42AE		; options, gfx size fix
;	ld	bc,1152
;----------------------
	org	$42C0		; options, replace chr offset for map 07 variants
	ld	hl,$4590
;----------------------
	org	$42D8		; options, replace chr offset for maps 08-12
	ld	hl,$4590
;----------------------
	org	$4391		; options, selector offsets for map 06
	dw	$9900,$9920,$9940,$9960,$9980,$99A0,$99C0
;----------------------
	org	$438B		; options, selector height fix
	ld	bc,$1401
;----------------------
	org	$439F		; options, valkyries map selector fix
	call	valkyries
;----------------------
	org	$43AA		; options, ending selector height fix
	ld	bc,$0901
;----------------------
	org	$43B0		; options, selector offsets for map 10 - ending
	dw	$98E0,$9900,$9920,$9940,$9960,$9980,$99A0
	dw	$98EA,$990A,$992A,$994A,$996A,$998A,$99AA
;----------------------
	org	$4590		; options, gfx for 06-12
	libbin	gfx/opt06-12.chr
;----------------------
	org	$6DD2		; options, gallery main map
	libbin	gfx/opt06.map
;----------------------
	org	$6F3C		; options, basara's gallery
	libbin	gfx/opt07bas.map
;----------------------
	org	$70A6		; options, mylene's gallery
	libbin	gfx/opt07myl.map
;----------------------
	org	$7210		; options, ray & veffidas' gallery
	libbin	gfx/opt07r&v.map
;----------------------
	org	$737A		; options, gamlin's gallery
	libbin	gfx/opt07gam.map
;----------------------
	org	$74E4		; options, max's gallery
	libbin	gfx/opt07max.map
;----------------------
	org	$764E		; options, milia's gallery
	libbin	gfx/opt07mil.map
;----------------------
	org	$77B8		; options, others gallery main map
	libbin	gfx/opt08.map
;----------------------
	org	$7922		; options, opening gallery
	libbin	gfx/opt09.map
;----------------------
	org	$7A8C		; options, ending gallery
	libbin	gfx/opt10.map
;----------------------
	org	$7BF6		; options, valkyries gallery
	libbin	gfx/opt11.map
;----------------------
	org	$7D60		; options, backgrounds gallery
	libbin	gfx/opt12.map
;----------------------
	org	$7EC8		; options, selector offsets for map 11 - valkyries
valkyries:
	ld	c,a
	ld	a,($C7E4)		; current selection from others map
	cp	2
	ld	a,c
	jr	nz,_skip
	ld	hl,_vals
	ret
_vals
	dw	$98EA,$990A,$992A,$994A,$996A,$998A,$DEAD,$99AA,$99CA,$99EA                                                                              
_skip
	ld	hl,$43B0		; ending map offsets
	ret

;--------------------------------------------------------------------------------
BANK1E	group	$1E
;--------------------------------------------------------------------------------
	org	$403E
	libbin	gfx/dmg.chr
;----------------------
	org	$4C40
	libbin	gfx/dmg.map
;----------------------
	org	$4E91
	call	_ctscs_fix
;----------------------
	org	$4F96
	ld	bc,$1401
;----------------------
	org	$4F9E
	dw	$9900,$9920,$9940,$9960,$9980,$99A0,$99C0
;----------------------
	org	$54E6
	libbin	gfx/opt13-14.chr
;----------------------
	org	$62E8
	libbin	gfx/opt13.map
;----------------------
	org	$6452
	libbin	gfx/opt14.map
;----------------------
	org	$65FA		; fixes cutscenes dependance on character choice
_ctscs_fix
	ld	a,($C7E9)
	ld	($D001),a
	ld	a,($C7E4)
	ret

;--------------------------------------------------------------------------------
BANK29	group	$29
;--------------------------------------------------------------------------------
	org	$402D		; str relocation
	dw	_0a402d
;----------------------
	org	$4074		; str relocation
	dw	_0a4074
;----------------------
	org	$40BC		; str relocation
	dw	_0a40bc
;----------------------
	org	$4103		; str relocation
	dw	_0a4103
;----------------------
	org	$42FD		; text_writer, read string reduced to one byte
	xor	a
	ld	b,a
	ld	c,(hl)
	inc	hl
	ld	a,c
;----------------------
	org	$4352		; get_chr_offset, 2x2 to 1x2 reduction
	ld	b,$20
;----------------------
	org	$4375		; copy_name, patched writer 
	lib	1x1_names.s
;----------------------
	org	$43AA		; txt_clear_name, number of tiles to clear screen 
	ld 	b,20
;----------------------
	org	$43AD		; txt_clear_name, with tile from bank
	ld	c,$20
	ld	b,1
	call	$3A00		; 	core 1x1 mod
;----------------------
	org	$43B5		; txt_clear_name, next tile offset
	ld	a,$10
;----------------------
	org	$43C9		; txt_clear_window, number of tiles to clear screen 
	ld	b,$24
;----------------------
	org	$43CC		; txt_clear_window, clear screen with tile #
	ld	c,$20
;----------------------
	org	$43D4		; txt_clear_window, clear screen next tile offset
	ld	a,$20
;----------------------
	org	$4536		; writer, selector window
	lib	selector.i
;----------------------
	org	$4DE8		; writer, window map for 1x2
	lib	window.i
;----------------------
	org	$5F7F		; names
	lib	names.i
_0a402d
	lib	script/0a402d.txt
_0a4074
	lib	script/0a4074.txt
_0a40bc
	lib	script/0a40bc.txt
_0a4103
	lib	script/0a4103.txt

;--------------------------------------------------------------------------------
BANK2A	group	$2A
;--------------------------------------------------------------------------------
	org	$4040		; fonts, ascii padding
	lib	fonts.i

;--------------------------------------------------------------------------------
BANK2C	group	$2C
;--------------------------------------------------------------------------------
	org	$4000		; selector
	lib	2C.s

;--------------------------------------------------------------------------------
BANK2D	group	$2D
;--------------------------------------------------------------------------------
	org	$42DB		; gfx, 1st live upper half (mylene)
	libbin	gfx/1st_live_a.chr
;----------------------
	org	$44DB		; gfx, 1st live bottom half
	libbin	gfx/1st_live_b.chr
;----------------------
	org	$4EDB		; gfx, 1st live text
	libbin	gfx/1st_live_c.chr
;----------------------
	org	$50DB		; gfx, 1st live text
	libbin	gfx/1st_live_d.chr
;----------------------
	org	$52DB		; gfx, 1st live text
	libbin	gfx/1st_live_e.chr
;----------------------
	org	$421B		; gfx, 1st live text
	libbin	gfx/1st_live_f.chr
;----------------------
	org	$521B		; gfx, 1st live text
	libbin	gfx/1st_live_g.chr
;----------------------
	org	$5ADB		; gfx, 2nd live upper half (ray)
	libbin	gfx/2nd_live_a.chr
;----------------------
	org	$5CDB		; gfx, 2nd live bottom half
	libbin	gfx/2nd_live_b.chr
;----------------------
	org	$66DB		; gfx, 2nd live text
	libbin	gfx/2nd_live_c.chr
;----------------------
	org	$68DB		; gfx, 2nd live text
	libbin	gfx/2nd_live_d.chr
;----------------------
	org	$6ADB		; gfx, 2nd live text
	libbin	gfx/2nd_live_e.chr
;----------------------
	org	$5A1B		; gfx, 2nd live text
	libbin	gfx/2nd_live_f.chr
;----------------------
	org	$6A1B		; gfx, 2nd live text
	libbin	gfx/2nd_live_g.chr

;--------------------------------------------------------------------------------
BANK2E	group	$2E
;--------------------------------------------------------------------------------
	org	$42DB		; gfx, 3rd live upper half (gamlin)
	libbin	gfx/3rd_live_a.chr
;----------------------
	org	$44DB		; gfx, 3rd live bottom half
	libbin	gfx/3rd_live_b.chr
;----------------------
	org	$4EDB		; gfx, 3rd live text
	libbin	gfx/3rd_live_c.chr
;----------------------
	org	$50DB		; gfx, 3rd live text
	libbin	gfx/3rd_live_d.chr
;----------------------
	org	$52DB		; gfx, 3rd live text
	libbin	gfx/3rd_live_e.chr
;----------------------
	org	$421B		; gfx, 3rd live text
	libbin	gfx/3rd_live_f.chr
;----------------------
	org	$521B		; gfx, 3rd live text
	libbin	gfx/3rd_live_g.chr
;----------------------
	org	$5ADB		; gfx, 4th live upper half (milia)
	libbin	gfx/4th_live_a.chr
;----------------------
	org	$5CDB		; gfx, 4th live bottom half
	libbin	gfx/4th_live_b.chr
;----------------------
	org	$66DB		; gfx, 4th live text
	libbin	gfx/4th_live_c.chr
;----------------------
	org	$68DB		; gfx, 4th live text
	libbin	gfx/4th_live_d.chr
;----------------------
	org	$6ADB		; gfx, 4th live text
	libbin	gfx/4th_live_e.chr
;----------------------
	org	$5A1B		; gfx, 4th live text
	libbin	gfx/4th_live_f.chr
;----------------------
	org	$6A1B		; gfx, 4th live text
	libbin	gfx/4th_live_g.chr

;--------------------------------------------------------------------------------
BANK2F	group	$2F
;--------------------------------------------------------------------------------
	org	$42DB		; gfx, 5th live upper half (max)
	libbin	gfx/5th_live_a.chr
;----------------------
	org	$44DB		; gfx, 5th live bottom half
	libbin	gfx/5th_live_b.chr
;----------------------
	org	$4EDB		; gfx, 5th live text
	libbin	gfx/5th_live_c.chr
;----------------------
	org	$50DB		; gfx, 5th live text
	libbin	gfx/5th_live_d.chr
;----------------------
	org	$52DB		; gfx, 5th live text
	libbin	gfx/5th_live_e.chr
;----------------------
	org	$421B		; gfx, 5th live text
	libbin	gfx/5th_live_f.chr
;----------------------
	org	$521B		; gfx, 5th live text
	libbin	gfx/5th_live_g.chr
;----------------------
	org	$5ADB		; gfx, 6th live upper half (basara)
	libbin	gfx/6th_live_a.chr
;----------------------
	org	$5CDB		; gfx, 6th live bottom half
	libbin	gfx/6th_live_b.chr
;----------------------
	org	$66DB		; gfx, 6th live text
	libbin	gfx/6th_live_c.chr
;----------------------
	org	$68DB		; gfx, 6th live text
	libbin	gfx/6th_live_d.chr
;----------------------
	org	$6ADB		; gfx, 6th live text
	libbin	gfx/6th_live_e.chr
;----------------------
	org	$5A1B		; gfx, 6th live text
	libbin	gfx/6th_live_f.chr
;----------------------
	org	$6A1B		; gfx, 6th live text
	libbin	gfx/6th_live_g.chr

;--------------------------------------------------------------------------------
BANK30	group	$30
;--------------------------------------------------------------------------------
	org	$5D13		; gfx, title screen logo
	libbin	gfx/logo.chr
;----------------------
	org	$6513		; gfx, title screen 
	libbin	gfx/title.chr
;----------------------
	org	$6B13		; gfx, Push Start
	libbin	gfx/push_start.chr
;----------------------
	org	$7449		; gfx, title screen map
	lib	title_map.i
;----------------------
	org	$75B3		; gfx, title screen atr
	lib	title_atr.i
;----------------------
	IF EPOCH
	org	$7748		; fast epoch logo
	xor	a
	ENDIF

;--------------------------------------------------------------------------------
BANK31	group	$31
;--------------------------------------------------------------------------------
	org	$6055		; gfx, basara name
	libbin	gfx/basara.chr
;----------------------
	org	$6697		; gfx, basara name
	libbin	gfx/basara.map

;--------------------------------------------------------------------------------
BANK32	group	$32
;--------------------------------------------------------------------------------
	org	$6056		; gfx, mylene name
	libbin	gfx/mylene.chr
;----------------------
	org	$6698		; gfx, mylene name
	libbin	gfx/mylene.map

;--------------------------------------------------------------------------------
BANK33	group	$33
;--------------------------------------------------------------------------------
	org	$6055		; gfx, ray name
	libbin	gfx/ray.chr
;----------------------
	org	$6697		; gfx, ray name
	libbin	gfx/ray.map

;--------------------------------------------------------------------------------
BANK34	group	$34
;--------------------------------------------------------------------------------
	org	$6056		; gfx, veffidas name
	libbin	gfx/veffidas.chr
;----------------------
	org	$6698		; gfx, veffidas name
	libbin	gfx/veffidas.map

;--------------------------------------------------------------------------------
BANK35	group	$35
;--------------------------------------------------------------------------------
	org	$6055		; gfx, gamlin name
	libbin	gfx/gamlin.chr
;----------------------
	org	$6697		; gfx, gamlin name
	libbin	gfx/gamlin.map

;--------------------------------------------------------------------------------
BANK36	group	$36
;--------------------------------------------------------------------------------
	org	$6056		; gfx, milia name
	libbin	gfx/milia.chr
;----------------------
	org	$6698		; gfx, milia name
	libbin	gfx/milia.map

;--------------------------------------------------------------------------------
BANK37	group	$37
;--------------------------------------------------------------------------------
	org	$6055		; gfx, max name
	libbin	gfx/max.chr
;----------------------
	org	$6697		; gfx, max name
	libbin	gfx/max.map

;--------------------------------------------------------------------------------
BANK38	group	$38
;--------------------------------------------------------------------------------
	org	$5F60		; gfx, flower name
	libbin	gfx/flower.chr
;----------------------
	org	$65A2		; gfx, flower name
	libbin	gfx/flower.map

;--------------------------------------------------------------------------------
BANK39	group	$39
;--------------------------------------------------------------------------------
	org	$4000		; gfx, game intro txt screen 1, 2
	lib	39.s

;--------------------------------------------------------------------------------
BANK3A	group	$3A
;--------------------------------------------------------------------------------
	org	$4000		; gfx, game intro txt screen 3, 4
	lib	3A.s

;--------------------------------------------------------------------------------
BANK3B	group	$3B
;--------------------------------------------------------------------------------
	org	$4000		; gfx, game intro txt screen 3, 4
	lib	3B.s

;--------------------------------------------------------------------------------
BANK3D	group	$3D
;--------------------------------------------------------------------------------
	org	$4132		; str relocation
	dw	_0f4132
;----------------------
	org	$4239		; text_writer, read string reduced to one byte
	xor	a
	ld	b,a
	ld	c,(hl)
	inc	hl
	ld	a,c
;----------------------
	org	$4283		; get_chr_offset, 2x2 to 1x2 reduction
	ld	b,$20
;----------------------
	org	$42A6		; copy_name, patched writer 
	lib	1x1_names.s
;----------------------
	org	$42FA		; txt_clear_window, number of tiles to clear screen 
	ld	b,$24
;----------------------
	org	$42FD		; txt_clear_window, clear screen with tile #
	ld	c,$20
;----------------------
	org	$4305		; txt_clear_window, clear screen next tile offset
	ld	a,$20
;----------------------
	org	$4444		; str relocation
	dw	_0f4444
;----------------------
	org	$4D02		; writer, window map for 1x2
	lib	window.i
;----------------------
	org	$57EE		; names
	lib	names.i
;----------------------
_0f4132
	lib	script/intro/0f4132.txt
_0f4444
	lib	script/outro/0f4444.txt


;--------------------------------------------------------------------------------
BANK3E	group	$3E
;--------------------------------------------------------------------------------
	org	$4000		; script, jp wholly removed
	lib	3E.s


;--------------------------------------------------------------------------------
BANK3F	group	$3F
;--------------------------------------------------------------------------------
	org	$4180		; str relocation
	dw	_0fc180
;----------------------
	org	$41C8		; str relocation
	dw	_0fc1c8
;----------------------
	org	$4210		; str relocation
	dw	_0fc210
;----------------------
	org	$43AF		; text_writer, read string reduced to one byte
	xor	a
	ld	b,a
	ld	c,(hl)
	inc	hl
	ld	a,c
;----------------------
	org	$4404		; get_chr_offset, 2x2 to 1x2 reduction
	ld	b,$20
;----------------------
	org	$4427		; copy_name, patched writer 
	lib	1x1_names.s
;----------------------
	org	$445C		; txt_clear_name, number of tiles to clear screen 
	ld 	b,20
;----------------------
	org	$445F		; txt_clear_name, with tile from bank
	ld	c,$20
	ld	b,1
	call	$3A00		; 	core 1x1 mod
;----------------------
	org	$4467		; txt_clear_name, next tile offset
	ld	a,$10
;----------------------
	org	$447B		; txt_clear_window, number of tiles to clear screen 
	ld	b,$24
;----------------------
	org	$447E		; txt_clear_window, clear screen with tile #
	ld	c,$20
;----------------------
	org	$4486		; txt_clear_window, clear screen next tile offset
	ld	a,$20
;----------------------
	org	$4FCB		; writer, window map for 1x2
	lib	window.i
;----------------------
	org	$7ACB		; names
	lib	names.i
;----------------------
_0fc180
	lib	script/intro/0fc180.txt
_0fc1c8
	lib	script/intro/0fc1c8.txt
_0fc210
	lib	script/intro/0fc210.txt



;--------------------------------------------------------------------------------
BANK40	group	$40
;--------------------------------------------------------------------------------
	org	$4286		; text_writer, read string reduced to one byte
	xor	a
	ld	b,a
	ld	c,(hl)
	inc	hl
	ld	a,c
;----------------------
	org	$42DB		; get_chr_offset, 2x2 to 1x2 reduction
	ld	b,$20
;----------------------
	org	$42FE		; copy_name, patched writer 
	lib	1x1_names.s
;----------------------
	org	$4333		; txt_clear_name, number of tiles to clear screen 
	ld 	b,20
;----------------------
	org	$4336		; txt_clear_name, with tile from bank
	ld	c,$20
	ld	b,1
	call	$3A00		;	core 1x1 mod
;----------------------
	org	$433E		; txt_clear_name, next tile offset
	ld	a,$10
;----------------------
	org	$4352		; txt_clear_window, number of tiles to clear screen 
	ld	b,$24
;----------------------
	org	$4355		; txt_clear_window, clear screen with tile #
	ld	c,$20
;----------------------
	org	$435D		; txt_clear_window, clear screen next tile offset
	ld	a,$20
;----------------------
	org	$4395		; str relocation
	dw	_100395
	dw	_100397
	dw	_100399
	dw	_10039B
	dw	_10039D
	dw	_10039f
	dw	_1003a1
	dw	_1003a3
	dw	_1003a5
	dw	_1003a7
	dw	_1003a9
	dw	_1003ab
	dw	_1003ad
	dw	_1003af
	dw	_1003b1
	dw	_1003b3
	dw	_1003b5
	dw	_1003b7
	dw	_1003b9
;----------------------
_100395				; overwrite original script starting at $43BB
	lib	script/lvl1/100395.txt
_100397
	lib	script/lvl1/100397.txt
_100399
	lib	script/lvl1/100399.txt
_10039B
	lib	script/lvl1/10039B.txt
_10039D
	lib	script/lvl1/10039D.txt
_10039f
	lib	script/lvl1/10039f.txt
_1003a1
	lib	script/lvl1/1003a1.txt
_1003a3
	lib	script/lvl1/1003a3.txt
_1003a5
	lib	script/lvl1/1003a5.txt
_1003a7
	lib	script/lvl1/1003a7.txt
_1003a9
	lib	script/lvl1/1003a9.txt
_1003ab
	lib	script/lvl1/1003ab.txt
_1003ad
	lib	script/lvl1/1003ad.txt
_1003af
	lib	script/lvl1/1003af.txt
_1003b1
	lib	script/lvl1/1003b1.txt
_1003b3
	lib	script/lvl1/1003b3.txt
_1003b5
	lib	script/lvl1/1003b5.txt
;----------------------
	org	$628A		; writer, window map for 1x2
	lib	window.i
;----------------------
	org	$6A21		; names
	lib	names.i
;----------------------
	org	$6AD2		; str relocation
	dw	_102ad2
	org	$6B1D
	dw	_102b1d
	org	$6B4A
	dw	_102b4a
	org	$6B7D
	dw	_102b7d
;----------------------
	org	$6C58		; writer, selector window
	lib	selector.i
;----------------------
_1003b7				; more script space needed
	lib	script/lvl1/1003b7.txt
_1003b9
	lib	script/lvl1/1003b9.txt
;----------------------
_102ad2
	lib	script/lvl1/102ad2.txt
_102b1d
	lib	script/lvl1/102b1d.txt
_102b4a
	lib	script/lvl1/102b4a.txt
_102b7d
	lib	script/lvl1/102b7d.txt

;--------------------------------------------------------------------------------
BANK41	group	$41
;--------------------------------------------------------------------------------
	org	$4000		; patches, script, jp wholly removed
	lib	41.s

;--------------------------------------------------------------------------------
BANK42	group	$42
;--------------------------------------------------------------------------------
	org	$4000		; patches, script, jp wholly removed
	lib	42.s

;--------------------------------------------------------------------------------
BANK43	group	$43
;--------------------------------------------------------------------------------
	org	$4000		; patches, script, jp wholly removed
	lib	43.s

;--------------------------------------------------------------------------------
BANK44	group	$44
;--------------------------------------------------------------------------------
	org	$4000		; patches, script, jp wholly removed
	lib	44.s

;--------------------------------------------------------------------------------
BANK45	group	$45
;--------------------------------------------------------------------------------
	org	$4000		; patches, script, jp wholly removed
	lib	45.s

;--------------------------------------------------------------------------------
BANK46	group	$46
;--------------------------------------------------------------------------------
	org	$4000		; patches, script, jp wholly removed
	lib	46.s

;--------------------------------------------------------------------------------
BANK47	group	$47
;--------------------------------------------------------------------------------
	org	$42C0		; text_writer, read string reduced to one byte
	xor	a
	ld	b,a
	ld	c,(hl)
	inc	hl
	ld	a,c
;----------------------
	org	$4315		; get_chr_offset, 2x2 to 1x2 reduction
	ld	b,$20
;----------------------
	org	$4338		; copy_name, patched writer 
	lib	1x1_names.s
;----------------------
	org	$436D		; txt_clear_name, number of tiles to clear screen 
	ld 	b,20
;----------------------
	org	$4370		; txt_clear_name, with tile from bank
	ld	c,$20
	ld	b,1
	call	$3A00		;	core 1x1 mod
;----------------------
	org	$4378		; txt_clear_name, next tile offset
	ld	a,$10
;----------------------
	org	$438C		; txt_clear_window, number of tiles to clear screen 
	ld	b,$24
;----------------------
	org	$438F		; txt_clear_window, clear screen with tile #
	ld	c,$20
;----------------------
	org	$4397		; txt_clear_window, clear screen next tile offset
	ld	a,$20
;----------------------
	org	$43AB		; str relocation
	dw	_11c3ab
	dw	_11c3ad
	dw	_11c3af
	dw	_11c3b1
	dw	_11c3b3
	dw	_11c3b5
	dw	_11c3b7
	dw	_11c3b9
	dw	_11c3bb
	dw	_11c3bd
	dw	_11c3bf
	dw	_11c3c1
	dw	_11c3c3
	dw	_11c3c5
	dw	_11c3c7
	dw	_11c3c9
	dw	_11c3cb
	dw	_11c3cd
	dw	_11c3cf
;----------------------
	org	$584A		; writer, window map for 1x2
	lib	window.i
;----------------------
	org	$69E1		; names
	lib	names.i
;----------------------
_11c3ab
	lib	script/outro/11c3ab.txt
_11c3ad
	lib	script/outro/11c3ad.txt
_11c3af
	lib	script/outro/11c3af.txt
_11c3b1
	lib	script/outro/11c3b1.txt
_11c3b3
	lib	script/outro/11c3b3.txt
_11c3b5
	lib	script/outro/11c3b5.txt
_11c3b7
	lib	script/outro/11c3b7.txt
_11c3b9
	lib	script/outro/11c3b9.txt
_11c3bb
	lib	script/outro/11c3bb.txt
_11c3bd
	lib	script/outro/11c3bd.txt
_11c3bf
	lib	script/outro/11c3bf.txt
_11c3c1
	lib	script/outro/11c3c1.txt
_11c3c3
	lib	script/outro/11c3c3.txt
_11c3c5
	lib	script/outro/11c3c5.txt
_11c3c7
	lib	script/outro/11c3c7.txt
_11c3c9
	lib	script/outro/11c3c9.txt
_11c3cb
	lib	script/outro/11c3cb.txt
_11c3cd
	lib	script/outro/11c3cd.txt
_11c3cf
	lib	script/outro/11c3cf.txt

;--------------------------------------------------------------------------------
BANK4E	group	$4E
;--------------------------------------------------------------------------------
	org	$4000		; game menu
	lib	4E.s

;--------------------------------------------------------------------------------
BANK4F	group	$4F
;--------------------------------------------------------------------------------
	org	$4000		; options, pages 1-5
	lib	4F.s

;--------------------------------------------------------------------------------
BANK50	group	$50
;--------------------------------------------------------------------------------
	org	$4000		; manual save selector
	lib	50.s

;--------------------------------------------------------------------------------
BANK5C	group	$5C
;--------------------------------------------------------------------------------
	org	$4000		; options, pages 1-5
	lib	5C.s

;--------------------------------------------------------------------------------
BANK62	group	$62
;--------------------------------------------------------------------------------
	org	$5C1F		; gfx, credits
	libbin	gfx/credits.chr
;----------------------
	org	$6229		; credits - 1
	libbin	gfx/cr01.map

;--------------------------------------------------------------------------------
BANK63	group	$63
;--------------------------------------------------------------------------------
	org	$5C1F		; gfx, credits
	libbin	gfx/credits.chr
;----------------------
	org	$6029		; credits - 2
	libbin	gfx/cr02.map

;--------------------------------------------------------------------------------
BANK64	group	$64
;--------------------------------------------------------------------------------
	org	$5C1F		; gfx, credits
	libbin	gfx/credits03.chr
;----------------------
	org	$5E29		; credits - 3
	libbin	gfx/cr03.map

;--------------------------------------------------------------------------------
BANK65	group	$65
;--------------------------------------------------------------------------------
	org	$5C1F		; gfx, credits
	libbin	gfx/credits.chr
;----------------------
	org	$6029		; credits - 4
	libbin	gfx/cr04.map

;--------------------------------------------------------------------------------
BANK66	group	$66
;--------------------------------------------------------------------------------
	org	$5C1F		; gfx, credits
	libbin	gfx/credits.chr
;----------------------
	org	$6229		; credits - 5
	libbin	gfx/cr05.map

;--------------------------------------------------------------------------------
BANK67	group	$67
;--------------------------------------------------------------------------------
	org	$4000		; credits - 6 to 12
	lib	67.s

	end