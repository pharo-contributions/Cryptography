printing
printOn: stream

	super printOn: stream.
	stream nextPutAll: '('.
	stream nextPutAll: self type asString.
	stream nextPutAll: ', '.
	stream nextPutAll: self version asString.
	stream nextPutAll: ', '.
	stream nextPutAll: self length asString.
	stream nextPutAll: ', '.
	stream nextPutAll: self fragment printString.
	stream nextPutAll: ')'.
