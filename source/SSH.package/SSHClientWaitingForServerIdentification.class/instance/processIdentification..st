process
processIdentification: msg

	self connection binary.
	self connection installReadConnectionState.	
	self addMsgSenderClass: SSHClientSendKeyInit.
	self addStateClass: SSHClientWaitingForKeyInit.
	^ true