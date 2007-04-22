control
sendHelloRequest

	self securityParams isServer
		ifTrue: [self handshakeStateMachine sendHelloRequest].

