as yet unclassified
decryptor

	tripleDes := TripleDES new key: self readKey.
	^ super decryptor