process
processDHReply: msg

self halt.
	self securityCoord processServerDHReplyMsg: msg.
	self addMsgSenderClass: SSHSendNewKeys.
	self addStateClass: SSHWaitingForNewKeys.
	^ true