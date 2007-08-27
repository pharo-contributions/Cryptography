protocol
receive: msg

	self handshakeStateMachine process: msg.
