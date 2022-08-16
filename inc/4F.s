; options 1-5
	xor	a
	ld	($DD00),a
	call	$2D6
	ld	a,0
	ld	($FF40),a
	call	$B7D
	call	$527
	ld	hl,$C700
	ld	bc,$100
	call	$30C
	ld	hl,chr_4F_09000
	ld	de,$9000
	ld	bc,1168;$800
	call	$44A
;	ld	hl,chr_4F_08800
;	ld	de,$8800
;	ld	bc,$800
;	call	$44A
;	ld	a,1
;	ld	($FF4F),a
;	ld	hl,chr_4F_19000
;	ld	de,$9000
;	ld	bc,$200
;	call	$44A
;	ld	hl,chr_4F_19400
;	ld	de,$9400
;	ld	bc,$400
;	call	$44A
;	ld	hl,chr_4F_18800
;	ld	de,$8800
;	ld	bc,$800
;	call	$44A
;	xor	a
;	ld	($FF4F),a
	ld	hl,chr_4F_08000	; push start,cursor
	ld	de,$8000
	ld	bc,$200
	call	$44A
	ld	hl,pal_4F_bg
	ld	de,$C100
	ld	bc,$40
	call	$44A
	call	$343
	ld	hl,pal_4F_obj
	ld	de,$C140
	ld	bc,$40
	call	$44A
	call	$358
	ld	a,($C0DC)
	cp	5
	jr	nc,loc_4F_4093
	call	make_4F_selector1
	jr	loc_4F_409B

loc_4F_4093:
	ld	a,5
	ld	($C700),a
	call	make_4F_selector2

loc_4F_409B:
	call	sub_4F_4788
	call	$2FD

loc_4F_40A1:
	call	$1F4
	call	sub_4F_40B0
	ld	a,($C700)
	cp	$FF
	ret	z
	jp	loc_4F_40A1

sub_4F_40B0:
	ld	a,($C700)
	call	$3EC

	dw	loc_4F_40D2
	dw	loc_4F_4114
	dw	loc_4F_4158
	dw	loc_4F_419C
	dw	loc_4F_41E0
	dw	loc_4F_4224
	dw	loc_4F_4263
	dw	loc_4F_426C
	dw	loc_4F_4275
	dw	loc_4F_4280
	dw	loc_4F_428B
	dw	loc_4F_4294
	dw	loc_4F_4302
	dw	loc_4F_4393

loc_4F_40D2:
	ld	a,($FF8B)
	and	1
	jp	z,loc_4F_40EB
	ld	a,($C0DC)
	cp	4
	jp	nc,loc_4F_40EB
	add	a,1
	ld	($C700),a
	ld	a,3
	ld	($DD01),a

loc_4F_40EB:
	ld	a,($FF8B)
	and	2
	jp	z,loc_4F_4100
	ld	a,4
	ld	($DD01),a
	ld	a,$C
	ld	($C700),a
	call	sub_4F_4751
	ret

loc_4F_4100:
	call	sub_4F_4807
	ld	a,($C0DC)
	cp	5
	jp	c,locret_4F_4113
	ld	a,5
	ld	($C700),a
	call	make_4F_selector2

locret_4F_4113:
	ret

loc_4F_4114:
	ld	a,($FF8B)
	and	$10
	jp	z,loc_4F_412C
	ld	a,($D006)
	cp	2
	jp	z,loc_4F_412C
	inc	a
	ld	($D006),a
	ld	a,5
	ld	($DD01),a

loc_4F_412C:
	ld	a,($FF8B)
	and	$20
	jp	z,loc_4F_4144
	ld	a,($D006)
	cp	0
	jp	z,loc_4F_4144
	dec	a
	ld	($D006),a
	ld	a,5
	ld	($DD01),a

loc_4F_4144:
	ld	a,($FF8B)
	and	3
	jp	z,loc_4F_4154
	ld	a,3
	ld	($DD01),a
	xor	a
	ld	($C700),a

loc_4F_4154:
	call	sub_4F_4423
	ret

loc_4F_4158:
	ld	a,($FF8B)
	and	$10
	jp	z,loc_4F_4170
	ld	a,($D007)
	cp	2
	jp	z,loc_4F_4170
	inc	a
	ld	($D007),a
	ld	a,5
	ld	($DD01),a

loc_4F_4170:
	ld	a,($FF8B)
	and	$20
	jp	z,loc_4F_4188
	ld	a,($D007)
	cp	0
	jp	z,loc_4F_4188
	dec	a
	ld	($D007),a
	ld	a,5
	ld	($DD01),a

