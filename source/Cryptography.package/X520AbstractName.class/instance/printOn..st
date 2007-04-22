printing
printOn: stream

	stream nextPutAll: self displayName.
	stream nextPutAll: ' = '.
	self string printOn: stream.
