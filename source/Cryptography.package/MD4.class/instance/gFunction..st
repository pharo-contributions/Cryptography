functions
gFunction: x 
	^ ((b bitAnd: c)
		bitOr: ((b bitAnd: d)
				bitOr: (c bitAnd: d)))
		+ x + 16r5A827999