process
sayHelloToServer

	self securityParams makeClient.
	self addMsgSenderClass: SSLClientSendHello.
	self addStateClass: SSLClientWaitingForServerHello.
	self machine transitionToNextState.
