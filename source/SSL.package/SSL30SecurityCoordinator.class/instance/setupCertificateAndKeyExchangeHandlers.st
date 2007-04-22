initialize-release
setupCertificateAndKeyExchangeHandlers

	self securityParams isRSAKeyExchangeAlgorithm 
		ifTrue: [^ self keyExchangeProcessor: SSL30RSAKeyExchangeRSASignatureProcessor new].
	super setupCertificateAndKeyExchangeHandlers.
