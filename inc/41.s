	xor	a
	ld	($DD01),a
	call	$1F4
	ld	a,$7F
	ld	($C0E6),a
	ld	a,2
	ld	($DD00),a
	call	sub_41_4390
	call	sub_41_4176
	call	$2FD

loc_41_401A:
	call	$1F4
	ld	a,($FF8B)
	and	8
	jr	nz,loc_41_402D
	call	sub_41_419E
	ld	a,($C707)
	and	a
	jp	z,loc_41_401A

loc_41_402D:
	ld	a,($D001)
	add	a,$14
	ld	hl,$D048
	call	$A59
	ld	(hl),1
	ld	a,1
	ld	($D027),a
	call	$36D
	ret
; ---------------------------------------------------------------------------
	call	$2D6		; $4043
	ld	a,$40
	ld	($FF40),a
	xor	a
	ld	($C205),a
	ld	($C206),a
	call	$B7D
	call	$527
	ld	hl,$C700
	ld	bc,$E0
	call	$30C
	call	sub_41_40E6
	call	$395
	call	sub_41_4176
	call	$2FD

loc_41_406C:
	call	$1F4
	ld	a,($FF8B)
	and	8
	jr	nz,loc_41_408C
	ld	a,($FF8B)
	and	2
	jr	z,loc_41_4082
	ld	a,1
	ld	($C7E0),a
	jr	loc_41_408C

loc_41_4082:
	call	sub_41_419E
	ld	a,($C707)
	and	a
	jp	z,loc_41_406C

loc_41_408C:
	call	$36D
	ld	a,$1E
	ld	($C0C9),a
	jp	$912
; ---------------------------------------------------------------------------
	call	$2D6		; $4097
	ld	a,$40
	ld	($FF40),a
	xor	a
	ld	($C205),a
	ld	a,$E0
	ld	($C206),a
	call	$B7D
	call	$527
	call	sub_41_412A
	call	sub_41_40C2
	call	$2FD

loc_41_40B6:
	call	$1F4
	ld	a,($FF8B)
	and	$B
	jr	z,loc_41_40B6
	jp	$912

sub_41_40C2:
	ld	hl,$8FF0
	ld	b,$10
	ld	a,$FF

loc_41_40C9:
	ld	(hl+),a
	dec	b
	jp	nz,loc_41_40C9
	ld	a,$FF
	ld	b,$14
	ld	c,$16
	ld	hl,$9940
	call	$4B5
	ld	a,1
	ld	b,$14
	ld	c,$16
	ld	hl,$9940
	jp	$507

sub_41_40E6:
	ld	a,1
	ld	($FF4F),a
	ld	hl,byte_41_5D8E
	ld	de,$9000
	ld	bc,$800
	call	$44A
	xor	a
	ld	($FF4F),a
	ld	hl,byte_41_5D7E
	ld	de,$8000
	ld	bc,$10
	call	$44A
	ld	hl,word_41_76E5
	ld	de,$C140
	ld	bc,$40
	call	$44A
	call	$358
	ld	de,unk_41_658E
	ld	hl,$9940
	call	$48F
	ld	de,unk_41_6630
	ld	hl,$9940
	call	$4D5
	call	sub_41_412A
	ret

sub_41_412A:
	ld	hl,byte_41_6711
	ld	de,$9000
	ld	bc,$800
	call	$44A
	ld	hl,byte_41_6F11
	ld	de,$8C80
	ld	bc,$370
	call	$44A
	ld	a,1
	ld	($FF4F),a
	ld	hl,byte_41_7281
	ld	de,$8C80
	ld	bc,$290
	call	$44A
	xor	a
	ld	($FF4F),a
	ld	hl,word_41_76A5
	ld	de,$C100
	ld	bc,$40
	call	$44A
	call	$343
	ld	de,unk_41_7511
	ld	hl,$9800
	call	$48F
	ld	de,unk_41_75DB
	ld	hl,$9800
	jp	$4D5

sub_41_4176:
	ld	a,($D001)
	add	a,a
	ld	hl,off_41_43B4
	call	$A59
	ld	a,(hl+)
	ld	($C700),a
	ld	a,(hl)
	ld	($C701),a

loc_41_4188:
	ld	a,($D007)
	ld	hl,unk_41_419B
	call	$A59
	ld	a,(hl)
	ld	($C709),a
	ld	a,1
	ld	($C70A),a
	ret

unk_41_419B:
	db	8
	db	4
	db	0

sub_41_419E:
	ld	a,($C708)
	call	$3EC

	dw	loc_41_41B0
	dw	loc_41_41D9
	dw	loc_41_41E4
	dw	loc_41_41FE
	dw	loc_41_4211
	dw	loc_41_4227

