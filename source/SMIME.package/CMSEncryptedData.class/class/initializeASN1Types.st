class initialization
initializeASN1Types

	| module |
	module := ASN1Module name: #cms.

	(module sequence: #EncryptedData mapping: CMSEncryptedData)
		add: #version type: #ASN1IntegerType;
		add: #encryptedContentInfo type: #EncryptedContentInfo;
		yourself.
	(module sequence: #EncryptedContentInfo mapping: CMSEncryptedContentInfo)
		add: #contentType type: #ContentType;
		add: #contentEncryptionAlgorithm type: #AlgorithmIdentifier;
		addOptional: #encryptedContent type: #EncryptedContent implicitTag: 0;
		yourself.
	module byteArray: #EncryptedContent.
