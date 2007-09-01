states
installWriteConnectionState

	self writeState notNil 
		ifTrue: [self writeState uninstallFromDuplexStack: self duplexStack].
	self writeState: self securityCoordinator pendingWriteState.
	self writeState installOnDuplexStack: self duplexStack.