loc_41_41B0:
	call	sub_41_4339
	ld	a,(hl+)
	ld	($C702),a
	ld	a,(hl+)
	ld	($C703),a
	ld	a,(hl+)
	ld	($C704),a
	call	sub_41_4342
	ld	a,($C708)
	inc	a
	ld	($C708),a
	ld	a,($C703)
	ld	b,a
	ld	a,($C702)
	ld	c,a
	ld	a,($C704)
	ld	d,a
	call	$38C7
	ret

loc_41_41D9:
	call	sub_41_4309
	ld	a,($C708)
	inc	a
	ld	($C708),a
	ret

loc_41_41E4:
	ld	a,($C70A)
	dec	a
	ld	($C70A),a
	ret	nz
	ld	a,($C709)
	ld	($C70A),a
	and	a
	jp	nz,loc_41_4255
	ld	a,1
	ld	($C70A),a
	jp	loc_41_4237

loc_41_41FE:
	ld	a,($FF8B)
	and	1
	jp	z,loc_41_427F
	call	$B7D
	call	sub_41_436A
	ld	a,2
	ld	($C708),a
	ret

loc_41_4211:
	ld	a,($FF8B)
	and	1
	jp	z,loc_41_427F
	call	$B7D
	call	sub_41_434B
	call	sub_41_436A
	ld	a,0
	ld	($C708),a
	ret

loc_41_4227:
	ld	a,($FF8B)
	and	1
	jp	z,loc_41_427F
	call	$B7D
	ld	a,1
	ld	($C707),a
	ret

loc_41_4237:
	ld	a,1
	ld	($FF4F),a
	call	sub_41_4339

loc_41_423E:
	call	sub_41_42A5
	ld	a,($C70C)
	cp	2
	jp	c,loc_41_423E
	xor	a
	ld	($FF4F),a
	call	sub_41_4342
	ld	a,($C70C)
	jp	loc_41_426E

loc_41_4255:
	ld	a,1
	ld	($FF4F),a
	call	sub_41_4339
	call	sub_41_42A5
	call	sub_41_4342
	xor	a
	ld	($FF4F),a
	ld	a,($C70C)
	cp	2
	jp	nc,loc_41_426E
	ret

loc_41_426E:
	dec	a
	ld	b,a
	ld	a,($C708)
	add	a,b
	ld	($C708),a
	ld	a,$14
	ld	($C70D),a
	jp	loc_41_427F

loc_41_427F:
	call	$B7D
	ld	a,($C70D)
	dec	a
	ld	($C70D),a
	jp	nz,loc_41_4291
	ld	a,$14
	ld	($C70D),a

loc_41_4291:
	cp	$B
	ret	c
	ld	hl,0
	ld	b,$90
	ld	c,$88
	ld	de,unk_41_42A1
	jp	$BBB

unk_41_42A1:
	db	1
	db	1
	db	0
	db	0

sub_41_42A5:
	xor	a
	ld	b,a
	ld	c,(hl)
	inc	hl
	ld	a,c
;	ld	c,(hl)
;	inc	hl
;	ld	b,(hl)
;	inc	hl
;	ld	a,b
	cp	$FE
	jp	z,loc_41_42C5
	cp	$FD
	jp	z,loc_41_42BF
	cp	$FF
	jp	nz,loc_41_42D6
	ld	a,4
	ld	($C70C),a
	ret

loc_41_42BF:
	ld	a,3
	ld	($C70C),a
	ret

loc_41_42C5:
	xor	a
	ld	($C70B),a
	ld	a,($C70C)
	inc	a
	ld	($C70C),a
	cp	2
	ret	z
	jp	sub_41_42A5

loc_41_42D6:
	call	sub_41_42E8
	push	hl
	push	de
	pop	hl
	call	$3875
	pop	hl
	ld	a,($C70B)
	inc	a
	ld	($C70B),a
	ret

sub_41_42E8:
	push	hl
	push	bc
	ld	a,($C70C)
	add	a,a
	ld	hl,unk_41_4305
	call	$A59
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,($C70B)
;	ld	b,$40
	ld	b,$20
	call	$AF2
	add	hl,de
	push	hl
	pop	de
	pop	bc
	pop	hl
	ret

unk_41_4305:
	db	$40
	db	$91
	db	$80
	db	$93

sub_41_4309:
	ld	a,1
	ld	($FF4F),a
	ld	a,($C703)
	add	a,a
	ld	hl,off_41_7725
	call	$A59
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	de,$9000
;	ld	b,5

;loc_41_431F:
;	push	bc
;	ld	c,(hl)
;	inc	hl
;	ld	b,(hl)
;	inc	hl
;	push	hl
;	push	de
;	pop	hl
;	call	$3875
;	pop	hl
;	pop	bc
;	ld	a,$40
;	call	$A6D
;	dec	b
;	jp	nz,loc_41_431F
;	xor	a

	lib	1x1_names.s

	ld	($FF4F),a 	; padding
	ret

