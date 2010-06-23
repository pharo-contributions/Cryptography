as yet unclassified
nextPut: aByte
	| keyIndex |
	inputIndex = pool size ifTrue: [self stir].
	inputIndex := inputIndex \\ pool size + 1.
	pool at: inputIndex put: ((pool at: inputIndex) bitXor: aByte).
	keyIndex := inputIndex \\ key size + 1.
	key at: keyIndex put: ((key at: keyIndex) bitXor: aByte).
	^ aByte