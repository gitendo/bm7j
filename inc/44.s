	xor	a
	ld	($DD01),a
	call	$1F4
	ld	a,$7F
	ld	($C0E6),a
	ld	a,3
	ld	($DD00),a
	call	sub_44_4390
	call	sub_44_4176
	call	$2FD
loc_44_401A:
	call	$1F4
	ld	a,($FF8B)
	and	8
	jr	nz,loc_44_402D
	call	loc_44_419E
	ld	a,($C707)
	and	a
	jp	z,loc_44_401A

loc_44_402D:
	ld	a,($D001)
	add	a,$4D
	ld	hl,$D048
	call	$A59
	ld	(hl),1
	ld	a,1
	ld	($D02A),a
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
	call	sub_44_40E6
	call	$395
	call	sub_44_4176
	call	$2FD

loc_44_406C:
	call	$1F4
	ld	a,($FF8B)
	and	8
	jr	nz,loc_44_408C
	ld	a,($FF8B)
	and	2
	jr	z,loc_44_4082
	ld	a,1
	ld	($C7E0),a
	jr	loc_44_408C

loc_44_4082:
	call	loc_44_419E
	ld	a,($C707)
	and	a
	jp	z,loc_44_406C

loc_44_408C:
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
	call	sub_44_412A
	call	sub_44_40C2
	call	$2FD

loc_44_40B6:
	call	$1F4
	ld	a,($FF8B)
	and	$B
	jr	z,loc_44_40B6
	jp	$912

sub_44_40C2:
	ld	hl,$8FF0
	ld	b,$10
	ld	a,$FF

loc_44_40C9:
	ld	(hl+),a
	dec	b
	jp	nz,loc_44_40C9
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

sub_44_40E6:
	ld	a,1
	ld	($FF4F),a
	ld	hl,byte_44_615F	; chr
	ld	de,$96F0
	ld	bc,16*16
	call	vram_fill
	xor	a
	ld	($FF4F),a
	ld	hl,byte_44_614F	; chr
	ld	de,$8000
	ld	bc,$10
	call	$44A
	ld	hl,byte_44_7AB6	; pal
	ld	de,$C140
	ld	bc,$40
	call	$44A
	call	$358
	ld	de,byte_44_695F	; map
	ld	hl,$9940
	call	$48F
	ld	de,byte_44_6A01	; atr
	ld	hl,$9940
	call	$4D5
	call	sub_44_412A
	ret

sub_44_412A:
	ld	hl,byte_44_6AE2	; chr
	ld	de,$9000
	ld	bc,$800
	call	$44A
	ld	hl,byte_44_72E2	; chr
	ld	de,$8C80
	ld	bc,$370
	call	$44A
	ld	a,1
	ld	($FF4F),a
	ld	hl,byte_44_7652	; chr
	ld	de,$8C80
	ld	bc,$290
	call	$44A
	xor	a
	ld	($FF4F),a
	ld	hl,byte_44_7A76	; pal
	ld	de,$C100
	ld	bc,$40
	call	$44A
	call	$343
	ld	de,byte_44_78E2	; map
	ld	hl,$9800
	call	$48F
	ld	de,byte_44_79AC	; atr
	ld	hl,$9800
	jp	$4D5

sub_44_4176:
	ld	a,($D001)
	add	a,a
	ld	hl,off_44_43B4
	call	$A59
	ld	a,(hl+)
	ld	($C700),a
	ld	a,(hl)
	ld	($C701),a

loc_44_4188:
	ld	a,($D007)
	ld	hl,unk_44_419B
	call	$A59
	ld	a,(hl)
	ld	($C709),a
	ld	a,1
	ld	($C70A),a
	ret

unk_44_419B:
	db	8
	db	4
	db	0

loc_44_419E:
	ld	a,($C708)
	call	$3EC

	dw	loc_44_41B0
	dw	loc_44_41D9
	dw	loc_44_41E4
	dw	loc_44_41FE
	dw	loc_44_4211
	dw	loc_44_4227

loc_44_41B0:
	call	sub_44_4339
	ld	a,(hl+)
	ld	($C702),a
	ld	a,(hl+)
	ld	($C703),a
	ld	a,(hl+)
	ld	($C704),a
	call	sub_44_4342
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

loc_44_41D9:
	call	sub_44_4309
	ld	a,($C708)
	inc	a
	ld	($C708),a
	ret

loc_44_41E4:
	ld	a,($C70A)
	dec	a
	ld	($C70A),a
	ret	nz
	ld	a,($C709)
	ld	($C70A),a
	and	a
	jp	nz,loc_44_4255
	ld	a,1
	ld	($C70A),a
	jp	loc_44_4237

loc_44_41FE:
	ld	a,($FF8B)
	and	1
	jp	z,loc_44_427F
	call	$B7D
	call	sub_44_436A
	ld	a,2
	ld	($C708),a
	ret

loc_44_4211:
	ld	a,($FF8B)
	and	1
	jp	z,loc_44_427F
	call	$B7D
	call	sub_44_434B
	call	sub_44_436A
	ld	a,0
	ld	($C708),a
	ret

loc_44_4227:
	ld	a,($FF8B)
	and	1
	jp	z,loc_44_427F
	call	$B7D
	ld	a,1
	ld	($C707),a
	ret

loc_44_4237:
	ld	a,1
	ld	($FF4F),a
	call	sub_44_4339

loc_44_423E:
	call	sub_44_42A5
	ld	a,($C70C)
	cp	2
	jp	c,loc_44_423E
	xor	a
	ld	($FF4F),a
	call	sub_44_4342
	ld	a,($C70C)
	jp	loc_44_426E

loc_44_4255:
	ld	a,1
	ld	($FF4F),a
	call	sub_44_4339
	call	sub_44_42A5
	call	sub_44_4342
	xor	a
	ld	($FF4F),a
	ld	a,($C70C)
	cp	2
	jp	nc,loc_44_426E
	ret

loc_44_426E:
	dec	a
	ld	b,a
	ld	a,($C708)
	add	a,b
	ld	($C708),a
	ld	a,$14
	ld	($C70D),a
	jp	loc_44_427F

