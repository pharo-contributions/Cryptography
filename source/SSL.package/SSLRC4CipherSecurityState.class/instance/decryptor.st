accessing
decryptor

	rc4 := ARC4 new key: self readKey.
	^ super decryptor