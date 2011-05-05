as yet unclassified
encrypt: someData with:   aKeyString


	self setRounds: self class defaultRounds .

	self blfKey: aKeyString.
	
	^self blfEnc: someData  for: someData size // 2.