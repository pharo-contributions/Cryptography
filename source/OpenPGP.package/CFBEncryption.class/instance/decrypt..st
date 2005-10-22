encrypting
decrypt: aCharacterOrInteger
	| encBlock out |
	encBlock := cipher encryptBytes: iv.
	shiftIndex := shiftIndex+1.
	out := (encBlock at: shiftIndex) bitXor: aCharacterOrInteger asInteger.
	shiftData at: shiftIndex put: aCharacterOrInteger asInteger. 
	shiftIndex = shiftData size ifTrue: [
		iv replaceFrom: 1 to: iv size-shiftIndex with: iv startingAt: shiftIndex+1.
		iv replaceFrom: iv size-shiftIndex+1 to: iv size with: shiftData startingAt: 1.
		shiftIndex := 0].
	^out