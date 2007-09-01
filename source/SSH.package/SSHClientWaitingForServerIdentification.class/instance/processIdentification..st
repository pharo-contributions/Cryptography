process
processIdentification: msg

	self connection binary.
	self connection installReadConnectionState.
	self securityParams serverIdentification: msg.	
	self addMsgSenderClass: SSHSendKeyInit.
	self addStateClass: SSHClientWaitingForKeyInit.
	^ true