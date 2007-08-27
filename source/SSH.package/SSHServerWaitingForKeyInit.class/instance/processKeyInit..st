process
processKeyInit: msg

	self securityCoord processKeyInit: msg.
	self addStateClass: SSHServerWaitingForKeyExchangeDHInit.
	^ true