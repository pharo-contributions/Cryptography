processing
parseVersion2Hello
	| byteArrayStream cipherSpecLength sessionIDLength challengeLength |
	self helloVersion: 2.
	byteArrayStream _ self rawData asByteArray readStream.
	byteArrayStream next. "get rid of first byte which should = 1".
	self protocolVersion: (byteArrayStream next: 2) hex.
	cipherSpecLength _ (byteArrayStream next: 2) asInteger.
	sessionIDLength _ (byteArrayStream next: 2) asInteger.
	challengeLength _ (byteArrayStream next: 2) asInteger.
	self cipherSuites: (byteArrayStream next: cipherSpecLength).
	self sessionID: (byteArrayStream next: sessionIDLength).
	self clientTime: (ByteArray new: 3).
	self randomBytes: ((byteArrayStream next: challengeLength) asByteArrayOfSize: 32).