	ld	a,($D009)
	and	a
	jp	nz,loc_50_4133
	call	$2D6
	ld	a,$40
	ld	($FF40),a
	xor	a
	ld	($C205),a
	ld	($C206),a
	call	$B7D
	call	$527
	ld	hl,$C700
	ld	bc,$100
	call	$30C
	call	sub_50_407E
	call	sub_50_40C2
	call	sub_50_40E1
	call	sub_50_40F4
	call	sub_50_417F
	ld	a,$F
	call	sub_50_41EC
	ld	a,$A
	ld	($C702),a
	call	$2FD

loc_50_4040:
	call	$1F4
	call	sub_50_4107
	call	sub_50_413D
	ld	a,($C703)
	and	a
	jp	z,loc_50_4040
	cp	1
	ret	z
	xor	a
	ld	($C703),a
	call	$B7D
	ld	a,7
	ld	($C201),a
	ld	a,$68
	ld	($C203),a
	call	$3D4

loc_50_4067:
	call	$1F4
	call	sub_50_4208
	ld	a,($C703)
	and	a
	jp	z,loc_50_4067
	cp	1
	ret	nz
	xor	a
	ld	($C703),a
	jp	loc_50_4040

sub_50_407E:
	ld	hl,byte_50_426A	; chr
	ld	de,$9000
	ld	bc,$800
	call	$44A
	ld	hl,byte_50_4A6A
	ld	de,$8800
	ld	bc,$800
	call	$44A
	ld	a,1
	ld	($FF4F),a
	ld	hl,byte_50_526A	; chr
	ld	de,$9000
	ld	bc,576
	call	$44A
	ld	hl,byte_50_5C6A	; selector chr
	ld	de,$8800
	ld	bc,352		; new size
	call	$44A
	xor	a
	ld	($FF4F),a
	ld	hl,byte_50_5A6A	; chr
	ld	de,$8000
	ld	bc,$200
	call	$44A
	ret

sub_50_40C2:
	ld	hl,byte_50_5E6A	; pal
	ld	de,$C100
	ld	bc,$40
	call	$44A
	call	$343
	ld	hl,byte_50_5EAA	; pal
	ld	de,$C140
	ld	bc,$40
	call	$44A
	call	$358
	ret

sub_50_40E1:
	ld	de,byte_50_5F06	; map
	ld	hl,$9800
	call	$48F
	ld	de,byte_50_6070	; atr
	ld	hl,$9800
	call	$4D5
	ret

sub_50_40F4:
	ld	de,byte_50_61DA	; selector map
	ld	hl,$9C00
	call	$48F
	ld	de,byte_50_6240	; selector atr
	ld	hl,$9C00
	call	$4D5
	ret

sub_50_4107:
	ld	a,($FF8B)
	and	1
	jp	nz,loc_50_4123
	ld	a,($FF8B)
	and	$40
	jp	nz,loc_50_411A
	ld	a,($FF8B)
	and	$80
	ret	z

loc_50_411A:
	ld	a,($C700)
	xor	1
	ld	($C700),a
	ret

loc_50_4123:
	ld	a,1
	ld	($C703),a
	ld	a,($C700)
	and	a
	ret	nz
	ld	a,2
	ld	($C703),a
	ret

loc_50_4133:
	ld	a,($C0DB)
	and	a
	jr	z,loc_50_413A
	dec	a

loc_50_413A:
	jp	$831

sub_50_413D:
	call	$B7D
	ld	a,($C702)
	dec	a
	ld	($C702),a
	jp	nz,loc_50_4157
	ld	a,$A
	ld	($C702),a
	ld	a,($C701)
	xor	1
	ld	($C701),a

loc_50_4157:
	ld	a,($C701)
	add	a,a
	ld	hl,off_50_4177
	call	$A59
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,($C700)
	add	a,a
	ld	hl,byte_50_417B
	call	$A59
	ld	b,(hl)
	inc	hl
	ld	c,(hl)
	ld	hl,0
	jp	$BBB

off_50_4177:
	dw	unk_50_5EEA
	dw	unk_50_5EF8

byte_50_417B:
	db	$10
	db	$44
	db	$10
	db	$5C

sub_50_417F:
	ld	de,$9C23
	ld	hl,$C0D2
	ld	b,3

loc_50_4187:
	push	bc
	push	de
	push	hl
	ld	a,$FF
	cp	(hl)
	push	af
	ld	hl,byte_50_41E5	; empty
	jr	z,_empty
	ld	hl,byte_50_41EA	; level