loc_4F_4188:
	ld	a,($FF8B)
	and	3
	jp	z,loc_4F_4198
	ld	a,3
	ld	($DD01),a
	xor	a
	ld	($C700),a

loc_4F_4198:
	call	sub_4F_4479
	ret

loc_4F_419C:
	ld	a,($FF8B)
	and	$10
	jp	z,loc_4F_41B4
	ld	a,($D008)
	cp	0
	jp	z,loc_4F_41B4
	dec	a
	ld	($D008),a
	ld	a,5
	ld	($DD01),a

loc_4F_41B4:
	ld	a,($FF8B)
	and	$20
	jp	z,loc_4F_41CC
	ld	a,($D008)
	cp	1
	jp	z,loc_4F_41CC
	inc	a
	ld	($D008),a
	ld	a,5
	ld	($DD01),a

loc_4F_41CC:
	ld	a,($FF8B)
	and	3
	jp	z,loc_4F_41DC
	ld	a,3
	ld	($DD01),a
	xor	a
	ld	($C700),a

loc_4F_41DC:
	call	sub_4F_44CF
	ret

loc_4F_41E0:
	ld	a,($FF8B)
	and	$10
	jp	z,loc_4F_41F8
	ld	a,($D009)
	cp	0
	jp	z,loc_4F_41F8
	dec	a
	ld	($D009),a
	ld	a,5
	ld	($DD01),a

loc_4F_41F8:
	ld	a,($FF8B)
	and	$20
	jp	z,loc_4F_4210
	ld	a,($D009)
	cp	1
	jp	z,loc_4F_4210
	inc	a
	ld	($D009),a
	ld	a,5
	ld	($DD01),a

loc_4F_4210:
	ld	a,($FF8B)
	and	3
	jp	z,loc_4F_4220
	ld	a,3
	ld	($DD01),a
	xor	a
	ld	($C700),a

loc_4F_4220:
	call	sub_4F_4521
	ret

loc_4F_4224:
	ld	a,($FF8B)
	and	1
	jp	z,loc_4F_423B
	ld	a,($C0DC)
	cp	6
	jp	c,loc_4F_423B
	ld	($C700),a
	ld	a,3
	ld	($DD01),a

loc_4F_423B:
	ld	a,($FF8B)
	and	2
	jp	z,loc_4F_4250
	ld	a,4
	ld	($DD01),a
	ld	a,$C
	ld	($C700),a
	call	sub_4F_4751
	ret

loc_4F_4250:
	call	sub_4F_4807
	ld	a,($C0DC)
	cp	5
	jp	nc,locret_4F_4262
	xor	a
	ld	($C700),a
	call	make_4F_selector1

locret_4F_4262:
	ret

loc_4F_4263:
	call	$918
	ld	a,$FF
	ld	($C700),a
	ret

loc_4F_426C:
	call	$928
	ld	a,$FF
	ld	($C700),a
	ret

loc_4F_4275:
	ld	a,$FF
	ld	($C700),a
	ld	a,$10
	ld	($C232),a
	ret

loc_4F_4280:
	ld	a,$FF
	ld	($C700),a
	ld	a,$11
	ld	($C232),a
	ret

loc_4F_428B:
	ld	a,$B
	ld	($C700),a
	call	sub_4F_473C
	ret

loc_4F_4294:
	ld	a,($FF8B)
	and	1
	jp	z,loc_4F_42CA
	ld	a,3
	ld	($DD01),a
	ld	a,($C701)
	cp	1
	jp	z,loc_4F_42D6
	ld	a,($C0DB)
	cp	0
	jp	z,loc_4F_42D6
	dec	a
	push	af
	ld	a,$FF
	ld	($D000),a
	pop	af
	call	$831
	xor	a
	ld	($C0DB),a
	ld	a,$FF
	ld	($C700),a
	ld	a,2
	ld	($C232),a
	ret

loc_4F_42CA:
	ld	a,($FF8B)
	and	2
	jp	z,loc_4F_42DF
	ld	a,4
	ld	($DD01),a

loc_4F_42D6:
	ld	a,5
	ld	($C700),a
	call	make_4F_selector2
	ret

loc_4F_42DF:
	ld	a,($FF8B)
	and	$40
	jp	nz,loc_4F_42F4
	ld	a,($FF8B)
	and	$80
	jp	z,locret_4F_4301
	ld	a,1
	ld	($C701),a
	jr	loc_4F_42F9

loc_4F_42F4:
	ld	a,0
	ld	($C701),a

loc_4F_42F9:
	call	sub_4F_47E1
	ld	a,5
	ld	($DD01),a

