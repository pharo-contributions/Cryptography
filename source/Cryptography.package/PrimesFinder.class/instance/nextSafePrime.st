accessing
nextSafePrime
	[self += 2. self satisfiedSafe] whileFalse.
	^ 2*candidate + 1