loc_44_427F:
	call	$B7D
	ld	a,($C70D)
	dec	a
	ld	($C70D),a
	jp	nz,loc_44_4291
	ld	a,$14
	ld	($C70D),a

loc_44_4291:
	cp	$B
	ret	c
	ld	hl,0
	ld	b,$90
	ld	c,$88
	ld	de,unk_44_42A1
	jp	$BBB

unk_44_42A1:
	db	1
	db	1
	db	0
	db	0

sub_44_42A5:
;	ld	c,(hl)
;	inc	hl
;	ld	b,(hl)
;	inc	hl
;	ld	a,b
	xor	a		; text_writer, read string reduced to one byte
	ld	b,a
	ld	c,(hl)
	inc	hl
	ld	a,c
	cp	$FE
	jp	z,loc_44_42C5
	cp	$FD
	jp	z,loc_44_42BF
	cp	$FF
	jp	nz,loc_44_42D6
	ld	a,4
	ld	($C70C),a
	ret

loc_44_42BF:
	ld	a,3
	ld	($C70C),a
	ret

loc_44_42C5:
	xor	a
	ld	($C70B),a
	ld	a,($C70C)
	inc	a
	ld	($C70C),a
	cp	2
	ret	z
	jp	sub_44_42A5

loc_44_42D6:
	call	sub_44_42E8
	push	hl
	push	de
	pop	hl
	call	$3875
	pop	hl
	ld	a,($C70B)
	inc	a
	ld	($C70B),a
	ret

sub_44_42E8:
	push	hl
	push	bc
	ld	a,($C70C)
	add	a,a
	ld	hl,unk_44_4305
	call	$A59
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,($C70B)
	ld	b,$20		; get_chr_offset, 2x2 to 1x2 reduction
	call	$AF2
	add	hl,de
	push	hl
	pop	de
	pop	bc
	pop	hl
	ret

unk_44_4305:
	db	$40
	db	$91
	db	$80
	db	$93

sub_44_4309:
	ld	a,1
	ld	($FF4F),a
	ld	a,($C703)
	add	a,a
	ld	hl,off_44_7AF6	; names
	call	$A59
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	de,$9000
;	ld	b,5

;loc_44_431F:
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
;	jp	nz,loc_44_431F
;	xor	a
	lib	inc/1x1_names.s	; copy_name, patched writer 
	ld	($FF4F),a
	ret

sub_44_4339:
	ld	a,($C700)
	ld	l,a
	ld	a,($C701)
	ld	h,a
	ret

sub_44_4342:
	ld	a,l
	ld	($C700),a
	ld	a,h
	ld	($C701),a
	ret

sub_44_434B:
	ld	a,1
	ld	($FF4F),a
	ld	hl,$9000
	ld	b,20		; txt_clear_name, number of tiles to clear screen 

loc_44_4354:
	push	bc
	ld	c,$20		; txt_clear_name, with tile from bank
	ld	b,1
	call	$3A00		;	core 1x1 mod
	pop	bc
	ld	a,$10		; txt_clear_name, next tile offset
	call	$A59
	dec	b
	jp	nz,loc_44_4354
	xor	a
	ld	($FF4F),a
	ret

sub_44_436A:
	ld	a,1
	ld	($FF4F),a
	ld	hl,$9140
	ld	b,$24		; txt_clear_window, number of tiles to clear screen 

loc_44_4373:
	push	bc
	ld	c,$20		; txt_clear_window, clear screen with tile #
	ld	b,0
	call	$3875
	pop	bc
	ld	a,$20		; txt_clear_window, clear screen next tile offset
	call	$A59
	dec	b
	jp	nz,loc_44_4373
	xor	a
	ld	($FF4F),a
	xor	a
	ld	($C70B),a
	ld	($C70C),a
	ret

sub_44_4390:
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
	call	sub_44_40E6
	call	$395
	ret

off_44_43B4:
	dw	byte_44_43DA
	dw	byte_44_45A5
	dw	byte_44_475A
	dw	byte_44_491C
	dw	byte_44_4AB8
	dw	byte_44_4BCD
	dw	byte_44_4D12
	dw	byte_44_4E81
	dw	byte_44_5006
	dw	byte_44_5191
	dw	byte_44_52F0
	dw	byte_44_547A
	dw	byte_44_5608
	dw	byte_44_575E
	dw	byte_44_5925
	dw	byte_44_5AE1
	dw	byte_44_5C82
	dw	byte_44_5E3A
	dw	byte_44_5FBD

byte_44_43DA:
	lib	script/lvl5/1103b4.txt

byte_44_45A5:
	lib	script/lvl5/1103b6.txt

byte_44_475A:
	lib	script/lvl5/1103b8.txt

byte_44_491C:
	lib	script/lvl5/1103ba.txt

byte_44_4AB8:
	lib	script/lvl5/1103bc.txt

byte_44_4BCD:
	lib	script/lvl5/1103be.txt

byte_44_4D12:
	lib	script/lvl5/1103c0.txt

byte_44_4E81:
	lib	script/lvl5/1103c2.txt

byte_44_5006:
	lib	script/lvl5/1103c4.txt

byte_44_5191:
	lib	script/lvl5/1103c6.txt

byte_44_52F0:
	lib	script/lvl5/1103c8.txt

byte_44_547A:
	lib	script/lvl5/1103ca.txt

byte_44_5608:
	lib	script/lvl5/1103cc.txt

byte_44_575E:
	lib	script/lvl5/1103ce.txt

byte_44_5925:
	lib	script/lvl5/1103d0.txt

byte_44_5AE1:
	lib	script/lvl5/1103d2.txt

byte_44_5C82:
	lib	script/lvl5/1103d4.txt

byte_44_5E3A:
	lib	script/lvl5/1103d6.txt

byte_44_5FBD:
	lib	script/lvl5/1103d8.txt

byte_44_614F:
	db	$FF,$00,$7E,$00,$3C,$00,$18,$00,$00,$00,$7E,$00,$00,$00,$00,$00

byte_44_615F:
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

byte_44_695F:
	lib	inc/window.i

