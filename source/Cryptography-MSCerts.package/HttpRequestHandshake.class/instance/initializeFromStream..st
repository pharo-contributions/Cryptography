initialize-release
initializeFromStream: aStream
	| aClientHello |
	stream _ aStream.
	self initRemoteAddress.
	self timestamp: Time totalSeconds.
	self header: Dictionary new.
	aClientHello _ TLSClientHello createFromStream: aStream.
	serverHello _ TLSServerHello createServerHelloFrom: aClientHello.
	certificate := TLSCertificate createFrom: self.