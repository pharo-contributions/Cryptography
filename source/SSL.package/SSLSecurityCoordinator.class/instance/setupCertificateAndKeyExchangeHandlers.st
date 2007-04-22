initialize-release
setupCertificateAndKeyExchangeHandlers

	self securityParams isRSAKeyExchangeAlgorithm 
		ifTrue: [^ self keyExchangeProcessor: SSLRSAKeyExchangeRSASignatureProcessor new].
	self securityParams isAnyDHKeyExchangeAlgorithm 
		ifFalse: [^ self error: 'bad cipher suite'].
	self securityParams isRSASignatureAlgorithm
		ifTrue: [^ self keyExchangeProcessor: SSLDHKeyExchangeRSASignatureProcessor new].
	self securityParams isDSASignatureAlgorithm
		ifTrue: [^ self keyExchangeProcessor: SSLDHKeyExchangeDSASignatureProcessor new].
	^ self keyExchangeProcessor: SSLDHKeyExchangeAnonSignatureProcessor new.