sub_41_4339:
	ld	a,($C700)
	ld	l,a
	ld	a,($C701)
	ld	h,a
	ret

sub_41_4342:
	ld	a,l
	ld	($C700),a
	ld	a,h
	ld	($C701),a
	ret

sub_41_434B:
	ld	a,1
	ld	($FF4F),a
	ld	hl,$9000
;	ld	b,5
	ld 	b,20
loc_41_4354:
	push	bc
;	ld	c,$58
;	ld	b,0
;	call	$3875

	ld	c,$20
	ld	b,1
	call	$3A00		; core 1x1 mod

	pop	bc
;	ld	a,$40
	ld	a,$10
	call	$A59
	dec	b
	jp	nz,loc_41_4354
	xor	a
	ld	($FF4F),a
	ret

sub_41_436A:
	ld	a,1
	ld	($FF4F),a
	ld	hl,$9140
;	ld	b,$12
	ld	b,$24

loc_41_4373:
	push	bc
;	ld	c,$58
	ld	c,$20
	ld	b,0
	call	$3875
	pop	bc
;	ld	a,$40
	ld	a,$20
	call	$A59
	dec	b
	jp	nz,loc_41_4373
	xor	a
	ld	($FF4F),a
	xor	a
	ld	($C70B),a
	ld	($C70C),a
	ret

sub_41_4390:
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
	call	sub_41_40E6
	call	$395
	ret

off_41_43B4:
	dw	byte_41_43DA
	dw	byte_41_4525
	dw	byte_41_4665
	dw	byte_41_4837
	dw	byte_41_49FE
	dw	byte_41_4BA1
	dw	byte_41_4CC9
	dw	byte_41_4E4A
	dw	byte_41_4FA9
	dw	byte_41_5113
	dw	byte_41_5230
	dw	byte_41_5357
	dw	byte_41_543F
	dw	byte_41_555C
	dw	byte_41_56A5
	dw	byte_41_5834
	dw	byte_41_59C1
	dw	byte_41_5B3D
	dw	byte_41_5C73

byte_41_43DA:
	lib	script/lvl2/1043b4.txt

byte_41_4525:
	lib	script/lvl2/1043b6.txt

byte_41_4665:
	lib	script/lvl2/1043b8.txt

byte_41_4837:
	lib	script/lvl2/1043ba.txt

byte_41_49FE:
	lib	script/lvl2/1043bc.txt

byte_41_4BA1:
	lib	script/lvl2/1043be.txt

byte_41_4CC9:
	lib	script/lvl2/1043c0.txt

byte_41_4E4A:
	lib	script/lvl2/1043c2.txt

byte_41_4FA9:
	lib	script/lvl2/1043c4.txt

byte_41_5113:
	lib	script/lvl2/1043c6.txt

byte_41_5230:
	lib	script/lvl2/1043c8.txt

byte_41_5357:
	lib	script/lvl2/1043ca.txt

byte_41_543F:
	lib	script/lvl2/1043cc.txt

byte_41_555C:
	lib	script/lvl2/1043ce.txt

byte_41_56A5:
	lib	script/lvl2/1043d0.txt

byte_41_5834:
	lib	script/lvl2/1043d2.txt

byte_41_59C1:
	lib	script/lvl2/1043d4.txt

byte_41_5B3D:
	lib	script/lvl2/1043d6.txt

byte_41_5C73:
	lib	script/lvl2/1043d8.txt

byte_41_5D7E:
	db	$FF,$00,$7E,$00,$3C,$00,$18,$00,$00,$00,$7E,$00,$00,$00,$00,$00

byte_41_5D8E:
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
	db	$FF,$00,$FF,$7F,$FF,$7F,$FF,$7C,$FC,$78,$F8,$70,$F0,$60,$F0,$60
	db	$FF,$00,$FF,$FE,$FF,$FE,$FF,$3E,$3F,$1E,$1F,$0E,$0F,$06,$0F,$06
	db	$F0,$60,$F0,$60,$F0,$60,$F0,$60,$F0,$60,$F0,$60,$F0,$60,$F0,$60
	db	$FF,$00,$FF,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$F0,$60,$F0,$60,$F8,$70,$FC,$78,$FF,$7C,$FF,$7F,$FF,$7F,$FF,$00
	db	$0F,$06,$0F,$06,$1F,$0E,$3F,$1E,$FF,$3E,$FF,$FE,$FF,$FE,$FF,$00
	db	$0F,$06,$0F,$06,$0F,$06,$0F,$06,$0F,$06,$0F,$06,$0F,$06,$0F,$06
	db	$00,$00,$00,$00,$00,$00,$00,$00,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00
	db	$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$00
	db	$80,$00,$80,$00,$80,$00,$80,$00,$80,$00,$80,$00,$80,$00,$80,$00
	db	$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00
	db	$FF,$00,$F8,$00,$E0,$00,$C0,$00,$C0,$00,$80,$00,$80,$00,$80,$00
	db	$FF,$00,$1F,$00,$07,$00,$03,$00,$03,$00,$01,$00,$01,$00,$01,$00
	db	$80,$00,$80,$00,$80,$00,$C0,$00,$C0,$00,$E0,$00,$F8,$00,$FF,$00
	db	$01,$00,$01,$00,$01,$00,$03,$00,$03,$00,$07,$00,$1F,$00,$FF,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

