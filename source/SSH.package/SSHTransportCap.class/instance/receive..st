protocol
receive: msg

	msg type >= 50
		ifTrue: [self isEncrypted
			ifTrue: [self basicReceive: msg]
			ifFalse: [self error: 'bad msg number']]
		ifFalse: [self handshakeStateMachine process: msg].
	self readState ifNotNil: [self readState incrementSequenceNumber].
