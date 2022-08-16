	xor	a		; $4000
	ld	($C700),a
	ld	($C701),a
	call	$B7D

loc_2C_400A:
	call	$1F4
	call	sub_2C_4042
	ld	a,($C701)
	and	a
	jp	z,loc_2C_400A
	ret
; ---------------------------------------------------------------------------
	xor	a		; $4018
	ld	($C700),a
	ld	($C701),a
	ld	($C703),a

loc_2C_4022:
	call	$1F4
	call	sub_2C_418D
	ld	a,($C701)
	and	a
	jp	z,loc_2C_4022
	jp	loc_2C_4032

loc_2C_4032:
	ld	a,($C703)
	and	a
	ret	z
	ld	b,a

loc_2C_4038:
	push	bc
	call	$C26
	pop	bc
	dec	b
	jp	nz,loc_2C_4038
	ret

sub_2C_4042:
	ld	a,($C700)
	call	$3EC

	dw	loc_2C_4052
	dw	sub_2C_4062
	dw	loc_2C_4094
	dw	loc_2C_40F2
	dw	loc_2C_4108

loc_2C_4052:
	ld	a,1		; remove minor visual glitch (dialog and selector windows have different maps)
	ld	($FF4F),a
	ld	bc,$6C0
	ld	hl,$9000
_wait
	ld	a,($FF41)
	and	2
	jr	nz,_wait

	xor	a
	ld	(hl+),a
	
	dec	bc
	ld	a,b
	or	c
	jr	nz,_wait	
	
	xor	a
	ld	($FF4F),a

	ld	a,7
	ld	($C201),a
	ld	a,$50
	ld	($C203),a
	call	$3D4
	jp	sub_2C_4062

sub_2C_4062:
	ld	de,byte_2C_42CA
	ld	a,3
	ld	($C704),a
	xor	a
	ld	($C705),a
	ld	a,($C233)
	cp	2
	jr	nz,loc_2C_4082
	ld	de,byte_2C_4300
	ld	a,2
	ld	($C704),a
	ld	a,1
	ld	($C705),a

loc_2C_4082:
	call	sub_2C_414E
	xor	a
	ld	($C702),a
	ld	a,9
	call	sub_2C_4171
	ld	a,2
	ld	($C700),a
	ret

loc_2C_4094:
	ld	a,($FF8B)
	and	1
	jp	nz,loc_2C_40D7
	ld	a,($FF8B)
	and	$80
	jp	nz,loc_2C_40B5
	ld	a,($FF8B)
	and	$40
	ret	z
	ld	a,($C702)
	and	a
	jp	nz,loc_2C_40B1
	ld	a,($C704)

loc_2C_40B1:
	dec	a
	jp	loc_2C_40C2

loc_2C_40B5:
	ld	a,($C704)
	ld	b,a
	ld	a,($C702)
	inc	a
	cp	b
	jp	nz,loc_2C_40C2
	xor	a

loc_2C_40C2:
	push	af
	ld	a,8
	call	sub_2C_4171
	pop	af
	ld	($C702),a
	ld	a,9
	call	sub_2C_4171
	ld	a,5
	ld	($DD01),a
	ret

loc_2C_40D7:
	ld	a,($C705)
	ld	b,a
	ld	a,($C702)
	add	a,b
	ld	($C247),a
	ld	a,8
	call	sub_2C_4171
	ld	a,3
	ld	($DD01),a
	ld	a,3
	ld	($C700),a
	ret

loc_2C_40F2:
	ld	de,byte_2C_4336
	call	sub_2C_414E
	ld	a,1
	ld	($C702),a
	ld	a,9
	call	sub_2C_4171
	ld	a,4
	ld	($C700),a
	ret

loc_2C_4108:
	ld	a,($FF8B)
	and	1
	jp	nz,loc_2C_4130
	ld	a,($FF8B)
	and	$C0
	ret	z
	ld	a,($C702)
	dec	a
	xor	1
	inc	a
	push	af
	ld	a,8
	call	sub_2C_4171
	pop	af
	ld	($C702),a
	ld	a,9
	call	sub_2C_4171
	ld	a,5
	ld	($DD01),a
	ret

loc_2C_4130:
	ld	a,3
	ld	($DD01),a
	ld	a,($C702)
	cp	1
	jp	z,loc_2C_4148
	ld	a,8
	call	sub_2C_4171
	ld	a,1
	ld	($C700),a
	ret

loc_2C_4148:
	ld	a,1
	ld	($C701),a
	ret

sub_2C_414E:
	ld	a,1
	ld	($FF4F),a
	ld	hl,$9000
	ld	b,3*18		; 3 lines, 18 characters each

loc_2C_4157:
	push	bc
	ld	a,(de)
	ld	c,a
	inc	de
;	ld	a,(de)
	xor	a
	ld	b,a
;	inc	de
;	push	de
	call	$3875
;	pop	de
	pop	bc
	ld	a,$20
	call	$A59
	dec	b
	jp	nz,loc_2C_4157
	xor	a
	ld	($FF4F),a
	ret

sub_2C_4171:
	push	af
	ld	a,($C702)
	add	a,a
	ld	hl,unk_2C_4187
	call	$A59
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	bc,$1202
	pop	af
	call	$507
	ret

