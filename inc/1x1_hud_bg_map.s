	ld	hl,$9C06	; 1st row
	ld	a,$C0		; 1st tile
	ld	b,2		; 2 rows
_1
	ld	c,14		; row length
_2
	call	$0405		; put vram
	inc	a
	inc	l
	dec	c
	jr	nz,_2
	ld	l,$26		; 2nd row
	dec	b
	jr	nz,_1
	ret