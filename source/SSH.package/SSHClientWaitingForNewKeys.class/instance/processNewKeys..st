as yet unclassified
processNewKeys: msg

	self connection installReadConnectionState.
	self addStateClass: SSHClientEncryptedState.
	^ true.
