process
answerClient

	self securityCoord makeServer.
	self addMsgSenderClass: SSHSendIdentification.
	self addStateClass: SSHServerWaitingForClientIdentification.
	self sendMessages.
	self transitionToNextState.
	self securityCoord pendingReadState: self securityCoord asReadSecurityState.
	self securityCoord pendingWriteState: self securityCoord asWriteSecurityState.
	self connection installWriteConnectionState.
