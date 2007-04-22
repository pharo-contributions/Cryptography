control
installReadConnectionState

	self pendingReadState isNil ifTrue: [self error: 'bad pending connection read state'].
	self currentReadState notNil 
		ifTrue: [self currentReadState uninstallFromDuplexStack: self duplexStack].
	self currentReadState: self pendingReadState.
	self currentReadState installOnDuplexStack: self duplexStack.
	self currentReadState sequenceNumber: -1.
	self pendingReadState: nil.
