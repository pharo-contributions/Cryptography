initialize-release
installWriteConnectionState: state

	self writeState notNil 
		ifTrue: [self writeState uninstallFromDuplexStack: self duplexStack].
	self writeState: state.
	self writeState installOnDuplexStack: self duplexStack.