_empty
	ld	bc,6
	call	$44A
	pop	af
	jr	z,loc_50_41B5

loc_50_419C:
	pop	hl
	push	hl
	ld	a,(hl+)
	add	a,$8D		; level #
	ld	(de),a
	inc	de
	ld	a,$8A		; colon
	ld	(de),a
	inc	de
	ld	a,$80		; space
	ld	(de),a
	inc	de
	ld	a,(hl+)
	call	sub_50_41D0	; play time
	inc	de
	ld	a,$8B		; :
	ld	(de),a
	inc	de
	ld	a,(hl)
	call	sub_50_41D0	; play time

loc_50_41B5:
	pop	hl
	inc	hl
	inc	hl
	inc	hl
	pop	de
	pop	bc
	ld	a,$20
	call	$A6D
	dec	b
	jp	nz,loc_50_4187
	ld	a,($C0DB)
	cp	0
	jr	z,loc_50_41CC
	dec	a

loc_50_41CC:
	ld	($C704),a
	ret

sub_50_41D0:			; play time
	push	hl
	ld	hl,0
	ld	l,a
	ld	bc,$A
	call	$A95
	add	a,$8C		; 0
	ld	(de),a
	inc	de
	ld	a,l
	add	a,$8C		; 0
	ld	(de),a
	pop	hl
	ret

byte_50_41E5:
	db	$81,$82,$83,$84,$85,$80 ; empty

byte_50_41EA:
	db	$86,$87,$88,$87,$89,$80	; level

sub_50_41EC:
	push	af
	ld	a,($C704)
	add	a,a
	ld	hl,word_50_4202
	call	$A59
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	bc,$1401
	pop	af
	call	$507
	ret

word_50_4202:			; 3 selector entries
	dw $9C20
	dw $9C40
	dw $9C60

sub_50_4208:
	ld	a,($FF8B)
	and	1
	jp	nz,loc_50_4249
	ld	a,($FF8B)
	and	2
	jp	nz,loc_50_425C
	ld	a,($FF8B)
	and	$80
	jp	nz,loc_50_422F
	ld	a,($FF8B)
	and	$40
	ret	z
	ld	a,($C704)
	and	a
	jp	nz,loc_50_422B
	ld	a,3

loc_50_422B:
	dec	a
	jp	loc_50_4239

loc_50_422F:
	ld	a,($C704)
	inc	a
	cp	3
	jp	nz,loc_50_4239
	xor	a

loc_50_4239:
	push	af
	ld	a,$E
	call	sub_50_41EC
	pop	af
	ld	($C704),a
	ld	a,$F
	call	sub_50_41EC
	ret

loc_50_4249:
	ld	a,($C704)
	call	$831
	ld	a,($C704)
	inc	a
	ld	($C0DB),a
	ld	a,2
	ld	($C703),a
	ret

loc_50_425C:
	call	$3E5
	ld	a,$A
	ld	($C702),a
	ld	a,1
	ld	($C703),a
	ret

byte_50_426A:
	libbin	gfx/save2.chr

byte_50_4A6A:
	libbin	gfx/save1.chr

byte_50_526A:
	libbin	gfx/save3.chr

byte_50_5A6A:
	db	$00,$00,$00,$00,$00,$00,$00,$00,$18,$18,$0E,$0E,$0B,$0F,$35,$3F
	db	$00,$00,$00,$00,$00,$00,$00,$00,$30,$30,$E0,$E0,$A0,$E0,$58,$F8
	db	$44,$7F,$80,$FF,$4C,$7F,$92,$FF,$BF,$E5,$BF,$E5,$9E,$F3,$8D,$FF
	db	$44,$FC,$2E,$FE,$74,$FC,$92,$FE,$FA,$4E,$FA,$4E,$F2,$9E,$72,$FE
	db	$43,$7F,$55,$7F,$68,$7F,$95,$FF,$6A,$6A,$00,$00,$00,$00,$00,$00
	db	$9A,$FE,$6C,$FC,$14,$FC,$B2,$FE,$6C,$6C,$00,$00,$00,$00,$00,$00
	db	$00,$00,$1C,$1C,$0A,$0E,$3D,$3F,$44,$7F,$80,$FF,$4C,$7F,$9E,$F3
	db	$00,$00,$70,$70,$A0,$E0,$78,$F8,$44,$FC,$2E,$FE,$74,$FC,$F2,$9E
	db	$BF,$E5,$BF,$E5,$9E,$F3,$8C,$FF,$81,$FF,$4B,$7F,$4D,$7F,$50,$7F
	db	$FA,$4E,$FA,$4E,$F2,$9E,$72,$FE,$32,$FE,$D2,$FE,$7A,$FE,$14,$FC
	db	$28,$3F,$29,$3F,$15,$1F,$1D,$1F,$15,$17,$02,$02,$00,$00,$00,$00
	db	$04,$FC,$14,$FC,$58,$F8,$58,$F8,$60,$E0,$A0,$A0,$80,$80,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

