converting
fromStream: stream

	self serverVersion: (SSLProtocolVersion major: stream next minor: stream next).
	self random: (stream next: 32).
	self sessionId: (stream next: stream next).
	self cipherSuite: (SSLCipherSuite cipherSuiteAtCode: (stream next: 2)).
	self compressionMethod: stream next.
