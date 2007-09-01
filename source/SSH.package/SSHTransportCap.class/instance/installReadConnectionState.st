states
installReadConnectionState

	self readState notNil 
		ifTrue: [self readState uninstallFromDuplexStack: self duplexStack].
	self readState: self securityCoordinator pendingReadState.
	self readState installOnDuplexStack: self duplexStack.
	self readState sequenceNumber: -1.
