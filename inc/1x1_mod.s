hud_msg_chr_offset:
	push	af			;1
;	ccf				;1
	ld	h,$8C			;2
;	rlca				;1
;	rlca				;1
;	rlca				;1
;	rlca				;1
	sla	a
	sla	a
	sla	a
	sla	a
	jr	nc,_1			;2
	inc	h			;1
_1
	ld	l,a			;1
	pop	af			;1
	ret				;1 = 14

hud_print_msg:
	ld	hl,$C24E		;3 letters written
	and	(hl)			;1
	jr	nz,_1			;2
	call	$411E			;3 hud_clear_msg
_1
	ld	hl,$C248		;3
	ld	a,(hl+)			;1
	ld	h,(hl)			;1
	ld	l,a			;1
_2
	ld	a,(hl+)			;1 letter
	ld	c,a			;1
	cp	$FF			;2 next $FF
	jr	z,$40B7			;2
	cp	$FD			;2 pic change?, next pic code
	jr	z,_5			;2
	cp	$FE			;2 line end, next delay
	jr	z,_3			;2
	push	hl			;1
	ld	a,($C24E)		;3 letters written
	call	hud_msg_chr_offset	;3
	inc	a			;1
	ld   	($C24E),a		;3
	ld	b,1			;2 0 - 1x2, 1 - 1x1 charset
	call	$3A00			;3 txt_writer_core modded
	pop	hl			;1
	ld	a,($C24C)		;3 leftover code?
	and	a			;1
	jr	z,_2			;2
	ld	a,03                    ;2
	ld	($C24A),a               ;3
	jr	_4                      ;2
_3
	ld	a,02			;2
	ld	($C24A),a		;3
	ld	a,(hl+)			;1 delay val
	ld	($C24B),a		;3
_4
	ld	a,l			;1
	ld	($C248),a		;3
	ld	a,h			;1
	ld	($C249),a		;3
	ret				;1 = 79
_5
	ld	c,(hl)			;1
	jr	$40E6			;2
