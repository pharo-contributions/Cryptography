as yet unclassified
ecbEncrypt: someData with:   aKeyString


	self setRounds: self class defaultRounds .

	self blfKey: aKeyString.
	^self blfEcbEncrypt: someData for: someData size // 2.