unk_41_658E:
	lib	window.i

unk_41_6630:
	db	$14
	db	8
	db	8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
	db	8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
	db	8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
	db	8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
	db	8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
	db	8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
	db	8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
	db	8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
	db	$80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$8A,$8B,$8C,$8D,$8E,$8F,$90,$91,$92,$93	; ???
	db	$94,$95,$96,$97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F,$A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7
	db	$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB
	db	$BC,$BD,$BE

byte_41_6711:
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$AE,$FF,$5F,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FB,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FA,$FF
	db	$FC,$FF,$FF,$FF,$FF,$FF,$FE,$FF,$FD,$FF,$EA,$FF,$50,$FF,$A3,$FC
	db	$3F,$FF,$F8,$FF,$72,$FD,$8B,$F4,$55,$A8,$3A,$C0,$DF,$00,$F5,$0A
	db	$F2,$FD,$5F,$A0,$F5,$00,$A8,$00,$05,$00,$BF,$00,$EA,$15,$01,$FF
	db	$F5,$00,$A0,$00,$45,$00,$2B,$00,$FE,$01,$D4,$2B,$A2,$5F,$57,$FF
	db	$40,$00,$0A,$00,$57,$00,$FD,$02,$AA,$55,$02,$FF,$AF,$FF,$FF,$FF
	db	$15,$00,$AF,$00,$FA,$05,$55,$AA,$0A,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$7A,$05,$D0,$2F,$AA,$55,$01,$FF,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$82,$7F,$55,$FF,$0B,$FF,$7F,$FF,$F4,$FF,$AB,$FF,$FF,$FF,$FF,$FF
	db	$AA,$FF,$7F,$FF,$FF,$FF,$CB,$FF,$3F,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FD,$FF,$A0,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$D5,$FF,$02,$FF,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$57,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$F5,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FA,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FE,$FF,$FD,$FF,$EA,$FF,$54,$FF,$A2,$FD
	db	$FF,$FF,$FA,$FF,$D5,$FF,$A8,$FF,$55,$EA,$07,$F8,$58,$A0,$AF,$50
	db	$D4,$FF,$A8,$FF,$00,$FF,$55,$AA,$FE,$01,$82,$01,$1D,$02,$80,$7F
	db	$3F,$C0,$00,$FF,$1E,$E1,$40,$BF,$02,$FF,$8F,$7F,$47,$BF,$3F,$FF
	db	$42,$BF,$01,$FF,$05,$FF,$5F,$FF,$3F,$FF,$FD,$FF,$FF,$FF,$FF,$FF
	db	$AB,$FF,$FF,$FF,$FF,$FF,$F7,$FF,$AF,$FF,$52,$EF,$A8,$FF,$FD,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$17,$FF,$2D,$D3
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$F5,$FF,$AA,$FF,$F0,$FF,$55,$FF,$A0,$FF,$02,$FD
	db	$FD,$FF,$AA,$FF,$55,$FF,$A0,$FF,$00,$FF,$00,$FF,$01,$FE,$AE,$50
	db	$55,$FF,$A0,$FF,$02,$FF,$15,$FF,$00,$FF,$00,$FF,$8A,$05,$00,$00
	db	$00,$FF,$05,$FF,$BF,$FF,$56,$FF,$00,$FF,$00,$FF,$AB,$54,$00,$00
	db	$00,$FF,$5F,$FF,$FF,$FF,$AA,$FF,$00,$FF,$2B,$D4,$80,$7F,$7A,$05
	db	$2B,$FF,$FF,$FF,$FF,$FF,$A9,$FF,$AD,$52,$FF,$00,$05,$FA,$00,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$42,$FF,$40,$BF,$FA,$05,$5F,$A0,$05,$FA
	db	$FF,$FF,$FF,$FF,$FF,$FF,$AA,$FF,$55,$FF,$80,$7F,$FF,$00,$05,$FA
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$55,$FF,$AA,$FF,$85,$7F,$60,$9F
	db	$A2,$FD,$FA,$FF,$FF,$FF,$FF,$FF,$7F,$FF,$AA,$FF,$55,$FF,$00,$FF
	db	$5F,$FF,$AA,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$AA,$FF,$55,$FF,$02,$FF
	db	$FF,$FF,$AA,$FF,$50,$FF,$FA,$FF,$FF,$FF,$FF,$FF,$55,$FF,$AA,$FF
	db	$FF,$FF,$AA,$FF,$00,$FF,$A8,$FF,$FF,$FF,$FF,$FF,$55,$FF,$AA,$FF
	db	$FF,$FF,$AA,$FF,$2A,$D5,$01,$FE,$55,$FF,$FF,$FF,$55,$FF,$AA,$FF
	db	$FF,$FF,$AA,$FF,$AA,$55,$E7,$00,$55,$FF,$FF,$FF,$55,$FF,$AA,$FF
	db	$FF,$FF,$AF,$FF,$15,$FF,$AA,$57,$57,$FF,$FF,$FF,$55,$FF,$AA,$FF
	db	$FF,$FF,$FF,$FF,$7F,$FF,$AA,$FF,$FF,$FF,$FF,$FF,$55,$FF,$AA,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$BF,$FF,$FF,$FF,$FF,$FF,$7F,$FF,$AA,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$AA,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$55,$FF,$AA,$FF
	db	$00,$FF,$A0,$5F,$55,$AA,$AA,$55,$FD,$02,$FF,$00,$FF,$00,$FF,$00
	db	$16,$E9,$00,$FF,$54,$AB,$AA,$55,$55,$AA,$FE,$01,$FF,$00,$FF,$00
	db	$FF,$00,$00,$FF,$00,$FF,$AA,$55,$55,$AA,$AA,$55,$FF,$00,$FF,$00
	db	$5E,$A0,$01,$FE,$00,$FF,$A8,$57,$55,$AA,$AA,$55,$FD,$02,$FF,$00
	db	$01,$00,$78,$80,$00,$FF,$00,$FF,$55,$AA,$AA,$55,$55,$AA,$FF,$00
	db	$40,$BF,$3A,$05,$00,$FF,$00,$FF,$40,$BF,$AA,$55,$55,$AA,$AA,$55
	db	$00,$FF,$F3,$00,$2B,$D4,$00,$FF,$00,$FF,$AA,$55,$55,$AA,$AA,$55
	db	$00,$FF,$A8,$57,$37,$00,$00,$FF,$00,$FF,$00,$FF,$55,$AA,$AA,$55
	db	$00,$FF,$00,$FF,$A8,$57,$00,$FF,$00,$FF,$00,$FF,$55,$AA,$AA,$55
	db	$17,$E8,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$55,$AA,$AA,$55
	db	$D8,$27,$02,$FD,$00,$FF,$57,$A8,$00,$FF,$00,$FF,$40,$BF,$AA,$55
	db	$00,$FF,$FF,$00,$00,$FF,$FF,$00,$5D,$A2,$00,$FF,$00,$FF,$AA,$55
	db	$00,$FF,$D2,$2D,$00,$FF,$EA,$15,$00,$FF,$00,$FF,$01,$FE,$AA,$55
	db	$00,$FF,$BF,$40,$05,$FA,$00,$FF,$00,$FF,$00,$FF,$40,$BF,$AA,$55
	db	$00,$FF,$F5,$0A,$40,$BF,$00,$FF,$00,$FF,$00,$FF,$01,$FE,$AA,$55
	db	$01,$FF,$50,$AF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$55,$AA,$AA,$55
	db	$54,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$AA,$55
	db	$55,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$AA,$55
	db	$55,$FF,$A8,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FE,$AA,$55
	db	$55,$FF,$AA,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$55,$AA,$AA,$55
	db	$FF,$00,$FF,$00,$FF,$00,$FF,$00,$57,$00,$AA,$00,$55,$00,$AA,$00
	db	$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$AA,$00,$55,$00,$AA,$00
	db	$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$AA,$00,$55,$00,$AA,$00
	db	$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$BE,$00,$55,$00,$AA,$00
	db	$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$AA,$00,$55,$00,$AA,$00
	db	$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$55,$00,$AA,$00
	db	$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$5F,$00,$AA,$00
	db	$55,$AA,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$AA,$00
	db	$55,$AA,$FA,$05,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$AA,$00
	db	$55,$AA,$FA,$05,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$AA,$00
	db	$55,$AA,$AA,$55,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$AA,$00
	db	$55,$AA,$AA,$55,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00
	db	$55,$AA,$AA,$55,$5F,$A0,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00
	db	$55,$AA,$AA,$55,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00
	db	$55,$AA,$AA,$55,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FA,$00
	db	$55,$AA,$AA,$55,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$AA,$00
	db	$55,$AA,$AA,$55,$D5,$2A,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FA,$00
	db	$55,$AA,$AA,$55,$55,$AA,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$AA,$00
	db	$55,$AA,$AA,$55,$55,$AA,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$AA,$00
	db	$55,$AA,$AA,$55,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$AA,$00
	db	$55,$00,$AA,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$15,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$50,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$05,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$54,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$05,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$55,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$55,$00,$2A,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$55,$00,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$55,$00,$2A,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$55,$00,$AA,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$55,$00,$AA,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$55,$00,$AA,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$55,$00,$AA,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$55,$00,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$55,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$54,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$55,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$55,$00,$AA,$00,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$01,$03,$03,$07,$06,$1F,$FD,$7A,$DB,$F4,$2E,$D1,$F8,$07,$7D,$83
	db	$80,$E0,$6C,$9E,$AA,$DF,$F4,$CF,$FD,$42,$5E,$A1,$2E,$D1,$1E,$E1
	db	$00,$00,$10,$38,$A8,$F6,$8D,$72,$5F,$A0,$2F,$D0,$15,$EA,$42,$FD
	db	$00,$00,$00,$00,$00,$00,$80,$C0,$60,$90,$E0,$1C,$F0,$0F,$B8,$47
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$E0,$A0,$5C
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

