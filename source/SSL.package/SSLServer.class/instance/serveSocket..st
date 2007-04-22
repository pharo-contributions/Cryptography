running
serveSocket: socket

	| conn |
	conn := (SSLSocket newOnSocket: socket)
		setCertificateStore: self certificateStore;
		yourself.
	self addConnection: conn.
	self handler notNil
		ifTrue: [self handler value: conn].
	