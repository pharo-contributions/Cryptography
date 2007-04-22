converting
fromStream: stream

	| suitesLength encodedSuitesStream compressionMethodsLength encodedCompressionMethodsStream |
	self clientVersion: (SSLProtocolVersion major: stream next minor: stream next).
	self random: (stream next: 32).
	self sessionId: (stream next: stream next).

	suitesLength := (stream next: 2) asInteger.
	encodedSuitesStream := ReadStream on: (stream next: suitesLength).
	self cipherSuites: OrderedCollection new.
	[encodedSuitesStream atEnd] whileFalse: [
		| cipherSuiteCode cipherSuite |
		cipherSuiteCode := encodedSuitesStream next: 2.
		cipherSuite := SSLCipherSuite cipherSuiteAtCode: cipherSuiteCode.
		cipherSuite isNil 
			ifFalse: [self cipherSuites add: cipherSuite]].

	compressionMethodsLength := stream next asInteger.
	encodedCompressionMethodsStream := ReadStream on: (stream next: compressionMethodsLength).
	self compressionMethods: OrderedCollection new.
	[encodedCompressionMethodsStream atEnd] whileFalse: [
		| compressionMethod |
		compressionMethod := (encodedCompressionMethodsStream next: 2) asInteger.
		self compressionMethods add: compressionMethod]
