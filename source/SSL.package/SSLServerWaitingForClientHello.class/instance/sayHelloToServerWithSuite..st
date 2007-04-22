process
sayHelloToServerWithSuite: suite

	| sender |
	self securityParams makeClient.
	sender := SSLClientSendHello newOnMachine: self machine.
	sender suite: suite.
	self machine messageSenders add: sender.
	self addStateClass: SSLClientWaitingForServerHello.
	self machine transitionToNextState.
