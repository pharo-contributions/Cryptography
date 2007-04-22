functions
fFunction: x 
	^ ((b bitAnd: c)
		bitOr: (b bitInvert bitAnd: d))
		+ x