process
processNewKeys: msg

	self connection installReadConnectionState.
	self addStateClass: SSHEncryptedState.
	^ true.
