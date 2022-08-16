txt_writer_core:		; copy, modified for 1x1 charset
	push	af
	push	bc
	push	de
	push	hl
	ld	a,($C0C8)
	push	af
	push	hl
	ld	a,b
	ld	hl,$38B5
	call	$0A59
	ld	a,(hl)
	call	$03F5
	ld	a,b
	add	a,a
	ld	hl,$38BB
	call	$0A59
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	pop	hl
	ld	a,c
	add	a,a
	call	$0A6D
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	d,a
	ld	e,c
	ld	b,$10		; 1 tile size
_copy
	ld	a,(de)
	call	$0404
	inc	de
	inc	hl
	dec	b
	jr	nz,_copy
	pop	af
	call	$03F5
	pop	hl
	pop	de
	pop	bc
	pop	af
	ret
