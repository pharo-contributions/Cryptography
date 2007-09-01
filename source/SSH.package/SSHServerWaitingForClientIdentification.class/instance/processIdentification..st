process
processIdentification: msg

	self connection binary.
	self connection installReadConnectionState.	
	self securityParams clientIdentification: msg.	
	self addMsgSenderClass: SSHSendKeyInit.
	self addStateClass: SSHServerWaitingForKeyInit.
	^ true