process
processClientHelloMsg: msg

	| suite |
	self connection setInitialVersion: msg clientVersion.
	self connection setVersion: (msg clientVersion min: SSLProtocolVersion tls11).
	suite := SSLCipherSuite firstSupportedCipherSuiteFromSet: msg cipherSuites.
	suite isNil ifTrue: [^ self sendAlertCode: 40].
	self connection setCipherSuite: suite.
	self securityParams clientRandom: msg random.
	self securityCoord setupCertificateAndKeyExchangeHandlers.
	self securityCoord setPendingConnectionSecurityStates.
