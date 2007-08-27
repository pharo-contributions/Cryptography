process
close

	super close.
	self connection ifNotNil: [
		self connection switchToClosed.
	].
	self connection: nil.
	self handshakeStateMachine: nil.
	self securityCoordinator: nil.
	self readState: nil.
	self writeState: nil.