locret_4F_4301:
	ret

loc_4F_4302:
	ld	a,($FF8B)
	and	1
	jp	z,loc_4F_434B
	ld	a,3
	ld	($DD01),a
	ld	a,($C702)
	cp	0
	jp	z,loc_4F_432C
	ld	a,($C0DB)
	cp	0
	jr	z,loc_4F_4321
	dec	a
	call	$843

loc_4F_4321:
	ld	a,$FF
	ld	($C700),a
	ld	a,$15
	ld	($C232),a
	ret

loc_4F_432C:
	ld	a,($C0DB)
	cp	0
	jr	z,loc_4F_4342
	dec	a
	call	$831
	ld	a,$FF
	ld	($C700),a
	ld	a,$15
	ld	($C232),a
	ret

loc_4F_4342:
	ld	a,$D
	ld	($C700),a
	call	sub_4F_4766
	ret

loc_4F_434B:
	ld	a,($FF8B)
	and	2
	jp	z,loc_4F_4370
	ld	a,4
	ld	($DD01),a
	ld	a,($C0DC)
	cp	5
	jp	nc,loc_4F_4367
	xor	a
	ld	($C700),a
	call	make_4F_selector1
	ret

loc_4F_4367:
	ld	a,5
	ld	($C700),a
	call	make_4F_selector2
	ret

loc_4F_4370:
	ld	a,($FF8B)
	and	$40
	jp	nz,loc_4F_4385
	ld	a,($FF8B)
	and	$80
	jp	z,locret_4F_4392
	ld	a,1
	ld	($C702),a
	jr	loc_4F_438A

loc_4F_4385:
	ld	a,0
	ld	($C702),a

loc_4F_438A:
	call	sub_4F_47E1
	ld	a,5
	ld	($DD01),a

locret_4F_4392:
	ret

loc_4F_4393:
	ld	a,($FF8B)
	and	1
	jp	z,loc_4F_43B7
	ld	a,3
	ld	($DD01),a
	ld	a,($C703)
	inc	a
	ld	($C0DB),a
	ld	a,($C703)
	call	$831
	ld	a,$FF
	ld	($C700),a
	ld	a,$15
	ld	($C232),a
	ret

loc_4F_43B7:
	ld	a,($FF8B)
	and	2
	jp	z,loc_4F_43CC
	ld	a,4
	ld	($DD01),a
	ld	a,$C
	ld	($C700),a
	call	sub_4F_4751
	ret

loc_4F_43CC:
	ld	a,($FF8B)
	and	$40
	jp	nz,loc_4F_43ED
	ld	a,($FF8B)
	and	$80
	jp	z,locret_4F_4406
	ld	a,($C703)
	inc	a
	ld	($C703),a
	cp	3
	jp	nz,loc_4F_43FE
	xor	a
	ld	($C703),a
	jp	loc_4F_43FE

loc_4F_43ED:
	ld	a,($C703)
	dec	a
	ld	($C703),a
	cp	$FF
	jp	nz,loc_4F_43FE
	ld	a,2
	ld	($C703),a

loc_4F_43FE:
	call	sub_4F_4855
	ld	a,5
	ld	($DD01),a

locret_4F_4406:
	ret

make_4F_selector1:
	ld	de,map_4F_opt01
	ld	bc,atr_4F_opt01
	ld	hl,$9800
	call	sub_4F_49D0
	call	sub_4F_4423
	call	sub_4F_4479
	call	sub_4F_44CF
	call	sub_4F_4521
	call	sub_4F_4788
	ret

sub_4F_4423:
	ld	b,0

loc_4F_4425:
	push	bc
	ld	a,0
	ld	($C704),a
	ld	a,($D006)
	cp	b
	jp	nz,loc_4F_4447
	ld	a,($C700)
	cp	0
	jp	z,loc_4F_4442
	ld	a,1
	ld	($C704),a
	jp	loc_4F_4447

loc_4F_4442:
	ld	a,2
	ld	($C704),a

loc_4F_4447:
	ld	a,b
	add	a,a
	push	af
	ld	hl,unk_4F_446D
	call	$A59
	ld	a,(hl+)
	ld	c,(hl)
	ld	b,a
	pop	af
	ld	hl,byte_4F_4473
	call	$A59
	ld	a,(hl+)
	ld	l,(hl)
	ld	h,a
	ld	a,($C704)
	call	$507
	pop	bc
	ld	a,b
	inc	a
	ld	b,a
	cp	3
	jp	nz,loc_4F_4425
	ret

