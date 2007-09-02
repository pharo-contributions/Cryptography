states
installReadConnectionState

	self readState notNil  
		ifTrue: [
			self readState uninstallFromDuplexStack: self duplexStack.
			self securityCoordinator pendingReadState sequenceNumber: self readState sequenceNumber]
		ifFalse: [self securityCoordinator pendingReadState sequenceNumber: -1].
	self readState: self securityCoordinator pendingReadState.
	self readState installOnDuplexStack: self duplexStack.