byte_41_6F11:
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$01,$03
	db	$00,$00,$00,$01,$05,$03,$0E,$07,$09,$1E,$7B,$34,$42,$FD,$A6,$D9
	db	$38,$70,$FF,$E8,$6F,$F4,$AC,$F3,$47,$F8,$25,$FA,$4A,$F5,$81,$FE
	db	$00,$00,$00,$00,$C0,$00,$F8,$04,$F4,$0B,$FB,$04,$68,$97,$BE,$41
	db	$00,$00,$00,$01,$01,$07,$1C,$0F,$E0,$7F,$06,$FF,$85,$7F,$43,$BF
	db	$F8,$07,$F1,$0F,$E8,$17,$D1,$2F,$A0,$5F,$11,$EF,$20,$FF,$55,$FF
	db	$AF,$D0,$17,$E8,$89,$F6,$44,$FB,$A0,$FF,$C1,$FF,$A2,$FF,$55,$FF
	db	$21,$FE,$50,$FF,$3A,$FF,$5C,$FF,$3A,$FF,$1D,$FF,$AF,$FF,$55,$FF
	db	$10,$EF,$A8,$57,$94,$6F,$48,$F7,$A4,$FF,$51,$FE,$AA,$FD,$50,$FF
	db	$74,$8B,$3E,$C1,$35,$CA,$AA,$55,$D4,$2B,$20,$DF,$0B,$FF,$55,$FF
	db	$00,$87,$8A,$7F,$52,$FF,$B7,$FF,$69,$FF,$F5,$FF,$FB,$FF,$5D,$FF
	db	$00,$E0,$50,$A8,$B4,$4A,$5A,$A5,$3D,$C2,$D7,$A8,$2B,$D4,$14,$FF
	db	$00,$00,$00,$00,$00,$00,$00,$80,$80,$40,$40,$F3,$E2,$7D,$BA,$7F
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$42,$46,$B9,$72,$8F,$A9,$57
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80,$C0,$30,$74,$CB
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$55,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$55,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$03,$55,$FF
	db	$00,$00,$00,$00,$00,$00,$00,$00,$02,$01,$36,$1F,$C3,$FF,$56,$FD
	db	$00,$00,$00,$00,$0D,$07,$3A,$1F,$50,$FF,$A4,$FB,$98,$E7,$A5,$5F
	db	$1D,$3E,$E8,$FF,$15,$FF,$00,$FF,$0B,$FC,$56,$F9,$A4,$FB,$51,$FF
	db	$44,$BB,$60,$9F,$51,$BE,$E2,$7D,$47,$B8,$8D,$72,$6A,$F5,$51,$EF
	db	$02,$FD,$85,$FA,$00,$FF,$01,$FE,$88,$7F,$50,$BF,$68,$BF,$52,$FF
	db	$F6,$09,$7D,$82,$3E,$C1,$7B,$84,$35,$CA,$3A,$C5,$29,$D6,$55,$AA
	db	$A9,$57,$74,$8B,$BE,$41,$D7,$28,$EF,$10,$5B,$A4,$25,$DA,$80,$7F
	db	$AA,$FF,$55,$FF,$00,$FF,$00,$FF,$00,$FF,$08,$F7,$01,$FE,$00,$FF
	db	$AA,$FF,$55,$FF,$00,$FF,$00,$FF,$00,$FF,$10,$EF,$80,$7F,$00,$FF
	db	$AA,$FF,$55,$FF,$00,$FF,$00,$FF,$20,$DF,$00,$FF,$30,$CF,$00,$FF
	db	$AA,$FF,$40,$FF,$10,$EF,$00,$FF,$08,$F7,$42,$BD,$00,$FF,$00,$FF
	db	$AA,$FF,$55,$FF,$00,$FF,$00,$FF,$20,$DF,$04,$FB,$40,$BF,$00,$FF
	db	$AA,$FF,$55,$FF,$80,$7F,$00,$FF,$00,$FF,$44,$BB,$00,$FF,$20,$DF
	db	$AA,$FF,$55,$FF,$00,$FF,$10,$EF,$00,$FF,$00,$FF,$31,$CE,$00,$FF
	db	$AA,$FF,$55,$FF,$00,$FF,$24,$DB,$00,$FF,$02,$FD,$90,$6F,$00,$FF
	db	$AA,$FF,$50,$FF,$00,$FF,$0C,$F3,$00,$FF,$02,$FD,$60,$9F,$04,$FB
	db	$AA,$FF,$00,$FF,$12,$ED,$80,$7F,$00,$FF,$10,$EF,$01,$FE,$00,$FF
	db	$00,$FF,$0C,$F3,$10,$EF,$00,$FF,$08,$F7,$42,$BD,$00,$FF,$00,$FF
	db	$00,$FF,$08,$F7,$00,$FF,$00,$FF,$20,$DF,$04,$FB,$40,$BF,$00,$FF
	db	$AA,$FF,$00,$FF,$88,$77,$00,$FF,$00,$FF,$44,$BB,$00,$FF,$20,$DF
	db	$AA,$FF,$15,$FF,$00,$FF,$10,$EF,$00,$FF,$00,$FF,$31,$CE,$00,$FF
	db	$AA,$FF,$05,$FF,$00,$FF,$24,$DB,$00,$FF,$02,$FD,$90,$6F,$00,$FF
	db	$AA,$FF,$55,$FF,$00,$FF,$0C,$F3,$00,$FF,$02,$FD,$60,$9F,$04,$FB
	db	$AA,$FF,$55,$FF,$12,$ED,$80,$7F,$00,$FF,$10,$EF,$01,$FE,$00,$FF
	db	$AA,$FF,$55,$FF,$00,$FF,$70,$8F,$00,$FF,$0A,$F5,$00,$FF,$00,$FF
	db	$AA,$FF,$55,$FF,$00,$FF,$10,$EF,$00,$FF,$08,$F7,$42,$BD,$00,$FF
	db	$AA,$FF,$55,$FF,$00,$FF,$10,$EF,$00,$FF,$00,$FF,$31,$CE,$00,$FF
	db	$80,$7F,$0C,$F3,$00,$FF,$10,$EF,$80,$7F,$0A,$F4,$D0,$3F,$00,$FF
	db	$0E,$F1,$60,$9F,$06,$F9,$00,$FF,$00,$FF,$A0,$5F,$0D,$F0,$22,$FF
	db	$00,$FF,$05,$FA,$80,$7F,$71,$8E,$00,$FF,$68,$97,$06,$F9,$18,$E7