unk_4F_446D:
	db	4		; hard
	db	2		; atr
	db	6		; normal
	db	2
	db	4		; easy
	db	2

byte_4F_4473:
	db	$98		; hard
	db	$A1
	db	$98
	db	$A7
	db	$98
	db	$AF

sub_4F_4479:
	ld	b,0

loc_4F_447B:
	push	bc
	ld	a,0
	ld	($C704),a
	ld	a,($D007)
	cp	b
	jp	nz,loc_4F_449D
	ld	a,($C700)
	cp	0
	jp	z,loc_4F_4498
	ld	a,1
	ld	($C704),a
	jp	loc_4F_449D

loc_4F_4498:
	ld	a,2
	ld	($C704),a

loc_4F_449D:
	ld	a,b
	add	a,a
	push	af
	ld	hl,unk_4F_44C3
	call	$A59
	ld	a,(hl+)
	ld	c,(hl)
	ld	b,a
	pop	af
	ld	hl,unk_4F_44C9
	call	$A59
	ld	a,(hl+)
	ld	l,(hl)
	ld	h,a
	ld	a,($C704)
	call	$507
	pop	bc
	ld	a,b
	inc	a
	ld	b,a
	cp	3
	jp	nz,loc_4F_447B
	ret

unk_4F_44C3:
	db	4		; fast
	db	2
	db	6		; normal
	db	2
	db	4		; slow
	db	2

unk_4F_44C9:
	db	$99
	db	$01
	db	$99
	db	$07
	db	$99
	db	$0F

sub_4F_44CF:
	ld	b,0

loc_4F_44D1:
	push	bc
	ld	a,0
	ld	($C704),a
	ld	a,($D008)
	cp	b
	jp	nz,loc_4F_44F3
	ld	a,($C700)
	cp	0
	jp	z,loc_4F_44EE
	ld	a,1
	ld	($C704),a
	jp	loc_4F_44F3

loc_4F_44EE:
	ld	a,2
	ld	($C704),a

loc_4F_44F3:
	ld	a,b
	add	a,a
	push	af
	ld	hl,unk_4F_4519
	call	$A59
	ld	a,(hl+)
	ld	c,(hl)
	ld	b,a
	pop	af
	ld	hl,byte_4F_451D
	call	$A59
	ld	a,(hl+)
	ld	l,(hl)
	ld	h,a
	ld	a,($C704)
	call	$507
	pop	bc
	ld	a,b
	inc	a
	ld	b,a
	cp	2
	jp	nz,loc_4F_44D1
	ret

unk_4F_4519:
	db	7		; enabled
	db	2
	db	8		; disabled
	db	2

byte_4F_451D:
	db	$99
	db	$6C
	db	$99
	db	$61

sub_4F_4521:
	ld	b,0

loc_4F_4523:
	push	bc
	ld	a,0
	ld	($C704),a
	ld	a,($D009)
	cp	b
	jp	nz,loc_4F_4545
	ld	a,($C700)
	cp	0
	jp	z,loc_4F_4540
	ld	a,1
	ld	($C704),a
	jp	loc_4F_4545

loc_4F_4540:
	ld	a,2
	ld	($C704),a

loc_4F_4545:
	ld	a,b
	add	a,a
	push	af
	ld	hl,unk_4F_456B
	call	$A59
	ld	a,(hl+)
	ld	c,(hl)
	ld	b,a
	pop	af
	ld	hl,unk_4F_456F
	call	$A59
	ld	a,(hl+)
	ld	l,(hl)
	ld	h,a
	ld	a,($C704)
	call	$507
	pop	bc
	ld	a,b
	inc	a
	ld	b,a
	cp	2
	jp	nz,loc_4F_4523
	ret

unk_4F_456B:
	db	6		; manual
	db	2
	db	9		; automatic
	db	2

unk_4F_456F:
	db	$99
	db	$CD
	db	$99
	db	$C1

make_4F_selector2:
	ld	de,map_4F_opt02
	ld	bc,atr_4F_opt02
	ld	hl,$9800
	call	sub_4F_49D0
	ld	a,($C0DB)
	cp	0
	jr	z,loc_4F_4592
	ld	de,map_4F_opt02x
	ld	bc,atr_4F_opt02x
	ld	hl,$99C0
	call	sub_4F_49D0

loc_4F_4592:
	call	sub_4F_45A2
	call	sub_4F_45C4
	call	sub_4F_45E6
	call	sub_4F_4618
	call	sub_4F_4788
	ret

sub_4F_45A2:
	ld	hl,$D00A
	ld	b,$2A
	ld	c,0

