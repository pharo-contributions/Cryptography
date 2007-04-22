control
installWriteConnectionState

	self pendingWriteState isNil ifTrue: [self error: 'bad pending connection write state'].
	self currentWriteState notNil 
		ifTrue: [self currentWriteState uninstallFromDuplexStack: self duplexStack].
	self currentWriteState: self pendingWriteState.
	self currentWriteState installOnDuplexStack: self duplexStack.
	self pendingWriteState: nil.
