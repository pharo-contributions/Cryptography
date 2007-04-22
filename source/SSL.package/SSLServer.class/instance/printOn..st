initialize-release
printOn: stream

	super printOn: stream.
	stream nextPutAll: ' - '.
	self listener isRunning
		ifTrue: [stream nextPutAll: '[running]']
		ifFalse: [stream nextPutAll: '[stopped]'].
