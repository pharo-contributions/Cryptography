accessing
encryptor

	rc4 := ARC4 new key: self writeKey.
	^ super encryptor
