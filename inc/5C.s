	call	sub_5C_44AD
	ld	de,map_5C_opt15
	ld	hl,$9800
	call	$48F
	ld	de,atr_5C_common
	ld	hl,$9800
	call	$4D5
	call	sub_5C_4030
	call	$2FD

loc_5C_401B:
	call	$1F4
	ld	a,($FF8B)
	and	2
	jp	z,loc_5C_401B
	ld	a,4
	ld	($DD01),a
	ld	a,4
	ld	($C232),a
	ret

sub_5C_4030:			; fight	ratio,percents
	call	sub_5C_403A
	call	sub_5C_4067
	call	sub_5C_407F
	ret

sub_5C_403A:
	ld	hl,$98AC
	ld	b,0

loc_5C_403F:
	push	bc
	push	hl
	ld	a,b
	add	a,a
	ld	de,$D0E2
	call	$A6D
	ld	a,(de)
	ld	h,0
	ld	l,a
	inc	de
	ld	a,(de)
	ld	b,0
	ld	c,a
	call	$B14
	pop	hl
	call	sub_5C_40B1
	ld	a,$20 		; next line
	call	$A59
	pop	bc
	inc	b
	ld	a,b
	cp	6		; 6 stages
	jp	nz,loc_5C_403F
	ret

sub_5C_4067:
	ld	de,$D0EE	; fight	ratio,total
	ld	a,(de)
	ld	h,a
	inc	de
	ld	a,(de)
	ld	l,a
	inc	de
	ld	a,(de)
	ld	b,a
	inc	de
	ld	a,(de)
	ld	c,a
	call	$B14
	ld	hl,$998C
	call	sub_5C_40B1
	ret

sub_5C_407F:
	ld	hl,0		; fight	ratio,total best
	ld	de,$D0E2
	ld	b,6

loc_5C_4087:
	ld	a,(de)
	call	$A59
	inc	de
	inc	de
	dec	b
	jp	nz,loc_5C_4087
	push	hl
	ld	hl,0
	ld	de,$D0E2
	ld	b,6

loc_5C_409A:
	inc	de
	ld	a,(de)
	call	$A59
	inc	de
	dec	b
	jp	nz,loc_5C_409A
	push	hl
	pop	bc
	pop	hl
	call	$B14
	ld	hl,$99CC
	call	sub_5C_40B1
	ret

sub_5C_40B1:
	push	hl
	push	af
	cp	$5A
	jp	c,loc_5C_40C0
	ld	a,2
	ld	bc,$401		; hilight? 100% - 4 chars, 1 line, was $502
	call	$507

loc_5C_40C0:
	pop	af
	push	hl
	ld	h,0
	ld	l,a
	ld	b,0
	ld	c,$64
	call	$A95
	ld	d,a
	ld	b,0
	ld	c,$A
	call	$A95
	ld	e,a
	ld	a,l
	pop	hl
	push	af
	ld	a,d
;	add	a,a
	ld	bc,unk_5C_4147	; 1-9
	call	$A81
	ld	a,(bc)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	bc
;	ld	a,(bc)
;	call	$404
;	ld	a,$20
;	call	$A61
	inc	hl
	ld	a,e
;	add	a,a
	push	af
	ld	bc,unk_5C_4147	; 1-9
	ld	a,d
	cp	0
	jp	z,loc_5C_4103
	ld	bc,unk_5C_4133	; 0-9

loc_5C_4103:
	pop	af
	call	$A81
	ld	a,(bc)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	bc
;	ld	a,(bc)
;	call	$404
;	ld	a,$20
;	call	$A61
	inc	hl
	pop	af
;	add	a,a
	ld	bc,unk_5C_4133	; 0-9
	call	$A81
	ld	a,(bc)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	bc
;	ld	a,(bc)
;	call	$404
	pop	hl
	ret

unk_5C_4133:
	db	$0A		; 0-9
	db	1
	db	2
	db	3
	db	4
	db	5
	db	6
	db	7
	db	8
	db	9

unk_5C_4147:
	db	0		; 1-9
	db	1
	db	2
	db	3
	db	4
	db	5
	db	6
	db	7
	db	8
	db	9

loc_5C_415B:
	push	hl
	push	hl
	ld	h,0
	ld	l,a
	ld	b,0
	ld	c,$64
	call	$A95
	ld	d,a
	ld	b,0
	ld	c,$A
	call	$A95
	ld	e,a
	ld	a,l
	pop	hl
	push	af
	ld	a,d
