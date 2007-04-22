conn states
setPendingConnectionSecurityStates

	self protocolCap pendingReadState: self asReadSecurityState.
	self protocolCap pendingWriteState: self asWriteSecurityState.
