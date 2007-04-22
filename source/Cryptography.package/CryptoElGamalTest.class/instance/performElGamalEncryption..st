ElGamal
performElGamalEncryption: bits
	| elgamal pub priv c element |
	elgamal _ self elGamalGeneratorOfSize: bits.
	pub _ elgamal publicKey.
	priv _ elgamal privateKey.
	element _ (SecureRandom picker nextBits: bits).
	c _ pub encryptElement: element.
	self assert: (priv decryptElement: c) = element