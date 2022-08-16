;intro stills
	push	af
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
	pop	af
	ld	($C700),a
;	add	a,a
	ld	hl,chr_3B
;	call	$A59
;	ldi	a,(hl)
;	ld	h,(hl)
;	ld	l,a
	ld	de,$9000
	ld	bc,672
	call	$44A
;	ld	a,($C700)
;	add	a,a
;	ld	hl,off_4161
;	call	$A59
;	ldi	a,(hl)
;	ld	h,(hl)
;	ld	l,a
;	ld	de,$8800
;	ld	bc,$800
;	call	$44A
;	ld	a,1
;	ld	($FF4F),a
;	ld	a,($C700)
;	add	a,a
;	ld	hl,off_4167
;	call	$A59
;	ldi	a,(hl)
;	ld	h,(hl)
;	ld	l,a
;	ld	de,$9000
;	ld	bc,$800
;	call	$44A
;	xor	a
;	ld	($FF4F),a
	ld	hl,byte_3B_71A1
	ld	de,$C100
	ld	bc,$40
	call	$44A
	call	$343
	ld	a,($C700)
	add	a,a
	ld	hl,maps_3B
	call	$A59
	ld	a,(hl+)
	ld	d,(hl)
	ld	e,a
	ld	hl,$9800
	call	$48F
;	ld	a,($C700)
;	add	a,a
	ld	de,attr_3B
;	call	$A59
;	ldi	a,(hl)
;	ld	d,(hl)
;	ld	e,a
	ld	hl,$9800
	call	$4D5
	ld	hl,$C100
	ld	de,$C180
	ld	bc,8
	call	$44A
	ld	hl,$C100
	ld	b,4

loc_3B_40AE:
	ld	a,$FF
	ld	(hl),a
	inc	hl
	ld	a,$7F
	ld	(hl),a
	inc	hl
	dec	b
	jp	nz,loc_3B_40AE
	ld	a,1
	ld	($C0CF),a
	ld	($C704),a
	call	$2FD

loc_3B_40C5:
	call	$1F4
	ld	a,($FF8B)
	and	$B
	ld	a,1
	jp	nz,locret_415A
	ld	a,($C704)
	cp	0
	jp	z,loc_3B_40F4
	ld	a,($C702)
	and	1
	jp	nz,loc_3B_40F4
	ld	hl,$C100
	ld	de,$C180
	ld	b,4
	call	$54C
	ld	($C704),a
	ld	a,1
	ld	($C0CF),a

loc_3B_40F4:
	ld	a,($C705)
	cp	0
	jp	z,loc_3B_4117
	ld	a,($C702)
	and	3
	jp	nz,loc_3B_4117
	ld	hl,$C100
	ld	de,$C180
	ld	b,4
	call	$54C
	ld	($C705),a
	ld	a,1
	ld	($C0CF),a

loc_3B_4117:
	ld	a,($C701)
	ld	h,a
	ld	a,($C702)
	ld	l,a
	inc	hl
	ld	a,h
	ld	($C701),a
	ld	a,l
	ld	($C702),a
	ld	de,word_3B_4179
	ld	a,($C703)
	add	a,a
	call	$A6D
	ld	a,(de)
	ld	b,a
	inc	de
	ld	a,(de)
	ld	c,a
	ld	a,b
	and	c
	cp	$FF
	jp	z,loc_3B_4158
	ld	a,h
	cpl
	ld	h,a
	ld	a,l
	cpl
	ld	l,a
	inc	hl
	add	hl,bc
	ld	a,h
	or	l
	jp	nz,loc_3B_4155
	call	sub_3B_417F
	ld	a,($C703)
	inc	a
	ld	($C703),a

loc_3B_4155:
	jp	loc_3B_40C5

loc_3B_4158:
	ld	a,0

locret_415A:
	ret

maps_3B:
	dw 	map_3B_1
	dw 	map_3B_2
	dw 	map_3B_3
	dw 	map_3B_4

word_3B_4179:
	dw 	$D000
	dw 	$5001
	dw 	$FFFF

sub_3B_417F:
	ld	a,($C703)
	call	$3EC
	dw	loc_3B_4189
	dw	loc_3B_41A0

loc_3B_4189:
	ld	hl,$C180
	ld	b,4

loc_3B_418E:
	ld	a,0
	ld	(hl),a
	inc	hl
	ld	a,0
	ld	(hl),a
	inc	hl
	dec	b
	jp	nz,loc_3B_418E
	ld	a,1
	ld	($C705),a
	ret

loc_3B_41A0:
	ret

chr_3B:
	libbin	gfx/3B.chr

byte_3B_71A1:
	db	$FF,$7F,$00,$80,$3F,$01,$E0,$03,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

map_3B_1:
	db	$14
	db	$12
	libbin	gfx/3B_1.map

map_3B_2:
	db	$14
	db	$12
	libbin	gfx/3B_2.map

map_3B_3:
	db	$14
	db	$12
	libbin	gfx/3B_3.map

map_3B_4:
	db	$14
	db	$12
	libbin	gfx/3B_4.map

attr_3B:
	db	$14
	db	$12
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