;	add	a,a
	ld	bc,unk_5C_4147	; 1-9
	call	$A81
	ld	a,(bc)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	bc
;	ld	a,(bc)
;	call	$404
;	ld	a,$20
;	call	$A61
	inc	hl
	ld	a,e
;	add	a,a
	push	af
	ld	bc,unk_5C_4147	; 1-9
	ld	a,d
	cp	0
	jp	z,loc_5C_419E
	ld	bc,unk_5C_4133	; 0-9

loc_5C_419E:
	pop	af
	call	$A81
	ld	a,(bc)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	bc
;	ld	a,(bc)
;	call	$404
;	ld	a,$20
;	call	$A61
	inc	hl
	pop	af
;	add	a,a
	ld	bc,unk_5C_4133	; 0-9
	call	$A81
	ld	a,(bc)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	bc
;	ld	a,(bc)
;	call	$404
	pop	hl
	ret

sub_5C_41CE:
	call	sub_5C_44AD	; referenced from bank 0 at 1CC1
	ld	de,map_5C_opt16
	ld	hl,$9800
	call	$48F
	ld	de,atr_5C_common
	ld	hl,$9800
	call	$4D5
	call	sub_5C_4201
	call	sub_5C_4298
	call	$2FD

loc_5C_41EC:
	call	$1F4
	ld	a,($FF8B)
	and	2
	jp	z,loc_5C_41EC
	ld	a,4
	ld	($DD01),a
	ld	a,4
	ld	($C232),a
	ret

sub_5C_4201:
	ld	b,0
	ld	de,$D0F2
	ld	hl,$C700

loc_5C_4209:
	ld	a,b
	ld	(hl+),a
	push	bc
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	inc	de
	ld	(hl),b
	inc	hl
	ld	(hl),c
	inc	hl
	pop	bc
	ld	a,b
	inc	a
	ld	b,a
	cp	6
	jp	nz,loc_5C_4209
	ld	b,0

loc_5C_4221:
	push	bc
	ld	a,b
	add	a,a
	add	a,b
	ld	hl,$C700
	call	$A59
	ld	a,b
	inc	a
	ld	c,a

loc_5C_422E:
	push	bc
	ld	a,c
	add	a,a
	add	a,c
	ld	de,$C700
	call	$A6D
	push	hl
	push	de
	inc	hl
	inc	de
	ld	b,(hl)
	ld	a,(de)
	cp	b
	jp	c,loc_5C_4258
	jp	nz,loc_5C_4250
	inc	hl
	inc	de
	ld	b,(hl)
	ld	a,(de)
	cp	b
	jp	c,loc_5C_4258
	jp	z,loc_5C_4258

loc_5C_4250:
	pop	de
	pop	hl
	call	sub_5C_426D
	jp	loc_5C_425A

loc_5C_4258:
	pop	de
	pop	hl

loc_5C_425A:
	pop	bc
	ld	a,c
	inc	a
	ld	c,a
	cp	6
	jp	nz,loc_5C_422E
	pop	bc
	ld	a,b
	inc	a
	ld	b,a
	cp	5
	jp	nz,loc_5C_4221
	ret

sub_5C_426D:
	push	hl
	push	de
	push	bc
	ld	bc,$C712
	push	hl
	ld	a,(hl+)
	ld	(bc),a
	inc	bc
	ld	a,(hl+)
	ld	(bc),a
	inc	bc
	ld	a,(hl+)
	ld	(bc),a
	pop	hl
	push	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	pop	de
	ld	bc,$C712
	ld	a,(bc)
	ld	(de),a
	inc	bc
	inc	de
	ld	a,(bc)
	ld	(de),a
	inc	bc
	inc	de
	ld	a,(bc)
	ld	(de),a
	pop	bc
	pop	de
	pop	hl
	ret

sub_5C_4298:
	call	sub_5C_42AB
	call	sub_5C_42E6	; performance,times played
	call	sub_5C_4311
	call	sub_5C_43CC
	call	sub_5C_447B	; performance,percents
	call	sub_5C_449B	; performance,total percents
	ret

sub_5C_42AB:
	ld	de,$C700
	ld	hl,$9861
	ld	b,0