unk_2C_4187:
	dw 	$9C21
	dw 	$9C61
	dw 	$9CA1

sub_2C_418D:
	ld	a,($C700)
	call	$3EC

	dw	loc_2C_419D
	dw	sub_2C_41AD
	dw	loc_2C_41DE
	dw	loc_2C_423A
	dw	loc_2C_4250

loc_2C_419D:
	call	sub_2C_41AD
	ld	a,7
	ld	($C201),a
	ld	a,$50
	ld	($C203),a
	jp	$3D4

sub_2C_41AD:
	ld	a,($C300)
	ld	($C706),a
	ld	a,($C32F)
	ld	($C707),a
	ld	a,($C35E)
	ld	($C708),a
	call	sub_2C_428C
	ld	a,($C703)
	ld	($C702),a
	ld	a,9
	call	sub_2C_4171
	ld	a,($C706)
	ld	b,a
	ld	c,0
	ld	d,0
	call	$38C7
	ld	a,2
	ld	($C700),a
	ret

loc_2C_41DE:
	ld	a,($FF8B)
	and	1
	jp	nz,loc_2C_4229
	ld	a,($FF8B)
	and	$80
	jp	nz,loc_2C_41FE
	ld	a,($FF8B)
	and	$40
	ret	z
	ld	a,($C702)
	and	a
	jp	nz,loc_2C_41FA
	ld	a,3

loc_2C_41FA:
	dec	a
	jp	loc_2C_4208

loc_2C_41FE:
	ld	a,($C702)
	inc	a
	cp	3
	jp	nz,loc_2C_4208
	xor	a

loc_2C_4208:
	push	af
	ld	a,8
	call	sub_2C_4171
	pop	af
	ld	($C702),a
	ld	a,9
	call	sub_2C_4171
	ld	hl,$C706
	ld	a,($C702)
	call	$A59
	ld	b,(hl)
	ld	c,0
	ld	d,0
	call	$38C7
	ret

loc_2C_4229:
	ld	a,($C702)
	ld	($C703),a
	ld	a,8
	call	sub_2C_4171
	ld	a,3
	ld	($C700),a
	ret

loc_2C_423A:
	ld	de,byte_2C_436C
	call	sub_2C_414E
	ld	a,1
	ld	($C702),a
	ld	a,9
	call	sub_2C_4171
	ld	a,4
	ld	($C700),a
	ret

loc_2C_4250:
	ld	a,($FF8B)
	and	1
	jp	nz,loc_2C_4273
	ld	a,($FF8B)
	and	$C0
	ret	z
	ld	a,($C702)
	dec	a
	xor	1
	inc	a
	push	af
	ld	a,8
	call	sub_2C_4171
	pop	af
	ld	($C702),a
	ld	a,9
	call	sub_2C_4171
	ret

loc_2C_4273:
	ld	a,($C702)
	cp	1
	jp	z,loc_2C_4286
	ld	a,8
	call	sub_2C_4171
	ld	a,1
	ld	($C700),a
	ret

loc_2C_4286:
	ld	a,1
	ld	($C701),a
	ret

sub_2C_428C:
	ld	a,1
	ld	($FF4F),a
	ld	hl,$9000
	ld	de,$C706
	ld	b,18
	ld	c,3

loc_2C_429A:
	ld	a,(de)
	inc	de
	push	de
	push	hl
	ld	hl,off_2C_43A2
	add	a,a
	call	$A59
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	pop	hl

loc_2C_42A9:
	push	bc
	ld	a,(de)		; letter
	ld	c,a
	inc	de
;	ld	a,(de)
;	ld	b,a
;	inc	de
	xor	a
	ld	b,a
;	push	de
	call	$3875		; write 1x2
;	pop	de
	pop	bc
	ld	a,$20		; next letter
	call	$A59
	dec	b
	jr	nz,loc_2C_42A9
	pop	de
	ld	b,18
	dec	c
	jr	nz,loc_2C_429A
	xor	a
	ld	($FF4F),a
	ret

byte_2C_42CA:
;		 <---------------->
	db	" Fighter mode     "
	db	" Gerwalk mode     "
	db	" Battroid mode    "

byte_2C_4300:
	db	" Gerwalk mode     "
	db	" Battroid mode    "
	db	"                  "

byte_2C_4336:
	db	" Stand by, OK?    "
	db	"  Yes             "
	db	"  No              "

byte_2C_436C:
	db	" Are you ready?   "
	db	"  Yes             "
	db	"  No              "

off_2C_43A2:
	dw	unk_2C_43B0
	dw	unk_2C_43C2
	dw	unk_2C_43D4
	dw	unk_2C_43E6
	dw	unk_2C_43F8
	dw	unk_2C_440A
	dw	unk_2C_441C

unk_2C_43B0:
	db	"Basara            "

unk_2C_43C2:
	db	"Mylene            "

unk_2C_43D4:
	db	"Ray               "

unk_2C_43E6:
	db	"Veffidas          "

unk_2C_43F8:
	db	"Gamlin            "

unk_2C_440A:
	db	"Max               "

unk_2C_441C:
	db	"Milia             "