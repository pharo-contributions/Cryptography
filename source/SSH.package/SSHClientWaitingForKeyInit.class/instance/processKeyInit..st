process
processKeyInit: msg

	self securityCoord processKeyInit: msg.
	self addMsgSenderClass: SSHClientSendKeyExchangeDHInit.
	self addStateClass: SSHClientWaitingForKeyExchangeDHReply.
	^ true