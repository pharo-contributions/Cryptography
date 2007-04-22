accessing
encryptor

	des := DES key: self writeKey.
	des := des cbc initialVector: self ivWriteKey.
	^ super encryptor
