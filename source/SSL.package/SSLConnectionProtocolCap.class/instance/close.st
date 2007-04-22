control
close

	super close.
	self connection ifNotNil: [
		self connection switchToClosed.
	].
	self connection: nil.
	self handshakeStateMachine: nil.
	self securityParams: nil.
	self securityCoordinator: nil.
	self currentReadState: nil.
	self currentWriteState: nil.
	self pendingReadState: nil.
	self pendingWriteState: nil.
