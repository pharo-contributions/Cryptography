running
setUp
	| reader |
	super setUp.
	
	reader := RSAPrivateKeyFileReader new.
	reader decryptedBytes: self derKeys.
	privateKey := reader asPrivateKey.
	publicKey := reader asPublicKey.
	