process
processHelloRequestMsg: msg

	self addMsgSenderClass: SSLClientSendHello.
	self machine addStateClass: SSLClientWaitingForServerHello.
