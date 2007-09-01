process
callServer

	self securityCoord makeClient.
	self addMsgSenderClass: SSHSendIdentification.
	self addStateClass: SSHClientWaitingForServerIdentification.
	self transitionToNextState.
	self securityCoord pendingReadState: self securityCoord asReadSecurityState.
	self securityCoord pendingWriteState: self securityCoord asWriteSecurityState.
	self connection installWriteConnectionState.
