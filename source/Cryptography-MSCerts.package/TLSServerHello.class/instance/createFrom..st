services
createFrom: aClientHello
	"using the clientHello posibilities create a server hello"
	self handShake: aClientHello handShake.
	self handShake serverHello: self.
	self serverVersion: (self selectVersionFrom: aClientHello).
	self random: (SecureRandom new nextBytes: 32).
	aClientHello sessionID ifNotEmpty: [self error: 'do something there to resume a session'].
	self sessionID: (TLSSessionCache cacheSessionFor: self handShake).
	self cipherSuite: (TLSCipherSuite getSupportedSuiteFrom: aClientHello).
	self compressionMethod: 0 copy.
	self createRawData.
	
	