accessing
nextBits: anInteger 
	| firstBits bits8 |
	firstBits _ (self nextBytes: anInteger // 8) 
		uint: (bits8 _ anInteger truncateTo: 8)
		at: 1.
	^ bits8 = anInteger 
		ifTrue: [ firstBits ]
		ifFalse: 
			[ | last8 mask bitsNeeded |
			last8 _ self nextBytes: 1.
			bitsNeeded _ anInteger - bits8.
			mask _ ((1 to: bitsNeeded) 
				inject: 0
				into: [ : total : n | 1 bitShift: n ]) - 1.
			(firstBits bitShift: bitsNeeded) + (last8 first bitAnd: mask) ]