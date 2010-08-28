protocol stack
run

	self isConnected ifTrue: [self sessionNote: #connectedTo with: self name].
	super run