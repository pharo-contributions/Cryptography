as yet unclassified
encryptor

	tripleDes := TripleDES new key: self writeKey.
	^ super encryptor