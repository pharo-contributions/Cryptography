process
callServer

	self addMsgSenderClass: SSHSendIdentification.
	self addStateClass: SSHClientWaitingForServerIdentification.
	self transitionToNextState.
	self securityCoord makeClient.
	self securityCoord securityParams bulkCipherAlgorithm: #null.
	self securityCoord securityParams packagerAlgorithm: #binary.
	self connection installWriteConnectionState.