byte_44_6A01:
	db	$14
	db	8
	db	$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
	db	$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
	db	$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
	db	$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
	db	$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
	db	$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
	db	$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
	db	$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
	db	$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
	db	$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
	db	$80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$8A,$8B,$8C,$8D,$8E,$8F	; ???
	db	$90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F
	db	$A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF
	db	$B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE

byte_44_6AE2:
	db	$DC,$3F,$B3,$7C,$0C,$F0,$50,$E0,$69,$F0,$36,$F9,$9F,$7F,$C7,$39
	db	$9A,$E7,$25,$C3,$FA,$05,$45,$3E,$BE,$7F,$F0,$FF,$CE,$F1,$B1,$C0
	db	$39,$C7,$CC,$F3,$7F,$FF,$DA,$21,$61,$80,$D2,$E1,$69,$F7,$42,$FF
	db	$C3,$FC,$3A,$FD,$75,$F8,$CA,$FD,$3D,$C2,$E6,$F8,$09,$FE,$DF,$3F
	db	$8C,$03,$F3,$0C,$09,$FE,$3C,$FF,$4E,$3F,$20,$1F,$BD,$4E,$E8,$F6
	db	$3F,$C0,$B1,$0E,$1E,$07,$AA,$17,$15,$FB,$D9,$EF,$6C,$C7,$B6,$4F
	db	$02,$FF,$CC,$03,$86,$01,$C4,$03,$3E,$C1,$C3,$FC,$1D,$FE,$A7,$1F
	db	$4B,$F0,$F0,$FF,$6D,$9F,$93,$0F,$8A,$FF,$7C,$FF,$D1,$2F,$2B,$C7
	db	$04,$FB,$B4,$4B,$4B,$87,$4A,$87,$71,$8F,$A7,$DF,$9A,$FF,$76,$8F
	db	$F5,$FB,$6B,$F1,$0C,$F3,$B1,$FF,$B9,$FF,$56,$B9,$D5,$38,$29,$F0
	db	$C5,$FF,$39,$FF,$13,$FD,$ED,$DF,$99,$E7,$65,$FB,$79,$FF,$A3,$7F
	db	$47,$B8,$4F,$BA,$63,$9C,$73,$8C,$79,$86,$7C,$83,$81,$FF,$C0,$80
	db	$EF,$1C,$EF,$BC,$CF,$3C,$9F,$6C,$9E,$61,$DF,$20,$A0,$FF,$00,$00
	db	$AD,$73,$AF,$70,$AD,$73,$6F,$F0,$A0,$7F,$BF,$7F,$61,$F0,$2E,$71
	db	$ED,$F3,$DD,$23,$ED,$F3,$BD,$43,$41,$FF,$FF,$FF,$81,$03,$7D,$83
	db	$7F,$90,$7F,$9F,$6F,$90,$60,$9F,$7F,$80,$61,$9E,$7E,$81,$7F,$80
	db	$FE,$09,$FE,$F9,$F6,$09,$05,$FB,$F9,$07,$F0,$0F,$06,$F9,$3E,$C1
	db	$F0,$FF,$C5,$FE,$D4,$EF,$DA,$E7,$C7,$FF,$99,$FF,$DA,$FD,$C4,$FF
	db	$24,$FF,$B9,$7E,$92,$7C,$65,$DA,$A8,$C7,$9B,$E7,$C9,$F7,$F6,$F9
	db	$33,$FF,$56,$2F,$6D,$1E,$D2,$3D,$2D,$F0,$29,$F0,$9E,$E1,$D1,$EF
	db	$9E,$6F,$6F,$F7,$F7,$F9,$5D,$FE,$0F,$FF,$99,$E7,$E3,$FC,$FF,$FF
	db	$C0,$00,$22,$C1,$D9,$E7,$A4,$7B,$7B,$80,$B1,$C0,$4E,$F1,$F1,$FF
	db	$A9,$5E,$DB,$3C,$3A,$DD,$D5,$E8,$68,$F0,$4D,$F8,$18,$FF,$F1,$FF
	db	$AC,$1F,$19,$E6,$CE,$F0,$74,$F8,$9B,$74,$F4,$EF,$6F,$9E,$FC,$FF
	db	$1B,$FC,$E7,$18,$18,$07,$0D,$03,$12,$0D,$EE,$1F,$18,$E7,$56,$E1
	db	$87,$7F,$5A,$E7,$A5,$C2,$DA,$E4,$E5,$FE,$7C,$FF,$8E,$7F,$55,$8E
	db	$12,$FF,$79,$FE,$A6,$7D,$59,$26,$AD,$43,$47,$83,$E5,$03,$BE,$41
	db	$D6,$2F,$1D,$FE,$FE,$7D,$43,$3D,$34,$FB,$DD,$E2,$B2,$C1,$52,$A1
	db	$D0,$0F,$F6,$0F,$92,$FD,$8D,$F3,$52,$BF,$9D,$7E,$44,$FB,$6A,$F1
	db	$EE,$F1,$9B,$E7,$40,$FF,$3B,$FC,$DD,$3E,$46,$3F,$93,$7E,$FA,$FC
	db	$CD,$BF,$3D,$DF,$0B,$FD,$61,$FF,$77,$FF,$E9,$FF,$0B,$F1,$B3,$7F
	db	$4F,$B0,$71,$8E,$7C,$83,$8C,$F3,$61,$9E,$6F,$90,$5F,$A0,$60,$FF
	db	$FF,$00,$E0,$1F,$0F,$FF,$6C,$98,$EB,$1C,$6B,$9C,$6B,$9C,$08,$FF
	db	$AF,$70,$2F,$F0,$EF,$F0,$6E,$31,$AF,$70,$AC,$73,$AD,$72,$20,$FF
	db	$3D,$C3,$3D,$C3,$5D,$A3,$DD,$23,$FD,$03,$0D,$F3,$ED,$13,$01,$FF
	db	$7C,$83,$0C,$FF,$FF,$FF,$00,$80,$7F,$80,$00,$FF,$7F,$80,$00,$FF
	db	$FE,$01,$00,$FF,$FF,$FF,$01,$00,$FE,$01,$1E,$E1,$DE,$21,$00,$FF
	db	$F1,$FF,$F7,$FF,$C3,$FF,$D8,$FF,$B5,$FB,$E5,$FB,$F2,$FF,$FF,$FF
	db	$B9,$FE,$5A,$BF,$2D,$9E,$1A,$FC,$F5,$FA,$92,$FF,$1F,$FF,$67,$FF
	db	$AF,$5F,$5B,$B4,$BD,$73,$57,$3A,$BB,$7E,$4C,$FB,$AB,$DF,$6B,$9E
	db	$FF,$FF,$FF,$FF,$9F,$7F,$C0,$3F,$E1,$1E,$F1,$0E,$F1,$0E,$F3,$0C
	db	$1F,$FF,$E0,$FF,$FF,$FF,$FF,$7F,$82,$7F,$97,$6A,$B6,$4A,$FE,$02
	db	$E7,$FF,$3F,$FF,$FF,$FF,$FF,$FF,$02,$FF,$B8,$47,$FF,$00,$E0,$1F
	db	$F0,$FF,$8E,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F0,$0F,$18,$EF
	db	$C1,$FF,$3F,$FF,$81,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$0C,$FB,$DB,$E8
	db	$01,$FF,$E3,$FF,$F9,$FF,$FE,$FF,$FF,$FF,$FF,$FF,$5F,$FF,$21,$DF
	db	$91,$EE,$C7,$FF,$93,$FF,$3C,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$95,$7F
	db	$AC,$73,$C2,$FF,$9B,$FF,$79,$FF,$FD,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$E6,$F9,$71,$FF,$1B,$E7,$BD,$C3,$98,$E7,$C3,$FF,$FF,$FF,$FF,$FF
	db	$4A,$FC,$B5,$CE,$B3,$CF,$C9,$FE,$BE,$FD,$C1,$FF,$FA,$FD,$FF,$FF
	db	$BD,$7F,$53,$FC,$C4,$FF,$2B,$F7,$54,$E3,$EB,$F7,$97,$FF,$FF,$FF
	db	$FF,$FF,$6D,$F3,$97,$FF,$32,$FF,$49,$F7,$E3,$FF,$F4,$FF,$FF,$FF
	db	$FF,$FF,$7D,$FF,$98,$FF,$25,$DF,$9F,$FF,$F9,$FF,$C4,$FB,$3F,$FF
	db	$FF,$FF,$FF,$FF,$9F,$FF,$7F,$FF,$BF,$FF,$FF,$FF,$EF,$FF,$FF,$FF
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FD,$FF,$FB,$FE,$F6,$FD
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$57,$FF,$FB,$AF,$AD,$57
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db	$E9,$FF,$52,$FD,$74,$FB,$F9,$FF,$DE,$FF,$7F,$FF,$FF,$FF,$FF,$FF
	db	$D6,$EF,$9D,$E7,$CE,$FF,$95,$FF,$61,$FF,$C3,$FF,$B7,$FF,$FF,$FF
	db	$19,$FE,$F2,$FF,$C6,$FF,$11,$EF,$C7,$FF,$FF,$FF,$FF,$FF,$E0,$FF
	db	$E3,$1C,$C3,$3C,$C9,$36,$CC,$33,$DE,$21,$DF,$20,$9F,$60,$9F,$60
	db	$F2,$0E,$F6,$0E,$FE,$02,$FE,$02,$7E,$83,$7F,$83,$3F,$C2,$BE,$42
	db	$FF,$1F,$FC,$1C,$FF,$00,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$CD,$32
	db	$FF,$FF,$CD,$CD,$FF,$00,$FF,$00,$00,$FF,$FC,$FF,$00,$FF,$B8,$47
	db	$BB,$C8,$BB,$C8,$3B,$C8,$3B,$C8,$10,$FF,$7F,$FF,$01,$FF,$FF,$01
	db	$3E,$C1,$1E,$E1,$9E,$61,$8F,$71,$02,$FF,$FF,$FF,$80,$7F,$5E,$21
	db	$4F,$30,$4F,$30,$4F,$30,$1F,$60,$01,$FF,$FF,$FF,$30,$EF,$4C,$A3
	db	$AF,$E0,$AF,$E6,$AF,$E6,$AF,$E0,$7F,$FF,$F0,$FF,$67,$98,$B5,$CE
	db	$69,$97,$30,$8F,$2A,$95,$75,$8A,$FF,$FF,$E5,$9A,$A2,$9D,$B5,$8A
	db	$FF,$FF,$C4,$BF,$EE,$95,$C5,$BF,$FF,$FF,$D4,$AB,$EA,$95,$C4,$BB
	db	$FF,$FF,$C9,$7F,$60,$DF,$C6,$7F,$FF,$FF,$CA,$7F,$6E,$DF,$C2,$7F
	db	$FF,$FF,$FF,$FF,$CA,$FF,$D7,$FF,$FF,$FF,$D7,$FF,$CA,$FF,$F7,$FF
	db	$E9,$FF,$FF,$FF,$DD,$FF,$77,$FF,$DF,$FF,$7F,$FF,$DD,$FF,$77,$FF
	db	$7F,$FF,$FF,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF
	db	$ED,$FA,$FA,$F4,$EF,$F8,$FA,$F4,$EF,$F8,$FA,$F4,$EF,$F8,$FB,$F4
	db	$F6,$0B,$BD,$07,$16,$0B,$1D,$07,$16,$0B,$3D,$07,$56,$0B,$ED,$17
	db	$FF,$FF,$FF,$FF,$FF,$FF,$FE,$FF,$FD,$FF,$FE,$FF,$FD,$FF,$FE,$FF
	db	$FF,$FF,$F4,$FE,$57,$FC,$D8,$FE,$3B,$FC,$B4,$FA,$1B,$F4,$9F,$FF
	db	$C9,$FE,$97,$E8,$AB,$D4,$97,$E8,$AB,$D4,$80,$FF,$FF,$FF,$ED,$89
	db	$B1,$2E,$B1,$2E,$B1,$2E,$B9,$26,$BB,$24,$7B,$A4,$F3,$EC,$F3,$0C
	db	$CF,$30,$CF,$30,$EF,$10,$E7,$18,$E7,$18,$E3,$1C,$CB,$34,$DB,$24
	db	$BE,$4E,$BE,$46,$BE,$46,$9E,$6E,$CE,$32,$EE,$12,$F6,$0A,$F0,$0E
	db	$CC,$33,$EF,$10,$E7,$18,$E3,$1C,$E9,$16,$CD,$32,$D9,$26,$B3,$4C
	db	$39,$C7,$F3,$0D,$E7,$19,$E7,$19,$87,$79,$CF,$31,$97,$68,$B3,$4C
	db	$FF,$FD,$FF,$55,$AF,$55,$BF,$55,$FF,$5D,$FF,$E1,$FF,$01,$FB,$05
	db	$6E,$11,$7C,$03,$79,$06,$73,$0C,$6B,$14,$6B,$14,$5D,$22,$5E,$21
	db	$CE,$21,$CE,$21,$CE,$21,$CD,$22,$CD,$22,$CF,$20,$E9,$27,$7E,$FF
	db	$B5,$CE,$A6,$D9,$62,$9D,$DA,$25,$FD,$02,$E7,$1F,$F9,$FE,$1B,$E4
	db	$AA,$95,$B5,$8A,$A8,$97,$B1,$8E,$EF,$97,$FD,$FA,$C2,$BD,$B5,$8A
	db	$EA,$95,$C4,$BB,$EA,$95,$9F,$FF,$A6,$FD,$D4,$AF,$EF,$95,$97,$EF
	db	$64,$DF,$C4,$7F,$7F,$FF,$D4,$FF,$64,$DF,$C5,$7F,$E6,$DF,$D0,$7F
	db	$CB,$FF,$FF,$FF,$8A,$FF,$D7,$FF,$8A,$FF,$D7,$FF,$8F,$FF,$FF,$FF
	db	$DD,$FF,$77,$FF,$DF,$FF,$77,$FF,$DF,$FF,$FE,$FF,$FE,$FF,$F1,$FF
	db	$FF,$FF,$7F,$FF,$FF,$FF,$FF,$FF,$FE,$FF,$F7,$FF,$59,$FF,$A7,$FF
	db	$ED,$FA,$F7,$FD,$FA,$FF,$FF,$FF,$FF,$FF,$EA,$FF,$FF,$FF,$D5,$FF
	db	$5F,$AB,$FD,$57,$AB,$FF,$FF,$FF,$FF,$FF,$AB,$FF,$FF,$FF,$55,$FF
	db	$FD,$FF,$FE,$FF,$FD,$FF,$FE,$FF,$FD,$FF,$FE,$FF,$FF,$FF,$CE,$FF
	db	$1B,$F4,$94,$FB,$1A,$F5,$95,$FA,$1B,$F4,$95,$FA,$99,$F6,$E3,$FE
	db	$6D,$89,$ED,$09,$ED,$09,$ED,$09,$0D,$F9,$FF,$F9,$CF,$98,$CD,$9A
	db	$C3,$3C,$B7,$48,$F7,$08,$EF,$10,$7F,$80,$CF,$F0,$9C,$7F,$D1,$27
	db	$BB,$44,$B9,$46,$7A,$85,$FB,$04,$FB,$04,$F9,$07,$7E,$FF,$9C,$E3
	db	$FE,$02,$FE,$02,$FE,$02,$3E,$C2,$C2,$3E,$FE,$FE,$6E,$92,$EE,$12
	db	$EF,$10,$EF,$10,$DE,$21,$BE,$41,$FE,$01,$FD,$02,$FD,$02,$F9,$06
	db	$B9,$46,$1E,$E1,$DF,$20,$CF,$30,$EF,$10,$EF,$10,$EF,$10,$CF,$30
	db	$E7,$19,$0F,$F1,$F7,$69,$FB,$65,$FF,$01,$FF,$01,$F7,$0F,$7B,$FD
	db	$1F,$7F,$F7,$FD,$FA,$15,$6A,$15,$6A,$15,$6A,$15,$6A,$15,$6B,$15
	db	$DE,$F2,$AC,$52,$AC,$52,$AC,$52,$AC,$52,$AC,$52,$B2,$5F,$57,$E8
	db	$CA,$35,$D6,$39,$D7,$38,$97,$68,$F1,$0F,$87,$78,$7F,$80,$FE,$01
	db	$A2,$9D,$B1,$8E,$AA,$95,$B5,$8A,$A2,$9D,$A3,$9F,$DF,$BF,$7F,$FF
	db	$8E,$F5,$C4,$BF,$ED,$97,$DF,$BF,$FE,$FF,$F8,$FF,$F7,$FF,$E3,$FF
	db	$67,$DF,$FF,$7F,$FF,$FF,$E0,$FF,$0D,$FE,$B4,$CF,$72,$8F,$A7,$DF
	db	$FF,$FF,$EC,$FF,$E2,$FD,$F7,$F8,$1A,$FD,$E1,$1F,$E7,$1F,$5C,$AF
	db	$07,$FF,$49,$FE,$ED,$FF,$41,$FF,$56,$ED,$A6,$FF,$6D,$FB,$DD,$FF
	db	$CF,$FF,$CF,$FF,$1F,$FF,$7E,$FF,$FC,$FF,$FF,$FF,$90,$FF,$AA,$5D
	db	$FF,$FF,$AA,$FF,$55,$FF,$00,$FF,$00,$FF,$D5,$EA,$5F,$E0,$7F,$FF
	db	$FF,$FF,$AB,$FF,$55,$FF,$40,$FF,$47,$FF,$9D,$FA,$FF,$80,$FF,$FF
	db	$E4,$FF,$FA,$FF,$93,$FF,$D1,$FF,$CB,$FF,$7C,$FF,$A5,$7F,$F3,$FF
	db	$6B,$F6,$E2,$FF,$57,$FF,$7E,$FF,$1C,$FF,$58,$BF,$08,$FF,$E5,$FF
	db	$CE,$B9,$AE,$D9,$0F,$D8,$4F,$98,$69,$9E,$AF,$DF,$8D,$FB,$D9,$FF
	db	$B3,$44,$73,$84,$73,$84,$33,$C4,$36,$C5,$36,$C5,$86,$FD,$98,$FF
	db	$CE,$31,$E7,$18,$F7,$08,$F7,$08,$F7,$08,$F3,$0C,$F9,$06,$FC,$03
	db	$66,$9A,$76,$8A,$FA,$06,$FB,$07,$F3,$0E,$C6,$3A,$9E,$62,$0E,$F2
	db	$FB,$04,$F1,$0F,$CE,$3F,$EF,$F0,$FF,$04,$FF,$1C,$FF,$14,$F9,$1E
	db	$CF,$3F,$F8,$FF,$1F,$E8,$BF,$48,$DF,$2E,$FF,$0A,$FF,$0A,$FF,$0C
	db	$BF,$C1,$7F,$81,$3F,$C1,$BF,$41,$DF,$21,$AF,$51,$BF,$41,$79,$87
	db	$75,$1E,$93,$EC,$FB,$04,$7B,$04,$7A,$05,$73,$0F,$1F,$7F,$FC,$FF
	db	$73,$8C,$3B,$C4,$8C,$73,$07,$FF,$7E,$FF,$FB,$FF,$BB,$FF,$80,$FF
	db	$F3,$0F,$9F,$7F,$FF,$FF,$E6,$FF,$20,$DF,$59,$BE,$7E,$BC,$1D,$FE

