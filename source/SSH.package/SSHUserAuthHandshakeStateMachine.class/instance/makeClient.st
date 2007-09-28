process
makeClient

	self addStateClass: SSHUserAuthClientWaitingForResponse.
	self transitionToNextState.
