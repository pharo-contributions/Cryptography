accessing
encryptor

	des := DES key: self writeKey.
	^ super encryptor
