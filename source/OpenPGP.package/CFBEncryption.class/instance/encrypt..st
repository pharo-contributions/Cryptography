encrypting
encrypt: aCharacterOrInteger
	| encBlock out |
	encBlock := cipher encryptBytes: iv.
	out := encBlock first bitXor: aCharacterOrInteger asInteger.
	iv replaceFrom: 1 to: iv size-1 with: iv startingAt: 2.
	iv at: iv size put: out.
	^out