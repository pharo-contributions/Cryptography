as yet unclassified
processServerHelloMsg: msg

	self connection setVersion: msg serverVersion.
	self connection setCipherSuite: msg cipherSuite.
	self securityParams serverRandom: msg random.
	self securityCoord setupCertificateAndKeyExchangeHandlers.
	self securityCoord setPendingConnectionSecurityStates.
