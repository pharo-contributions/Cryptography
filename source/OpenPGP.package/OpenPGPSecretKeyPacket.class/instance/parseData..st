reading
parseData: aStream
	super parseData: aStream.
	stringToKeyUsage := aStream next.
	stringToKeyUsage = 255 ifTrue: [
		encryptionAlgorithm := aStream next.
		stringToKeySpecifier := aStream nextS2KSpecifier].
	stringToKeyUsage = 0 ifFalse: [
		initialVector := aStream next: 8].
	self readMPIsFrom: aStream