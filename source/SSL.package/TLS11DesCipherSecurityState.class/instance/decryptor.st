accessing
decryptor

	des := DES key: self readKey.
	^ super decryptor