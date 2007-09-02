process
processDHReply: msg

	self securityCoord processServerDHReplyMsg: msg.
	self addMsgSenderClass: SSHSendNewKeys.
	self addStateClass: SSHClientWaitingForNewKeys.
	^ true