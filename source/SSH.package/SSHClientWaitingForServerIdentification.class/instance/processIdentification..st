process
processIdentification: msg

	self connection installReadConnectionState.
	self securityParams serverIdentification: msg.	
	self addMsgSenderClass: SSHSendKeyInit.
	self addStateClass: SSHClientWaitingForKeyInit.
	^ true