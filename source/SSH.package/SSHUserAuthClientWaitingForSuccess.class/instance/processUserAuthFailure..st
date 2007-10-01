process
processUserAuthFailure: msg

	self addStateClass: SSHUserAuthClientWaitingForResponse.
	^ true