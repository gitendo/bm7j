; credits
	call	$2D6
	ld	a,0
	ld	($FF40),a
	xor	a
	ld	($C205),a
	ld	($C206),a
	call	$B7D
	call	$527
	ld	hl,$C700
	ld	bc,$100
	call	$30C
	ld	a,$B4
	ld	($C700),a
	call	cr_scr_67_06
	call	$70B
	call	$2FD
	call	$684

loc_67_402E:
	call	$1F4
	ld	a,($C700)
	dec	a
	ld	($C700),a
	jr	nz,loc_67_402E
	call	$6F2
	call	$65A
	call	$2D6
	ld	a,0
	ld	($FF40),a
	ld	a,$B4
	ld	($C700),a
	call	cr_scr_67_07
	call	$70B
	call	$2FD
	call	$684

loc_67_4058:
	call	$1F4
	ld	a,($C700)
	dec	a
	ld	($C700),a
	jr	nz,loc_67_4058
	call	$6F2
	call	$65A
	call	$2D6
	ld	a,0
	ld	($FF40),a
	ld	a,$B4
	ld	($C700),a
	call	cr_scr_67_08
	call	$70B
	call	$2FD
	call	$684

loc_67_4082:
	call	$1F4
	ld	a,($C700)
	dec	a
	ld	($C700),a
	jr	nz,loc_67_4082
	call	$6F2
	call	$65A
	call	$2D6
	ld	a,0
	ld	($FF40),a
	ld	a,$B4
	ld	($C700),a
	call	cr_scr_67_09
	call	$70B
	call	$2FD
	call	$684

loc_67_40AC:
	call	$1F4
	ld	a,($C700)
	dec	a
	ld	($C700),a
	jr	nz,loc_67_40AC
	call	$6F2
	call	$65A
	call	$2D6
	ld	a,0
	ld	($FF40),a
	ld	a,$B4
	ld	($C700),a
	call	cr_scr_67_10
	call	$70B
	call	$2FD
	call	$684

loc_67_40D6:
	call	$1F4
	ld	a,($C700)
	dec	a
	ld	($C700),a
	jr	nz,loc_67_40D6
	call	$6F2
	call	$65A
	call	$2D6
	ld	a,0
	ld	($FF40),a
	ld	a,$B4
	ld	($C700),a
	call	cr_scr_67_11
	call	$70B
	call	$2FD
	call	$684

loc_67_9999:
	call	$1F4
	ld	a,($C700)
	dec	a
	ld	($C700),a
	jr	nz,loc_67_9999
	call	$6F2
	call	$65A
	call	$2D6
	ld	a,0
	ld	($FF40),a
	ld	a,$B4
	ld	($C700),a
	call	cr_scr_67_12
	call	$70B
	call	$2FD
	call	$684

loc_67_4100:
	call	$1F4
	ld	a,($C700)
	dec	a
	ld	($C700),a
	jr	nz,loc_67_4100
	call	$6F2
	call	$65A
	jp	loc_67_4115

loc_67_4115:
	ld	a,($D033)
	and	a
	jp	nz,loc_67_412F
	ld	hl,$D00A
	ld	b,$2A
	dec	b
	ld	a,1

loc_67_4124:
	and	(hl)
	jr	z,loc_67_412F
	inc	hl
	dec	b
	jp	nz,loc_67_4124
	ld	a,5
	ret

loc_67_412F:
	ld	a,($D001)
	cp	$C
	jp	z,loc_67_4165
	cp	$F
	jp	z,loc_67_4168
	cp	1
	jp	z,loc_67_4162
	cp	$A
	jp	z,loc_67_4162
	cp	$D
	jp	z,loc_67_4162
	cp	$E
	jp	z,loc_67_4162
	cp	7
	jp	z,loc_67_416B
	cp	8
	jp	z,loc_67_416B
	cp	9
	jp	z,loc_67_416B
	ld	a,0
	ret

loc_67_4162:
	ld	a,1
	ret

loc_67_4165:
	ld	a,2
	ret

loc_67_4168:
	ld	a,3
	ret