byte_50_5C6A:
	libbin	gfx/selector.chr

byte_50_5E6A:
	libbin	gfx/save.pal
	db	$FF,$7F,$EF,$3D,$E7,$18,$00,$00,$FF,$7F,$EF,$3D,$E7,$18,$00,$7C

byte_50_5EAA:
	db	$00,$00,$FF,$7F,$B9,$01,$21,$04,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

unk_50_5EEA:
	db	2
	db	3
	db	0
	db	0
	db	1
	db	0
	db	2
	db	0
	db	3
	db	0
	db	4
	db	0
	db	5
	db	0

unk_50_5EF8:
	db	2
	db	3
	db	6
	db	0
	db	7
	db	0
	db	8
	db	0
	db	9
	db	0
	db	10
	db	0
	db	11
	db	0

byte_50_5F06:
	db	$14
	db	$12
	libbin	gfx/save.map

byte_50_6070:
	db	$14
	db	$12
	libbin	gfx/save.atr

byte_50_61DA:			; selector map
	db	$14
	db	5
	db	$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
	db	$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
	db	$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
	db	$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
	db	$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80

byte_50_6240:			; selector atr
	db	$14
	db	5
	db	$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
	db	$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
	db	$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
	db	$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
	db	$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E

sub_50_62A6:
	ld	a,($C233)
	add	a,a
	ld	hl,$D0E2
	call	$A59
	push	hl
	ld	a,(hl+)
	ld	e,(hl)
	ld	h,a
	ld	l,0
	ld	b,e
	ld	c,0
	call	$A95
	ld	d,a
	ld	b,0
	ld	c,e
	call	$A95
	ld	e,a
	ld	a,($C0DD)
	ld	l,a
	ld	a,($C0DE)
	cp	l
	jp	nc,loc_50_62D3
	ld	a,l
	ld	($C0DD),a

loc_50_62D3:
	ld	a,($C0DD)
	ld	h,a
	ld	l,0
	ld	a,($C0DE)
	ld	b,a
	ld	c,0
	call	$A95
	push	af
	ld	a,($C0DE)
	ld	b,0
	ld	c,a
	call	$A95
	ld	c,a
	pop	af
	ld	b,a
	pop	hl
	ld	a,b
	cp	d
	jp	c,loc_50_6305
	jp	nz,loc_50_62FD
	ld	a,c
	cp	e
	jp	c,loc_50_6305

loc_50_62FD:
	ld	a,($C0DD)
	ld	(hl+),a
	ld	a,($C0DE)
	ld	(hl),a

loc_50_6305:
	ld	a,($C0DF)
	ld	h,a
	ld	a,($C0E0)
	ld	l,a
	ld	a,($C0DD)
	call	$A59
	ld	a,h
	ld	($C0DF),a
	ld	a,l
	ld	($C0E0),a
	ld	a,($C0E1)
	ld	h,a
	ld	a,($C0E2)
	ld	l,a
	ld	a,($C0DE)
	call	$A59
	ld	a,h
	ld	($C0E1),a
	ld	a,l
	ld	($C0E2),a
	ld	a,($C233)
	cp	5
	jp	nz,locret_50_637C
	ld	a,($D0EE)
	ld	h,a
	ld	a,($D0EF)
	ld	l,a
	ld	a,($D0F0)
	ld	b,a
	ld	a,($D0F1)
	ld	c,a
	call	$B14
	ld	d,a
	ld	a,($C0DF)
	ld	h,a
	ld	a,($C0E0)
	ld	l,a
	ld	a,($C0E1)
	ld	b,a
	ld	a,($C0E2)
	ld	c,a
	call	$B14
	cp	d
	jp	c,locret_50_637C
	ld	a,($C0DF)
	ld	($D0EE),a
	ld	a,($C0E0)
	ld	($D0EF),a
	ld	a,($C0E1)
	ld	($D0F0),a
	ld	a,($C0E2)
	ld	($D0F1),a

locret_50_637C:
	ret
