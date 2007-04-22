testing
matchesTag: anInteger

	^ (anInteger bitAnd: 2r11000000) isZero not