byte_44_72E2:
	db	$E3,$FF,$99,$FF,$64,$BF,$B2,$7D,$C5,$38,$28,$10,$00,$18,$24,$18
	db	$2D,$F3,$DA,$E1,$06,$F9,$CA,$3D,$2D,$1E,$16,$0F,$6E,$1F,$DC,$3F
	db	$1E,$FF,$63,$FC,$D4,$E3,$A2,$C1,$16,$E1,$A1,$7E,$FB,$9F,$96,$EF
	db	$9B,$7C,$7B,$FC,$F0,$FF,$CD,$FF,$9D,$FF,$0A,$FF,$E3,$1C,$BC,$03
	db	$2F,$FE,$47,$FC,$D6,$EC,$EF,$FF,$DF,$BE,$7E,$FD,$DD,$FA,$3A,$F0
	db	$5D,$AA,$FA,$05,$AB,$01,$FF,$FE,$57,$AB,$AC,$57,$55,$AE,$AF,$08
	db	$D5,$EA,$80,$FF,$55,$AA,$2D,$11,$E7,$C6,$FE,$7D,$D7,$2C,$FF,$03
	db	$55,$BA,$10,$FF,$55,$3A,$FA,$D5,$55,$BA,$BA,$55,$75,$BA,$E8,$37
	db	$75,$BB,$12,$FF,$5E,$BF,$B9,$5F,$58,$AF,$AE,$5F,$5D,$AF,$34,$CF
	db	$72,$FF,$AB,$77,$C9,$37,$26,$FF,$FC,$FF,$7B,$FC,$CA,$FC,$BB,$CC
	db	$FF,$FF,$1F,$FF,$B7,$CF,$B1,$CF,$E6,$F9,$14,$F9,$48,$FF,$66,$FF
	db	$B8,$FF,$9B,$FF,$79,$FF,$3B,$FF,$AF,$FF,$E7,$FF,$9F,$FF,$23,$DF
	db	$FC,$03,$FE,$01,$FE,$01,$FE,$01,$FE,$01,$FC,$03,$FC,$03,$FD,$02
	db	$76,$8A,$FE,$02,$FE,$02,$FE,$02,$FE,$02,$FE,$02,$DE,$22,$EF,$12
	db	$FC,$13,$FC,$03,$FD,$02,$DB,$24,$D8,$27,$B3,$4F,$9F,$7F,$78,$FF
	db	$FF,$08,$7E,$89,$AB,$5F,$9F,$7F,$FF,$FF,$FF,$FF,$D1,$FF,$2C,$DF
	db	$CF,$3F,$7E,$FF,$F9,$FE,$72,$FD,$34,$FB,$B7,$C8,$CC,$F0,$18,$E0
	db	$81,$FE,$2A,$D5,$BD,$7B,$F5,$FB,$18,$E7,$F1,$0C,$6B,$1C,$5B,$3C
	db	$19,$E0,$4E,$F1,$F0,$EF,$EE,$FF,$4E,$FF,$98,$7F,$60,$1F,$33,$0F
	db	$DE,$3F,$6C,$9F,$29,$DF,$57,$EF,$EB,$F6,$50,$BF,$AF,$1E,$5D,$BE
	db	$AB,$1C,$59,$BF,$5E,$BF,$B1,$7E,$46,$38,$B9,$7E,$7E,$FF,$39,$FE
	db	$31,$FF,$80,$FF,$3A,$C7,$87,$00,$07,$03,$8A,$07,$F9,$06,$06,$F8
	db	$E9,$F6,$07,$F8,$FA,$00,$80,$7F,$3C,$C3,$AF,$1F,$DF,$3F,$66,$1F
	db	$18,$07,$13,$0F,$B7,$0F,$E7,$1F,$8F,$FE,$DF,$FC,$9E,$FC,$7F,$BC
	db	$FF,$FF,$E1,$C6,$38,$C1,$8F,$F0,$C0,$7F,$E7,$38,$28,$30,$EF,$38
	db	$FB,$FB,$FE,$0C,$1F,$E3,$9F,$21,$4F,$F0,$E7,$38,$28,$30,$EF,$38
	db	$FF,$83,$FE,$7C,$FF,$83,$3F,$C0,$BF,$F3,$5F,$E0,$C0,$60,$DF,$70
	db	$A7,$B8,$FF,$67,$FF,$A0,$FC,$23,$FB,$24,$FD,$22,$02,$20,$FF,$20
	db	$8F,$77,$E7,$1F,$FE,$83,$7F,$FF,$DF,$27,$ED,$13,$13,$01,$FF,$01
	db	$58,$8F,$2C,$DF,$88,$FF,$E2,$FF,$99,$FF,$6C,$9F,$56,$8F,$6E,$9F
	db	$03,$FF,$EA,$1D,$97,$0E,$97,$0F,$6E,$9F,$95,$EE,$DE,$F0,$52,$BC
	db	$53,$8F,$B6,$CF,$47,$FE,$FF,$7F,$B4,$7F,$8D,$76,$D4,$2E,$48,$3E
	db	$F9,$06,$F1,$0E,$F2,$0D,$E1,$1F,$9F,$7F,$7F,$FF,$7F,$FF,$FE,$FF
	db	$E3,$1F,$C7,$3F,$3F,$FF,$FF,$FF,$EE,$FF,$F0,$FF,$FA,$FD,$09,$F7
	db	$E7,$F8,$E6,$F9,$88,$F7,$33,$FF,$61,$FF,$83,$7C,$7C,$F0,$F0,$E8
	db	$56,$8F,$2E,$DF,$DD,$FE,$52,$BC,$A9,$1E,$DE,$3F,$43,$3F,$38,$07
	db	$B0,$40,$FF,$00,$20,$1F,$5E,$3F,$AA,$5C,$50,$BF,$BC,$FF,$58,$BF
	db	$D9,$3E,$3E,$FF,$FF,$FC,$0D,$F8,$4B,$3C,$30,$FF,$06,$F9,$79,$80
	db	$EE,$1F,$19,$FE,$C6,$F8,$A4,$D8,$C4,$98,$F3,$9C,$D8,$B7,$33,$EF
	db	$02,$FD,$FA,$05,$4D,$03,$05,$03,$2D,$03,$7B,$07,$87,$7F,$1B,$F7
	db	$A2,$FF,$8E,$F1,$D9,$E0,$90,$E0,$A0,$C0,$A1,$C0,$A3,$C0,$7E,$81
	db	$E8,$F0,$48,$F0,$BF,$40,$F0,$0F,$8D,$7F,$E7,$1F,$38,$C7,$44,$FB
	db	$70,$0F,$9D,$60,$24,$FB,$7A,$F7,$EC,$F7,$EC,$F7,$D1,$EF,$27,$DF
	db	$F9,$7E,$7A,$FD,$6D,$FA,$C8,$FF,$9A,$FF,$19,$FF,$FF,$FF,$FA,$FF
	db	$6D,$BA,$AA,$7D,$6D,$FA,$58,$FF,$DA,$FF,$B0,$FF,$55,$FF,$AA,$FF
	db	$6D,$BA,$AA,$7D,$75,$BE,$14,$FF,$BA,$FF,$0A,$FF,$5B,$FF,$AA,$FF
	db	$6D,$BA,$B6,$5D,$5B,$BE,$0D,$FF,$BA,$FF,$26,$FF,$5E,$FF,$AA,$FF
	db	$75,$AA,$AA,$75,$75,$AA,$20,$FF,$AB,$FF,$A1,$FF,$77,$FF,$AA,$FF
	db	$55,$AB,$AB,$55,$D5,$AB,$A1,$FF,$AB,$FF,$41,$FF,$55,$FF,$AB,$FF
	db	$BA,$DF,$D1,$EF,$E4,$F3,$E8,$F1,$E9,$F0,$F6,$F9,$E9,$FF,$EF,$FF
	db	$A9,$1E,$6A,$9F,$99,$FF,$58,$FF,$53,$FF,$14,$FF,$A5,$DB,$CA,$FD
	db	$DA,$3C,$2B,$DC,$C5,$FE,$FE,$FF,$5B,$E7,$24,$D3,$AB,$D0,$D7,$38
	db	$F0,$FF,$E4,$F8,$E8,$F0,$C8,$F0,$19,$E0,$8F,$F0,$E0,$FF,$FF,$FF
	db	$B3,$4F,$67,$1F,$22,$1F,$DD,$22,$B3,$40,$19,$E0,$CE,$F1,$F1,$FF
	db	$F4,$E8,$FF,$CC,$2C,$DF,$DA,$3D,$35,$F8,$75,$F8,$FA,$FD,$FC,$FF

