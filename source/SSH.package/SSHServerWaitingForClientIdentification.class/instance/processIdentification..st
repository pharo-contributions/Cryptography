process
processIdentification: msg

	self connection binary.
	self connection installReadConnectionState.	
	self addMsgSenderClass: SSHServerSendKeyInit.
	self addStateClass: SSHServerWaitingForKeyInit.
	^ true