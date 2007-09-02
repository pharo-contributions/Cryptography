states
installWriteConnectionState

	self writeState notNil 
		ifTrue: [
			self writeState uninstallFromDuplexStack: self duplexStack.
			self securityCoordinator pendingWriteState sequenceNumber: self writeState sequenceNumber]
		ifFalse: [self securityCoordinator pendingWriteState sequenceNumber: -1].
	self writeState: self securityCoordinator pendingWriteState.
	self writeState installOnDuplexStack: self duplexStack.
