printing
printOn: stream

	super printOn: stream.
	stream nextPutAll: '('.
	stream nextPutAll: self fragment asArray asString.
	stream nextPutAll: ')'.
