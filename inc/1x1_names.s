;copy_name:
;	ld	a,1		; vram bank
;	ld	($FF00+$4F),a
;	ld	a,($C705)	; name
;	add	a,a
;	ld	hl,$7ACB	; name's table
;	call	$0A59		; add_a_to_hl
;	ld	a,(hl+)		; name's offset
;	ld	h,(hl)
;	ld	l,a
;	ld	de,$9000	; map
_1
	ld	a,(hl+)		; get name letter
	ld	b,1		; use 1x1 charset
	ld	c,a
	push	hl
	push	de
	pop	hl
	call	$3A00		; txt_writer_core_mod
	pop	hl
	ld	a,$10		; tile size
	call	$0A6D		; add_a_to_de
	ld	a,c
	cp	$3A		; :
	jr	nz,_1
	xor  a
	ld	($FF4F),a
	ret  