loc_67_416B:
	ld	a,4
	ret

cr_scr_67_06:
	ld	hl,chr_67_06
	ld	de,$9000
	ld	bc,$480
	call	$44A
	ld	hl,pal_67_bg
	ld	de,$C100
	ld	bc,8
	call	$44A
	call	$343
	ld	de,map_67_06
	ld	hl,$9800
	call	$48F
	ld	a,0
	ld	bc,$1412
	ld	hl,$9800
	jp	$507

cr_scr_67_07:
;	ld	hl,chr_67_07
;	ld	de,$9000
;	ld	bc,$600
;	call	$44A
	ld	hl,pal_67_bg
	ld	de,$C100
	ld	bc,8
	call	$44A
	call	$343
	ld	de,map_67_07
	ld	hl,$9800
	call	$48F
;	ld	a,0
;	ld	bc,$1412
;	ld	hl,$9800
;	jp	$507
	ret

cr_scr_67_08:
;	ld	hl,chr_67_08
;	ld	de,$9000
;	ld	bc,$400
;	call	$44A
	ld	hl,pal_67_bg
	ld	de,$C100
	ld	bc,8
	call	$44A
	call	$343
	ld	de,map_67_08
	ld	hl,$9800
	call	$48F
;	ld	a,0
;	ld	bc,$1412
;	ld	hl,$9800
;	jp	$507
	ret

cr_scr_67_09:
;	ld	hl,chr_67_09
;	ld	de,$9000
;	ld	bc,$800
;	call	$44A
	ld	hl,pal_67_bg
	ld	de,$C100
	ld	bc,8
	call	$44A
	call	$343
	ld	de,map_67_09
	ld	hl,$9800
	call	$48F
;	ld	a,0
;	ld	bc,$1412
;	ld	hl,$9800
;	jp	$507
	ret

cr_scr_67_10:
;	ld	hl,chr_67_10_11
;	ld	de,$9000
;	ld	bc,$800
;	call	$44A
	ld	hl,pal_67_bg
	ld	de,$C100
	ld	bc,8
	call	$44A
	call	$343
	ld	de,map_67_10
	ld	hl,$9800
	call	$48F
;	ld	a,0
;	ld	bc,$1412
;	ld	hl,$9800
;	jp	$507
	ret

cr_scr_67_11:
;	ld	hl,chr_67_10_11
;	ld	de,$9000
;	ld	bc,$800
;	call	$44A
	ld	hl,pal_67_bg
	ld	de,$C100
	ld	bc,8
	call	$44A
	call	$343
	ld	de,map_67_11
	ld	hl,$9800
	call	$48F
;	ld	a,0
;	ld	bc,$1412
;	ld	hl,$9800
;	jp	$507
	ret

cr_scr_67_12:
;	ld	hl,chr_67_12
;	ld	de,$9000
;	ld	bc,$800
;	call	$44A
	ld	hl,pal_67_bg
	ld	de,$C100
	ld	bc,8
	call	$44A
	call	$343
	ld	de,map_67_12
	ld	hl,$9800
	call	$48F
;	ld	a,0
;	ld	bc,$1412
;	ld	hl,$9800
;	jp	$507
	ret

map_67_06:
	db	$14
	db	$12
	libbin	gfx/cr06.map

map_67_07:
	db	$14
	db	$12
	libbin	gfx/cr07.map

map_67_08:
	db	$14
	db	$12
	libbin	gfx/cr08.map

map_67_09:
	db	$14
	db	$12
	libbin	gfx/cr09.map

map_67_10:
	db	$14
	db	$12
	libbin	gfx/cr10.map

map_67_11:
	db	$14
	db	$12
	libbin	gfx/cr11.map

map_67_12:
	db	$14
	db	$12
	libbin	gfx/cr12.map

chr_67_06:
chr_67_07:
chr_67_08:
chr_67_09:
chr_67_10_11:
	libbin	gfx/credits06-12.chr

pal_67_bg:
	dw	0
	dw	$7FFF
	dw	$7FB1
	dw	0
