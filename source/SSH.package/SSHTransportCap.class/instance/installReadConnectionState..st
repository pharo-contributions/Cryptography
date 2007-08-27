states
installReadConnectionState: state

	self readState notNil 
		ifTrue: [self readState uninstallFromDuplexStack: self duplexStack].
	self readState: state.
	self readState installOnDuplexStack: self duplexStack.
	self readState sequenceNumber: -1.