loc_4F_45A9:
	ld	a,(hl+)
	and	a
	jp	z,loc_4F_45AF
	inc	c

loc_4F_45AF:
	dec	b
	jp	nz,loc_4F_45A9
	ld	h,0
	ld	l,c
	ld	b,0
	ld	c,$2A
	call	$B14
	ld	hl,$986F
	call	sub_4F_469E
	ret

sub_4F_45C4:
	ld	hl,$D048
	ld	b,$87
	ld	c,0

loc_4F_45CB:
	ld	a,(hl+)
	and	a
	jp	z,loc_4F_45D1
	inc	c

loc_4F_45D1:
	dec	b
	jp	nz,loc_4F_45CB
	ld	h,0
	ld	l,c
	ld	b,0
	ld	c,$87
	call	$B14
	ld	hl,$98AF
	call	sub_4F_469E
	ret

sub_4F_45E6:
	ld	hl,0
	ld	de,$D0E2
	ld	b,6

loc_4F_45EE:
	ld	a,(de)
	call	$A59
	inc	de
	inc	de
	dec	b
	jp	nz,loc_4F_45EE
	push	hl
	ld	hl,0
	ld	de,$D0E2
	ld	b,6

loc_4F_4601:
	inc	de
	ld	a,(de)
	call	$A59
	inc	de
	dec	b
	jp	nz,loc_4F_4601
	push	hl
	pop	bc
	pop	hl
	call	$B14
	ld	hl,$98EF
	call	sub_4F_469E
	ret

sub_4F_4618:			; play time
	ld	hl,$996D
	ld	a,($D005)
	push	hl
	ld	h,0
	ld	l,a
	ld	b,0
	ld	c,$A
	call	$A95
	ld	b,l
;	add	a,a
	ld	de,unk_4F_4728
	call	$A6D
	pop	hl
;	push	hl
	ld	a,(de)		; 1st digit
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	de
;	ld	a,(de)
;	call	$404
;	pop	hl
	inc	hl
	ld	a,b
;	add	a,a
	ld	de,unk_4F_4714
	call	$A6D
;	push	hl
	ld	a,(de)		; 2nd
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	de
;	ld	a,(de)
;	call	$404
;	pop	hl
	inc	hl		; :
	inc	hl
	ld	a,($D004)
	push	hl
	ld	h,0
	ld	l,a
	ld	b,0
	ld	c,$A
	call	$A95
	ld	b,l
;	add	a,a
	ld	de,unk_4F_4714
	call	$A6D
	pop	hl
;	push	hl
	ld	a,(de)		; 3rd
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	de
;	ld	a,(de)
;	call	$404
;	pop	hl
	inc	hl
	ld	a,b
;	add	a,a
	ld	de,unk_4F_4714
	call	$A6D
;	push	hl
	ld	a,(de)		; 4th
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	de
;	ld	a,(de)
;	call	$404
;	pop	hl
	ret

sub_4F_469E:			; percents
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
	ld	bc,unk_4F_4728
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
	ld	bc,unk_4F_4728
	ld	a,d
	cp	0
	jp	z,loc_4F_46E0
	ld	bc,unk_4F_4714

loc_4F_46E0:
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
	ld	bc,unk_4F_4714
	call	$A81
	ld	a,(bc)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	bc
;	ld	a,(bc)
;	call	$404
	ld	a,$20
	call	$A61
	ret

unk_4F_4714:			; numbers 0 - 9 for pal 0
	db	$0A
	db	$01
	db	$02
	db	$03
	db	$04
	db	$05
	db	$06
	db	$07
	db	$08
	db	$09

unk_4F_4728:			; numbers 1 - 9 for pal 0
	db	$00
	db	$01
	db	$02
	db	$03
	db	$04
	db	$05
	db	$06
	db	$07
	db	$08
	db	$09

sub_4F_473C:
	ld	de,map_4F_opt03
	ld	bc,atr_4F_opt_common
	ld	hl,$9800
	call	sub_4F_49D0
	ld	a,1
	ld	($C701),a
	call	sub_4F_47E1
	ret

sub_4F_4751:
	ld	de,map_4F_opt04
	ld	bc,atr_4F_opt_common
	ld	hl,$9800
	call	sub_4F_49D0
	ld	a,0
	ld	($C702),a
	call	sub_4F_47E1
	ret

sub_4F_4766:
	call	$B7D
	ld	de,map_4F_opt05	; save menu
	ld	bc,atr_4F_opt_common
	ld	hl,$9800
	call	sub_4F_49D0
	ld	a,($C0DB)
	cp	0
	jp	z,loc_4F_477E
	dec	a