loc_5C_42B3:
	push	bc
	ld	a,(de)
	push	de
	add	a,a
	ld	de,off_5C_42DA
	call	$A6D
	ld	a,(de)
	inc	de
	push	af
	ld	a,(de)
	ld	d,a
	pop	af
	ld	e,a
	call	$48F
	pop	de
	inc	de
	inc	de
	inc	de
	ld	a,$40
	call	$A59
	pop	bc
	ld	a,b
	inc	a
	ld	b,a
	cp	6
	jp	nz,loc_5C_42B3
	ret

off_5C_42DA:	
	dw 	unk_5C_55FF	; basara
	dw	unk_5C_5613	; mylene
	dw	unk_5C_5627	; ray & vef
	dw	unk_5C_563B     ; gamlin
	dw	unk_5C_564F	; max
	dw	unk_5C_5663	; milia


sub_5C_42E6:			; performance,times played
	ld	hl,$9889
	ld	b,0

loc_5C_42EB:
	push	bc
	ld	a,b
	add	a,a
	add	a,b
	inc	a
	ld	de,$C700
	call	$A6D
	push	de
	ld	a,(de)
	push	af
	inc	de
	ld	a,(de)
	ld	e,a
	pop	af
	ld	d,a
	call	sub_5C_4355
	pop	de
	ld	a,$40
	call	$A59
	pop	bc
	ld	a,b
	inc	a
	ld	b,a
	cp	6
	jp	nz,loc_5C_42EB
	ret

sub_5C_4311:
	ld	hl,0
	ld	b,0

loc_5C_4316:
	push	bc
	ld	a,b
	add	a,a
	add	a,b
	inc	a
	ld	de,$C700
	call	$A6D
	push	de
	ld	a,(de)
	push	af
	inc	de
	ld	a,(de)
	ld	e,a
	pop	af
	ld	d,a
	add	hl,de
	pop	de
	pop	bc
	ld	a,b
	inc	a
	ld	b,a
	cp	6
	jp	nz,loc_5C_4316
	push	hl
	pop	de
	ld	a,d
	ld	($C715),a
	ld	a,e
	ld	($C716),a
	ld	a,d
	cp	3
	jr	c,loc_5C_434E
	jr	nz,loc_5C_434A
	ld	a,e
	cp	$E8
	jr	c,loc_5C_434E

loc_5C_434A:
	ld	d,3
	ld	e,$E7

loc_5C_434E:
	ld	hl,$9A29	; performance,total played
	call	sub_5C_4355
	ret

sub_5C_4355:
	push	hl
	push	hl
	ld	h,d
	ld	l,e
	ld	b,0
	ld	c,$64
	call	$A95
	ld	d,a
	ld	b,0
	ld	c,$A
	call	$A95
	ld	e,a
	ld	a,l
	pop	hl
	push	af
	ld	a,d
;	add	a,a
	ld	bc,unk_5C_4147	; 1-9
	call	$A81
	ld	a,(bc)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	bc
;	ld	a,(bc)
;	call	$404
;	ld	a,$20
;	call	$A61
	inc	hl
	ld	a,e
;	add	a,a
	push	af
	ld	bc,unk_5C_4147	; 1-9
	ld	a,d
	cp	0
	jp	z,loc_5C_4397
	ld	bc,unk_5C_4133	; 0-9

loc_5C_4397:
	pop	af
	call	$A81
	ld	a,(bc)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	bc
;	ld	a,(bc)
;	call	$404
;	ld	a,$20
;	call	$A61
	inc	hl
	pop	af
;	add	a,a
	ld	bc,unk_5C_4133	; 0-9
	call	$A81
	ld	a,(bc)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	bc
;	ld	a,(bc)
;	call	$404
;	ld	a,$20
;	call	$A61
	pop	hl
	ret

sub_5C_43CC:
	ld	hl,$C717
	ld	b,0

loc_5C_43D1:
	push	bc
	push	hl
	ld	a,b
	add	a,a
	add	a,b
	inc	a
	ld	de,$C700
	call	$A6D
	push	de
	ld	a,(de)
	push	af
	inc	de
	ld	a,(de)
	ld	l,a
	pop	af
	ld	h,a
	ld	a,($C715)
	ld	b,a
	ld	a,($C716)
	ld	c,a
	call	$B3F
	pop	de
	pop	hl
	ld	(hl+),a
	pop	bc
	ld	a,b
	inc	a
	ld	b,a
	cp	6
	jp	nz,loc_5C_43D1
	ld	b,0
	ld	h,0

