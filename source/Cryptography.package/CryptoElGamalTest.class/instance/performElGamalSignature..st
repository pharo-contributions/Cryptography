ElGamal
performElGamalSignature: bits
	| elgamal pub priv signature message |
	elgamal _ self elGamalGeneratorOfSize: bits.
	pub _ elgamal publicKey.
	priv _ elgamal privateKey.
	message _ SecureRandom picker nextBits: bits.
	signature _ priv signMessage: message.
	self assert: (pub verifySignature: signature onMessage: message)