loc_4F_477E:
	ld	($C703),a
	call	sub_4F_4855
	call	sub_4F_4883
	ret

sub_4F_4788:
	call	$B7D
	ld	a,($C0DC)
	add	a,a
	ld	hl,off_4F_47C0
	call	$A59
	ld	a,(hl+)
	ld	d,(hl)
	ld	e,a
	ld	a,0
	ld	b,a
	ld	a,($C0DC)
	ld	hl,byte_4F_47D6
	call	$A59
	ld	a,(hl)
	ld	c,a
	ld	h,1
	ld	l,0
	call	$BBB
	ret

off_4F_47C0:
	dw	_unk_47AE
	dw	_unk_47AE
	dw	_unk_47AE
	dw	_unk_47AE
	dw	_unk_47B4
	dw	_unk_47BA
	dw	_unk_47AE
	dw	_unk_47AE
	dw	_unk_47AE
	dw	_unk_47AE
	dw	_unk_47AE

_unk_47AE			; tiles used for > selector
	db	1
	db	2
	db	$18
	db	0
	db	$14
	db	0

_unk_47B4
	db	2
	db	1
	db	$13
	db	0
	db	$14
	db	0

_unk_47BA
	db	2
	db	1
	db	$17
	db	0
	db	$18
	db	0

byte_4F_47D6:			; y values for > selector
	db	$1C
	db	$34
	db	$4C
	db	$64
	db	$88
	db	0
	db	$14
	db	$24
	db	$34
	db	$44
	db	$6C

sub_4F_47E1:
	push	af
	call	$B7D
	ld	de,unk_4F_47FB
	ld	b,$08
	pop	af
	ld	hl,unk_4F_4805
	call	$A59
	ld	a,(hl)
	ld	c,a
	ld	h,1
	ld	l,0
	call	$BBB
	ret

unk_4F_47FB:
	db	2		; tiles used for <> selector
	db	2
	db	$17
	db	0
	db	$18
	db	0
	db	$13
	db	0
	db	$14
	db	0

unk_4F_4805:
	db	$44		; y values for <> selector
	db	$54

sub_4F_4807:
	ld	a,($FF8B)
	and	$40
	jp	nz,loc_4F_483D
	ld	a,($FF8B)
	and	$80
	ret	z
	ld	a,($C0DC)
	inc	a
	ld	($C0DC),a
	ld	a,($C0DB)
	cp	0
	jr	nz,loc_4F_482F
	ld	a,($C0DC)
	cp	$A
	jr	nz,loc_4F_484C
	ld	a,9
	ld	($C0DC),a
	jr	loc_4F_484C

loc_4F_482F:
	ld	a,($C0DC)
	cp	$B
	jr	nz,loc_4F_484C
	ld	a,$A
	ld	($C0DC),a
	jr	loc_4F_484C

loc_4F_483D:
	ld	a,($C0DC)
	dec	a
	ld	($C0DC),a
	cp	$FF
	jr	nz,loc_4F_484C
	xor	a
	ld	($C0DC),a

loc_4F_484C:
	call	sub_4F_4788
	ld	a,5
	ld	($DD01),a
	ret

sub_4F_4855:			; save file selector
	ld	b,0
	ld	hl,$9901

loc_4F_485A:
	push	bc
	ld	a,($C703)
	cp	b
	jp	nz,loc_4F_486D
	ld	a,7		; bank/palette for selector bar
	ld	bc,$1201	; b - columns, c - rows
	call	$507
	jp	loc_4F_4875

loc_4F_486D:
	ld	a,0		; bank/palette for not selected row
	ld	bc,$1201
	call	$507

loc_4F_4875:
	ld	a,$40
	call	$A59
	pop	bc
	inc	b
	ld	a,b
	cp	3
	jp	nz,loc_4F_485A
	ret

sub_4F_4883:
	ld	hl,$9905
	ld	de,$C0D2
	ld	b,3

loc_4F_488B:
	push	hl
	push	de
	ld	a,(de)
	cp	$FF
	jp	nz,loc_4F_4899
	call	sub_4F_48AD
	jp	loc_4F_489C

loc_4F_4899:
	call	sub_4F_48C4

loc_4F_489C:
	pop	de
	pop	hl
	ld	a,$40
	call	$A59
	ld	a,3
	call	$A6D
	dec	b
	jp	nz,loc_4F_488B
	ret

sub_4F_48AD:			; write Empty if there's no save
	ld	de,unk_4F_48B4
	call	$48F
	ret

