initialization
fromStream: stream

	| cipherSpecLength sessionIdLength challengeDataLength cipherSpecsStream |
	self clientVersion: (SSLProtocolVersion major: stream next minor: stream next).
	cipherSpecLength := (stream next: 2) asInteger.
	sessionIdLength := (stream next: 2) asInteger.
	challengeDataLength := (stream next: 2) asInteger.
	cipherSpecsStream := ReadStream on: (stream next: cipherSpecLength).
	self sessionId: (stream next: sessionIdLength).
	self random: ((stream next: challengeDataLength) asInteger asByteArrayOfSize: 32).
	self cipherSuites: OrderedCollection new.
	[cipherSpecsStream atEnd] whileFalse: [
		| cipherSuiteCode cipherSuite |
		cipherSuiteCode := cipherSpecsStream next: 3.
		cipherSuite := SSLCipherSuite ssl20cipherSuiteAtCode: cipherSuiteCode.
		cipherSuite isNil 
			ifFalse: [self cipherSuites add: cipherSuite]]
