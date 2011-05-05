as yet unclassified
ecbDecrypt: someData with:   aKeyString


	self setRounds: self class defaultRounds .

	self blfKey: aKeyString.
	^self blfEcbDecrypt: someData for: someData size // 2.