byte_41_7281:
	db	$18,$E7,$80,$7F,$00,$FF,$54,$8B,$00,$FF,$00,$FF,$8A,$75,$BB,$C0
	db	$90,$6F,$86,$79,$00,$FF,$74,$8B,$00,$FF,$50,$AF,$0F,$F0,$40,$BF
	db	$09,$F6,$00,$FF,$14,$E3,$00,$FF,$03,$FC,$70,$8F,$06,$F8,$12,$FD
	db	$00,$FF,$0C,$F3,$00,$FF,$10,$EF,$80,$7F,$0B,$F4,$C0,$3F,$02,$FF
	db	$0E,$F1,$60,$9F,$06,$F9,$00,$FF,$00,$FF,$50,$2F,$0D,$F0,$01,$FF
	db	$00,$FF,$01,$FE,$00,$FF,$71,$8E,$00,$FF,$B0,$4F,$07,$F8,$00,$FF
	db	$10,$E7,$80,$7F,$00,$FF,$2D,$D2,$00,$FF,$00,$FF,$8A,$75,$BB,$C0
	db	$18,$E7,$80,$7F,$00,$FF,$64,$8B,$00,$FF,$00,$FF,$2D,$D2,$80,$7F
	db	$90,$6F,$02,$F9,$00,$FF,$D4,$2B,$00,$FF,$70,$8F,$06,$F8,$02,$FD
	db	$09,$F6,$00,$FF,$1C,$E3,$00,$FF,$02,$FC,$34,$CB,$D8,$3F,$00,$FF
	db	$00,$FF,$0C,$F3,$00,$FF,$10,$EF,$80,$7F,$03,$FC,$0D,$F0,$23,$FF
	db	$0E,$F1,$E0,$1F,$06,$F9,$00,$FF,$00,$FF,$51,$2E,$04,$FB,$11,$FE
	db	$00,$FF,$11,$EE,$00,$FF,$71,$8E,$00,$FF,$C0,$3F,$1B,$E0,$03,$FF
	db	$18,$E7,$80,$7F,$00,$FF,$2D,$D2,$00,$FF,$00,$FF,$3A,$E5,$00,$FF
	db	$90,$6F,$06,$F9,$00,$FF,$B4,$0B,$01,$FE,$00,$FF,$35,$C2,$18,$E7
	db	$01,$FE,$18,$E7,$80,$7F,$00,$FF,$74,$8B,$00,$FF,$15,$EA,$BB,$40
	db	$00,$FF,$4C,$B3,$00,$FF,$10,$EF,$80,$7F,$2D,$D2,$00,$FF,$A0,$5F
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
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