loc_5C_4400:
	push	bc
	ld	a,b
	ld	de,$C717
	call	$A6D
	ld	a,(de)
	add	a,h
	ld	h,a
	pop	bc
	ld	a,b
	inc	a
	ld	b,a
	cp	6
	jp	nz,loc_5C_4400
	ld	a,h
	sub	$64
	jp	z,locret_5C_442D
	jp	c,loc_5C_4423
	call	sub_5C_442E
	jp	locret_5C_442D

loc_5C_4423:
	cpl
	inc	a
	cp	$64
	jp	z,locret_5C_442D
	call	sub_5C_4457

locret_5C_442D:
	ret

sub_5C_442E:
	ld	h,a
	ld	b,0

loc_5C_4431:
	push	bc
	ld	a,b
	ld	de,$C71C
	call	$A75
	ld	a,(de)
	cp	1
	jp	c,loc_5C_4442
	dec	a
	ld	(de),a
	dec	h

loc_5C_4442:
	pop	bc
	ld	a,h
	cp	0
	jp	z,locret_5C_4456
	inc	b
	ld	a,b
	cp	6
	jp	nz,loc_5C_4431
	ld	a,h
	cp	0
	jp	nz,sub_5C_442E

locret_5C_4456:
	ret

sub_5C_4457:
	ld	h,a
	ld	b,0

loc_5C_445A:
	push	bc
	ld	a,b
	ld	de,$C717
	call	$A6D
	ld	a,(de)
	inc	a
	ld	(de),a
	dec	h
	pop	bc
	ld	a,h
	cp	0
	jp	z,locret_5C_447A
	inc	b
	ld	a,b
	cp	6
	jp	nz,loc_5C_445A
	ld	a,h
	cp	0
	jp	nz,sub_5C_4457

locret_5C_447A:
	ret

sub_5C_447B:			; performance,percents
	ld	hl,$988F
	ld	b,0

loc_5C_4480:
	push	bc
	ld	a,b
	ld	de,$C717
	call	$A6D
	ld	a,(de)
	call	loc_5C_415B
	ld	a,$40
	call	$A59
	pop	bc
	ld	a,b
	inc	a
	ld	b,a
	cp	6
	jp	nz,loc_5C_4480
	ret

sub_5C_449B:			; performance,total percents
	ld	de,$C717
	ld	a,(de)
	cp	0
	jp	z,loc_5C_44A6
	ld	a,$64

loc_5C_44A6:
	ld	hl,$9A2F
	call	loc_5C_415B
	ret

sub_5C_44AD:
	call	$2D6
	ld	a,0
	ld	($FF40),a
	call	$B7D
	call	$527
	ld	hl,$C700
	ld	bc,$100
	call	$30C
	ld	hl,chr_5C_09000
	ld	de,$9000
	ld	bc,$800
	call	$44A
;	ld	hl,chr_5C_08800
;	ld	de,$8800
;	ld	bc,$600
;	call	$44A
	ld	hl,pal_5C_bg
	ld	de,$C100
	ld	bc,$40
	call	$44A
	call	$343
	ret

chr_5C_09000:	
	libbin	gfx/opt15-16.chr
;chr_5C_08800:	

pal_5C_bg:
	dw	$7FFF,$0000,$7EE1,$7FFF,$7FFF,$0000,$7EE1,$5294
	dw	$7FFF,$0000,$7EE1,$033E,$0000,$0000,$0000,$0000
	dw	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

map_5C_opt15:
	db	$14
	db	$12
	libbin	gfx/opt15.map

map_5C_opt16:
	db	$14
	db	$12
	libbin	gfx/opt16.map

unk_5C_55FF:
	db	7		; basara
	db	1
	db	$1D,$17,$1E,$17,$25,$17,$0C

unk_5C_5613:
	db	7		; mylene
	db	1
	db	$29,$2A,$1C,$19,$2B,$19,$0C

unk_5C_5627:
	db	15		; ray & veffidas
	db	1
	db	$2C,$17,$2A,$00,$2D,$00,$2E,$19,$2F,$2F,$26,$30,$17,$1E,$0C

unk_5C_563B:
	db	7		; gamlin
	db	1
	db	$31,$17,$27,$1C,$26,$2B,$0C

unk_5C_564F:
	db	4		; max
	db	1
	db	$29,$17,$32,$0C

unk_5C_5663:
	db	6		; milia
	db	1
	db	$29,$26,$1C,$26,$17,$0C

atr_5C_common:
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
