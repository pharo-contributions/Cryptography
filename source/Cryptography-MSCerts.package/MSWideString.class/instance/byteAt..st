accessing
byteAt: index

	| d r |
	d _ ((index) // self characterBytes) + 1.
	r _ (index) \\ self characterBytes.
	^ (self wordAt: d) digitAt: (self characterBytes - r).