unk_41_7511:
	db	$14
	db	$A
	db	$00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10,$11,$12,$13
	db	$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,$20,$21,$22,$23,$24,$25,$26,$27
	db	$28,$29,$2A,$2B,$2C,$2D,$2E,$2F,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B
	db	$3C,$3D,$3E,$3F,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F
	db	$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$5B,$5C,$5D,$5E,$5F,$60,$61,$62,$63
	db	$64,$65,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F,$70,$71,$72,$73,$74,$75,$76,$77
	db	$78,$79,$7A,$7B,$7C,$7D,$7E,$7F,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3
	db	$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7
	db	$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF,$F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB
	db	$FC,$FD,$FE,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8

unk_41_75DB:
	db	$14
	db	$A
	db	$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
	db	$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
	db	$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
	db	$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
	db	$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
	db	$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
	db	$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
	db	$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
	db	$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
	db	$06,$06,$06,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E

word_41_76A5:
	dw	$7FFF,$0000,$4210,$1EFF,$0D83,$7FFF,$4210,$03E0
	dw	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw	$7BDE,$6F36,$6A2C,$5547,$7BDE,$36B8,$21AD,$1D27

word_41_76E5:
	dw	$0000,$0000,$4210,$1EFF,$0000,$0000,$0000,$0000
	dw	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw	$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

