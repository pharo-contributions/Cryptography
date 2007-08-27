process
answerClient

	self addMsgSenderClass: SSHSendIdentification.
	self addStateClass: SSHServerWaitingForClientIdentification.
	self transitionToNextState.
	self securityCoord makeServer.
	self securityCoord securityParams bulkCipherAlgorithm: #null.
	self securityCoord securityParams packagerAlgorithm: #binary.
	self connection installWriteConnectionState.
