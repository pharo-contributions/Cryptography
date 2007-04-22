tracing
printOn: stream

	super printOn: stream.
	stream nextPutAll: ' - '.
	self isClosed ifTrue: [stream nextPutAll: 'Closed'].
	self isConnected ifTrue: [stream nextPutAll: 'Connected'].
	self isConnecting ifTrue: [stream nextPutAll: 'Connecting'].
