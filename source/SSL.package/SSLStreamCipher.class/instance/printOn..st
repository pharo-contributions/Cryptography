as yet unclassified
printOn: stream

	super printOn: stream.
	stream nextPutAll: '('.
	stream nextPutAll: self content printString.
	stream nextPutAll: ', '.
	stream nextPutAll: self mac printString.
	stream nextPutAll: ')'.
