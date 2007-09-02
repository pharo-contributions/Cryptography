process
processDHInit: msg

	self securityCoord processClientDHInitMsg: msg.
	self addMsgSenderClass: SSHServerSendKeyExchangeDHReply.
	self addMsgSenderClass: SSHSendNewKeys.
	self addStateClass: SSHServerWaitingForNewKeys.
	^ true