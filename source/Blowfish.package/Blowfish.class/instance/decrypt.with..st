as yet unclassified
decrypt: someData with:   aKeyString

	
	self setRounds: self class defaultRounds .

	self blfKey: aKeyString.
	^self blfDec: someData for: someData size // 2.