ElGamal
performElGamalEncryption: bits
	| elgamal pub priv c element |
	elgamal := self elGamalGeneratorOfSize: bits.
	pub := elgamal publicKey.
	priv := elgamal privateKey.
	element := (SecureRandom picker nextBits: bits).
	c := pub encryptElement: element.
	self assert: (priv decryptElement: c) = element