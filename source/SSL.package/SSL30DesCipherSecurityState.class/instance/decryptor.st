accessing
decryptor

	des := DES key: self readKey.
	des := des cbc initialVector: self ivReadKey.
	^ super decryptor