byte_44_7652:
	db	$C2,$3D,$9B,$7C,$36,$F9,$75,$FB,$28,$D7,$5B,$E4,$E6,$F8,$08,$F0
	db	$87,$78,$7D,$80,$88,$F0,$D1,$E0,$2F,$F0,$D5,$3B,$25,$1B,$13,$0F
	db	$8E,$01,$71,$8F,$87,$7F,$9C,$7F,$3A,$FC,$BC,$C8,$EE,$F0,$01,$FE
	db	$00,$FF,$C9,$FF,$99,$FF,$5C,$BF,$4C,$3F,$23,$1C,$54,$38,$A8,$70
	db	$74,$FB,$84,$FB,$9B,$E0,$A1,$C0,$61,$80,$43,$80,$FE,$01,$41,$3F
	db	$D9,$27,$8B,$77,$A5,$7B,$A5,$7B,$2A,$FD,$79,$FE,$79,$FE,$F9,$FE
	db	$F0,$FF,$F9,$FF,$C3,$FF,$3F,$DF,$5F,$BF,$CF,$3F,$4F,$3F,$DE,$3F
	db	$3F,$FF,$FF,$FF,$F6,$F9,$EF,$F7,$DE,$E1,$B8,$C7,$7F,$BF,$FB,$04
	db	$FF,$FF,$FF,$FF,$75,$8B,$FF,$F2,$0E,$F4,$F7,$0F,$FF,$C8,$FE,$11
	db	$55,$FF,$FF,$FF,$F1,$0E,$E7,$18,$10,$00,$FF,$FF,$70,$8F,$C3,$3C
	db	$5F,$FF,$FF,$FF,$F7,$18,$DF,$30,$30,$20,$FF,$FF,$BF,$60,$DE,$61
	db	$57,$FF,$FF,$FF,$07,$F8,$C0,$3F,$00,$00,$FF,$FF,$1D,$EE,$7D,$82
	db	$77,$FF,$FF,$FF,$3F,$C0,$07,$F8,$38,$04,$FF,$FF,$FE,$01,$FE,$01
	db	$D5,$FF,$FF,$FF,$F3,$0C,$C7,$38,$48,$00,$FF,$FF,$FD,$C2,$FE,$01
	db	$F2,$FD,$F9,$FE,$BA,$7F,$BE,$7F,$7D,$3E,$FA,$FD,$EB,$1F,$EE,$1F
	db	$7A,$FC,$1A,$7C,$EB,$1C,$94,$0F,$0B,$07,$96,$0F,$6D,$92,$0E,$FF
	db	$DB,$3C,$4C,$3F,$F5,$0F,$CB,$37,$3C,$FB,$D7,$E8,$6B,$F0,$AF,$70
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

