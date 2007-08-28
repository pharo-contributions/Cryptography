process
processIdentification: msg

	self connection binary.
	self connection installReadConnectionState.	
	self addMsgSenderClass: SSHSendKeyInit.
	self addStateClass: SSHClientWaitingForKeyInit.
	^ true