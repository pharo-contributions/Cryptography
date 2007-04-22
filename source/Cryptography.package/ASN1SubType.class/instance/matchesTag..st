testing
matchesTag: anInteger

	^ ((tag bitXor: anInteger) bitAnd: 2r00011111) isZero