byte_44_78E2:
	db	$14
	db	$A
	db	$00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
	db	$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F
	db	$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F
	db	$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F
	db	$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F
	db	$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$5B,$5C,$5D,$5E,$5F
	db	$60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F
	db	$70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7A,$7B,$7C,$7D,$7E,$7F
	db	$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7
	db	$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7
	db	$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF,$F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7
	db	$F8,$F9,$FA,$FB,$FC,$FD,$FE,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,$D0
	db	$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8

byte_44_79AC:
	db	$14
	db	$A
	db	$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$07,$07,$07,$07,$07
	db	$07,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$07
	db	$07,$07,$07,$07,$07,$06,$06,$06,$07,$07,$07,$07,$07,$07,$07,$07
	db	$06,$06,$06,$06,$06,$06,$07,$07,$06,$06,$06,$06,$07,$07,$07,$07
	db	$07,$07,$07,$07,$07,$07,$07,$07,$06,$06,$07,$07,$07,$07,$07,$07
	db	$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$06,$06,$07,$07
	db	$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$06,$06
	db	$06,$07,$07,$07,$06,$06,$07,$07,$07,$07,$07,$07,$07,$07,$07,$06
	db	$06,$06,$06,$06,$07,$07,$07,$07,$07,$06,$06,$07,$07,$07,$07,$07
	db	$06,$06,$06,$06,$06,$06,$06,$06,$07,$07,$07,$07,$07,$06,$06,$06
	db	$07,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$07,$07,$07,$07,$07
	db	$07,$06,$06,$06,$06,$06,$06,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0F,$0F
	db	$0F,$0F,$0F,$0F,$0F,$0F,$0E,$0E

