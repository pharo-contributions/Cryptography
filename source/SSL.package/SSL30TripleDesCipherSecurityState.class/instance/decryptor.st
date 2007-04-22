as yet unclassified
decryptor

	tripleDes := TripleDES new key: self readKey.
	tripleDes := tripleDes cbc initialVector: self ivReadKey.
	^ super decryptor