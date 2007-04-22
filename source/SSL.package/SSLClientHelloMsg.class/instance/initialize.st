initialize-release
initialize

	self clientVersion: SSLProtocolVersion tls11.
	self compressionMethods: (OrderedCollection with: 0).
	self cipherSuites: OrderedCollection new.
	self sessionId: ByteArray new.