byte_44_7A76:
	db	$FF,$7F,$00,$00,$10,$42,$FF,$1E,$83,$0D,$FF,$7F,$10,$42,$E0,$03
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$1B,$2E,$14,$19,$8A,$14,$21,$84,$59,$57,$52,$26,$D1,$0C,$21,$04

byte_44_7AB6:
	db	$00,$00,$00,$00,$10,$42,$FF,$1E,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

off_44_7AF6:
	lib	inc/names.i	; names
; ---------------------------------------------------------------------------
sub_44_7B7A:
	xor	a		; $7B7A
	ld	($DD01),a
	call	$1F4
	ld	a,$7F
	ld	($C0E6),a
	ld	a,3
	ld	($DD00),a
	call	sub_44_4390
	call	sub_44_7C6D
	ld	c,0
	ld	d,0
	call	$38C7
	ld	b,9
	ld	c,1
	ld	d,0
	call	$38C7
	ld	a,9
	ld	($C703),a
	ld	hl,byte_44_7C7B
	ld	a,l
	ld	($C700),a
	ld	a,h
	ld	($C701),a
	call	loc_44_4188
	ld	a,1
	ld	($C708),a
	call	sub_44_7D53
	call	$2FD

loc_44_7BBF:
	call	$1F4
	ld	a,($FF8B)
	and	8
	jp	nz,$8B3
	call	loc_44_419E
	ld	a,($C707)
	and	a
	jp	z,loc_44_7BBF
	ld	a,($C70E)
	and	a
	jp	nz,$8B3
	call	$B7D
	call	sub_44_434B
	call	sub_44_436A
	ld	b,8
	ld	c,1
	ld	d,0
	call	$38C7
	ld	a,8
	ld	($C703),a
	ld	hl,byte_44_7CC5
	ld	a,l
	ld	($C700),a
	ld	a,h
	ld	($C701),a
	ld	a,1
	ld	($C70E),a
	xor	a
	ld	($C707),a
	ld	a,1
	ld	($C708),a
	jp	loc_44_7BBF
