as yet unclassified
encryptor

	tripleDes := TripleDES new key: self writeKey.
	tripleDes := tripleDes cbc initialVector: self ivWriteKey.
	^ super encryptor