off_41_7725:
	lib	names.i	; names
; ---------------------------------------------------------------------------
sub_41_77A9:
	xor	a		; $77A9
	ld	($DD01),a
	call	$1F4
	ld	a,$7F
	ld	($C0E6),a
	ld	a,3
	ld	($DD00),a
	call	sub_41_4390
	call	sub_41_7865
	ld	c,0
	ld	d,0
	call	$38C7
	ld	b,8
	ld	c,1
	ld	d,0
	call	$38C7
	ld	a,8
	ld	($C703),a
	ld	hl,byte_41_7873
	ld	a,l
	ld	($C700),a
	ld	a,h
	ld	($C701),a
	call	loc_41_4188
	ld	a,1
	ld	($C708),a
	call	sub_41_78FB
	call	$2FD

loc_41_77EE:
	call	$1F4
	ld	a,($FF8B)
	and	8
	jp	nz,$8B3
	call	sub_41_419E
	ld	a,($C707)
	and	a
	jp	z,loc_41_77EE
	jp	$8B3
; ---------------------------------------------------------------------------
sub_41_7805:
	call	sub_41_4390	; $7805
	ld	b,8
	ld	c,0
	ld	d,0
	call	$38C7
	ld	a,8
	ld	($C703),a
	ld	hl,byte_41_78A9
	ld	a,l
	ld	($C700),a
	ld	a,h
	ld	($C701),a
	call	loc_41_4188
	ld	a,1
	ld	($C708),a
	call	sub_41_78FB
	call	$2FD

loc_41_782F:
	call	$1F4
	call	sub_41_419E
	ld	a,($C707)
	and	a
	jp	z,loc_41_782F
	ld	a,($C70E)
	and	a
	jp	nz,$8F4
	call	$B7D
	call	sub_41_436A
	ld	hl,byte_41_78E7
	ld	a,l
	ld	($C700),a
	ld	a,h
	ld	($C701),a
	ld	a,1
	ld	($C70E),a
	xor	a
	ld	($C707),a
	ld	a,2
	ld	($C708),a
	jp	loc_41_782F

sub_41_7865:
	ld	b,0
	ld	a,($D001)
	cp	$A
	ret	c
	inc	b
	cp	$10
	ret	c
	inc	b
	ret

byte_41_7873:
	lib	script/lvl2/1077d6.txt

byte_41_78A9:
	lib	script/lvl2/107817.txt
;
	lib	script/lvl2/107817_.txt

byte_41_78E7:
	lib	script/lvl2/10784a.txt

sub_41_78FB:
	ld	de,unk_41_790D
	ld	hl,$9C00
	call	$48F
	ld	de,unk_41_6630
	ld	hl,$9C00
	jp	$4D5

unk_41_790D:
	lib	selector.i