; ---------------------------------------------------------------------------
sub_44_7C0D:
	call	sub_44_4390		; $7C0D
	ld	b,9
	ld	c,0
	ld	d,0
	call	$38C7
	ld	a,9
	ld	($C703),a
	ld	hl,byte_44_7D13
	ld	a,l
	ld	($C700),a
	ld	a,h
	ld	($C701),a
	call	loc_44_4188
	ld	a,1
	ld	($C708),a
	call	sub_44_7D53
	call	$2FD

loc_44_7C37:
	call	$1F4
	call	loc_44_419E
	ld	a,($C707)
	and	a
	jp	z,loc_44_7C37
	ld	a,($C70E)
	and	a
	jp	nz,$8F4
	call	$B7D
	call	sub_44_436A
	ld	hl,byte_44_7D3F
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
	jp	loc_44_7C37

sub_44_7C6D:
	ld	b,0
	ld	a,($D001)
	cp	$A
	ret	c
	inc	b
	cp	$10
	ret	c
	inc	b
	ret

byte_44_7C7B:
	lib	script/lvl5/113ba7.txt

byte_44_7CC5:
	lib	script/lvl5/113bf2.txt

byte_44_7D13:
	lib	script/lvl5/113c1f.txt

byte_44_7D3F:
	lib	script/lvl5/113c52.txt

sub_44_7D53:
	ld	de,byte_44_7D65	; map
	ld	hl,$9C00
	call	$48F
	ld	de,byte_44_6A01	; atr
	ld	hl,$9C00
	jp	$4D5

byte_44_7D65:
	lib	inc/selector.i	; writer, selector window
