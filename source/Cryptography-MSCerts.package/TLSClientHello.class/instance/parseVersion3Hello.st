processing
parseVersion3Hello
	| byteArrayStream |
	self helloVersion: 3. 
	byteArrayStream _ self rawData asByteArray readStream.
	byteArrayStream next: 4."version and size"
	byteArrayStream next: 1. "should = 1 hello"
	byteArrayStream next: 3. "bytes left"
	self protocolVersion: (byteArrayStream next: 2) hex.
	self clientTime: (byteArrayStream next: 4).
	self randomBytes: (byteArrayStream next: 28).
	self sessionID: (byteArrayStream next: ((byteArrayStream next) asInteger)).
	self cipherSuites: (byteArrayStream next: ((byteArrayStream next: 2) asInteger)).
	self compressionMethods: (byteArrayStream next: (byteArrayStream next asInteger)).
	byteArrayStream atEnd ifFalse: [
		self extensions addAll: (TLSHelloExtension parseExtensionsFrom: byteArrayStream for: self).
	].