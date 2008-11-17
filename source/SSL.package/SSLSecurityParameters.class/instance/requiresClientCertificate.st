queries
requiresClientCertificate

	^requiresClientCertificate
		ifNil: [self cipherSuite requiresClientCertificate]
		ifNotNil: [requiresClientCertificate]