unk_4F_48B4:
	db	5
	db	1
	db	$2E,$29,$1D,$18,$19	; Empty

str_Level:
	db	5
	db	1
	db	$2F,$1A,$22,$1A,$17	; Level

sub_4F_48C4:			; write save details
	push	bc
;	push	hl

	push	de
	ld	de,str_Level
	call	$48F
	pop	de
	ld	a,6
	add	a,l
	jr	nc,_skip
	inc	h
_skip
	ld	l,a
	
	ld	a,(de)		; level
	inc	a
;	add	a,a
	ld	bc,unk_4F_49A8
	call	$A81
	ld	a,(bc)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	bc
;	ld	a,(bc)
;	call	$404
;	pop	hl
	inc	hl

	ld	a,$30		; ,
	call	$404
	inc	hl

;	push	hl
;	ld	a,$5B		; kanji 1/4
;	call	$404
;	inc	hl
;	ld	a,$5C		; kanji 2/4
;	call	$404
;	ld	a,$20
;	call	$A59
;	ld	a,$5E		; kanji 3/4
;	call	$404
;	dec	hl
;	ld	a,$5D		; kanji 4/4
;	call	$404
;	pop	hl
;	inc	hl
;	inc	hl
;	push	hl
;	ld	a,$00		; space
;	call	$404
;	ld	a,$20
;	call	$A59
;	ld	a,$40		; space
;	call	$404
;	pop	hl
;	inc	hl
	inc	de
	ld	a,(de)		; hours
	push	hl
	ld	h,0
	ld	l,a
	ld	b,0
	ld	c,$A
	call	$A95
	ld	b,l
	pop	hl
	push	de
;	add	a,a
	ld	de,unk_4F_49BC
	call	$A6D
;	push	hl
	ld	a,(de)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	de
;	ld	a,(de)
;	call	$404
;	pop	hl
	inc	hl
	ld	a,b
;	add	a,a
	ld	de,unk_4F_49A8
	call	$A6D
;	push	hl
	ld	a,(de)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	de
;	ld	a,(de)
;	call	$404
;	pop	hl
	inc	hl
	pop	de
;	push	hl
	ld	a,$0C
	call	$404
;	ld	a,$20
;	call	$A59
;	ld	a,$5A
;	call	$404
;	pop	hl
	inc	hl
	inc	de
	ld	a,(de)
	push	hl
	ld	h,0
	ld	l,a
	ld	b,0
	ld	c,$A
	call	$A95
	ld	b,l
	pop	hl
	push	de
;	add	a,a
	ld	de,unk_4F_49A8
	call	$A6D
;	push	hl
	ld	a,(de)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	de
;	ld	a,(de)
;	call	$404
;	pop	hl
	inc	hl
	ld	a,b
;	add	a,a
	ld	de,unk_4F_49A8
	call	$A6D
;	push	hl
	ld	a,(de)
	call	$404
;	ld	a,$20
;	call	$A59
;	inc	de
;	ld	a,(de)
;	call	$404
;	pop	hl
	inc	hl
	pop	de
	pop	bc
	ret

unk_4F_49A8:
	db	$0A
	db	$01
	db	$02
	db	$03
	db	$04
	db	$05
	db	$06
	db	$07
	db	$08
	db	$09

unk_4F_49BC:
	db	$00
	db	$01
	db	$02
	db	$03
	db	$04
	db	$05
	db	$06
	db	$07
	db	$08
	db	$09

sub_4F_49D0:
	push	af
	push	bc
	push	de
	push	hl
	ld	a,(de)
	ld	($C705),a
	inc	de
	inc	bc
	ld	a,(de)
	ld	($C706),a
	inc	de
	inc	bc
	ld	a,($C706)

loc_4F_49E3:
	push	af
	push	hl
	ld	a,($C705)

loc_4F_49E8:
	push	af
	ld	a,(de)
	call	$404
	ld	a,(bc)
	call	$411
	inc	de
	inc	bc
	inc	hl
	pop	af
	dec	a
	cp	0
	jp	nz,loc_4F_49E8
	pop	hl
	ld	a,$20
	call	$A59
	pop	af
	dec	a
	jp	nz,loc_4F_49E3
	pop	hl
	pop	de
	pop	bc
	pop	af
	ret

chr_4F_09000:
	libbin	gfx/opt01-05.chr
	libbin	gfx/opt01-05i.chr

