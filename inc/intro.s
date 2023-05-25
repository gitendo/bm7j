intro_expansion:
	call	$4000
	and	a
	ret	nz
	ld	a,($C700)
	inc	a
	call	$4000
	ret