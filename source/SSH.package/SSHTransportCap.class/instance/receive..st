protocol
receive: msg

	self handshakeStateMachine process: msg.
	self readState incrementSequenceNumber.