chr_4F_08800:
chr_4F_19000:
chr_4F_19400:
chr_4F_18800:
chr_4F_08000:
	db	$7C,$00,$66,$00,$66,$00,$66,$00,$7C,$00,$60,$00,$60,$00,$00,$00
	db	$66,$00,$66,$00,$66,$00,$66,$00,$66,$00,$66,$00,$3C,$00,$00,$00
	db	$3C,$00,$66,$00,$60,$00,$3C,$00,$06,$00,$66,$00,$3C,$00,$00,$00
	db	$66,$00,$66,$00,$66,$00,$7E,$00,$66,$00,$66,$00,$66,$00,$00,$00
	db	$3C,$00,$66,$00,$60,$00,$3C,$00,$06,$00,$66,$00,$3C,$00,$00,$00
	db	$7E,$00,$18,$00,$18,$00,$18,$00,$18,$00,$18,$00,$18,$00,$00,$00
	db	$18,$00,$3C,$00,$66,$00,$66,$00,$7E,$00,$66,$00,$66,$00,$00,$00
	db	$7C,$00,$66,$00,$66,$00,$7C,$00,$66,$00,$66,$00,$66,$00,$00,$00
	db	$7E,$00,$18,$00,$18,$00,$18,$00,$18,$00,$18,$00,$18,$00,$00,$00
	db	$70,$00,$78,$00,$7C,$00,$7E,$00,$7C,$00,$78,$00,$70,$00,$00,$00
	db	$0E,$00,$1C,$00,$38,$00,$70,$00,$38,$00,$1C,$00,$0E,$00,$00,$00
	db	$70,$00,$38,$00,$1C,$00,$0E,$00,$1C,$00,$38,$00,$70,$00,$00,$00
	db	$00,$00,$3C,$00,$7E,$00,$7E,$00,$7E,$00,$7E,$00,$3C,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$18,$24,$3C,$42,$7E,$00
	db	$7E,$00,$3C,$42,$18,$24,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$20,$00,$10,$00,$28,$00,$34,$00,$3A,$00,$3D,$00
	db	$3D,$00,$3A,$00,$34,$00,$28,$00,$10,$00,$20,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$3F,$00,$40,$00,$5F,$00,$5F,$00,$5F,$00
	db	$00,$00,$00,$00,$00,$00,$FC,$00,$02,$00,$FA,$00,$FA,$00,$FA,$00
	db	$5F,$00,$2F,$00,$17,$00,$0B,$00,$05,$00,$02,$00,$01,$00,$00,$00
	db	$FA,$00,$F4,$00,$E8,$00,$D0,$00,$A0,$00,$40,$00,$80,$00,$00,$00
	db	$5F,$00,$5F,$00,$5F,$00,$40,$00,$3F,$00,$00,$00,$00,$00,$00,$00
	db	$FA,$00,$FA,$00,$FA,$00,$02,$00,$FC,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$01,$00,$02,$00,$05,$00,$0B,$00,$17,$00,$2F,$00,$5F,$00
	db	$00,$00,$80,$00,$40,$00,$A0,$00,$D0,$00,$E8,$00,$F4,$00,$FA,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

pal_4F_bg:
	dw	$7FFF,$0000,$7FFF,$0000
	dw	$7FFF,$0000,$7D60,$0000
	dw	$7FFF,$0000,$033E,$0000
	dw	$01FF,$0000,$67DF,$010E
	dw	$7FFF,$0000,$7EE1,$7FFF
	dw	$7FFF,$0000,$7EE1,$5294
	dw	$7FFF,$0000,$7EE1,$033E
	dw	$7FFF,$7D60,$7EE1,$7FFF

pal_4F_obj:
	dw	$0000,$7FFF,$3DEF,$18E7,$0000,$7ACA,$3DEF,$18E7
	dw	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

map_4F_opt01:
	db	$14
	db	$12
	libbin	gfx/opt01.map

map_4F_opt02:
	db	$14
	db	$12
	libbin	gfx/opt02.map

map_4F_opt02x:
	db	$14
	db	2
	libbin	gfx/opt02x.map

map_4F_opt03:
	db	$14
	db	$12
	libbin	gfx/opt03.map

map_4F_opt04:
	db	$14
	db	$12
	libbin	gfx/opt04.map

map_4F_opt05:
	db	$14
	db	$12
	libbin	gfx/opt05.map

atr_4F_opt01:
	db	$14
	db	$12
	db	0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3
	db	3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3
	db	3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db	0, 0, 0, 0, 0, 0, 0, 0

atr_4F_opt_common:	
atr_4F_opt02:
	db	$14
	db	$12
	libbin	gfx/opt02.atr

atr_4F_opt02x:
	db	$14
	db	2
	libbin	gfx/opt02x.atr
