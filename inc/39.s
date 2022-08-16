; intro stills
	push	af
	call	$2D6
	ld	a,0
	ld	($FF40),a
	xor	a
	ld	($C205),a
	ld	($C206),a
	call	$0B7D
	call	$0527
	ld	hl,$C700
	ld	bc,$100
	call	$30C
	pop	af
	ld	($C700),a
;	add	a,a
	ld	hl,chr_39
;	call	$0A59
;	ld	a,(hl+)
;	ld	h,(hl)
;	ld	l,a
	ld	de,$9000
	ld	bc,656
	call	$044A
;	ld	a,($C700)
;	add	a,a
;	ld	hl, off_414B
;	call	$0A59
;	ld	a,(hl+)
;	ld	h,(hl)
;	ld	l,a
;	ld	de,$8800
;	ld	bc,$800
;	call	$044A
;	ld	a,1
;	ld	($FF4F),a
;	ld	a,($C700)
;	add	a,a
;	ld	hl,off_414F
;	call	$0A59
;	ld	a,(hl+)
;	ld	h,(hl)
;	ld	l,a
;	ld	de,$9000
;	ld	bc,$800
;	call	$044A
;	xor	a
;	ld	($FF4F),a
	ld	hl,pal_39
	ld	de,$C100
	ld	bc,$40
	call	$044A
	call	$0343
	ld	a,($C700)
	add	a,a
	ld	hl,maps_39
	call	$0A59
	ld	a,(hl+)
	ld	d,(hl)
	ld	e,a
	ld	hl,$9800
	call	$048F
	ld	de,attr_39
	ld	hl,$9800
	call	$04D5
	ld	hl,$C100
	ld	de,$C180
	ld	bc,8
	call	$044A
	ld	hl,$C100
	ld	b,4

loc_39_409A:
	ld	a,$FF
	ld	(hl),a
	inc	hl
	ld	a,$7F
	ld	(hl),a
	inc	hl
	dec	b
	jp	nz,loc_39_409A
	ld	a,1
	ld	($C0CF),a
	ld	($C704),a
	call	$02FD

loc_39_40B1:
	call	$01F4
	ld	a,($FF8B)
	and	$B
	ld	a,1
	jp	nz,locret_39_4146
	ld	a,($C704)
	cp	0
	jp	z,loc_39_40E0
	ld	a,($C702)
	and	1
	jp	nz,loc_39_40E0
	ld	hl,$C100
	ld	de,$C180
	ld	b,4
	call	$054C
	ld	($C704),a
	ld	a,1
	ld	($C0CF),a

loc_39_40E0:
	ld	a,($C705)
	cp	0
	jp	z,loc_39_4103
	ld	a,($C702)
	and	3
	jp	nz,loc_39_4103
	ld	hl,$C100
	ld	de,$C180
	ld	b,4
	call	$054C
	ld	($C705),a
	ld	a,1
	ld	($C0CF),a

loc_39_4103:
	ld	a,($C701)
	ld	h,a
	ld	a,($C702)
	ld	l,a
	inc	hl
	ld	a,h
	ld	($C701),a
	ld	a,l
	ld	($C702),a
	ld	de,word_39_4153
	ld	a,($C703)
	add	a,a
	call	$0A6D
	ld	a,(de)
	ld	b,a
	inc	de
	ld	a,(de)
	ld	c,a
	ld	a,b
	and	c
	cp	$FF
	jp	z,loc_39_4144
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
	jp	nz,loc_39_4141
	call	sub_39_4159
	ld	a,($C703)
	inc	a
	ld	($C703),a

loc_39_4141:
	jp	loc_39_40B1

loc_39_4144:
	ld	a,0

locret_39_4146:
	ret

maps_39:
	dw	map_39_1
	dw	map_39_2
	dw	map_39_3
	dw	map_39_4

word_39_4153:
	dw 	$D000
	dw 	$5001
	dw 	$FFFF

sub_39_4159:
	ld	a,($C703)
	call	$03EC
	dw	loc_39_4163
	dw	loc_39_417A
loc_39_4163:
	ld	hl,$C180
	ld	b,4

loc_39_4168:
	ld	a,0
	ld	(hl),a
	inc	hl
	ld	a,0
	ld	(hl),a
	inc	hl
	dec	b
	jp	nz,loc_39_4168
	ld	a,1
	ld	($C705),a
	ret

loc_39_417A:
	ret

chr_39:
	libbin	gfx/39.chr

pal_39:
	db	$FF,$7F,$00,$80,$3F,$01,$E0,$03,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

map_39_1:
	db	$14
	db	$12
	libbin	gfx/39_1.map

map_39_2:
	db	$14
	db	$12
	libbin	gfx/39_2.map

map_39_3:
	db	$14
	db	$12
	libbin	gfx/39_3.map

map_39_4:
	db	$14
	db	$12
	libbin	gfx/39_4.map

attr_39:
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
