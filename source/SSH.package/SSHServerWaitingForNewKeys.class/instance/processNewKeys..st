as yet unclassified
processNewKeys: msg

	self connection installReadConnectionState.
	self addStateClass: SSHServerEncryptedState.
	^ true.
