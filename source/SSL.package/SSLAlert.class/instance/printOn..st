printing
printOn: stream

	super printOn: stream.
	stream nextPutAll: '(<'.
	stream nextPutAll: self level asString.
	stream nextPutAll: '> '.
	stream nextPutAll: self descriptionCode asString.
	stream nextPutAll: ':'.
	stream nextPutAll: self description.
	stream nextPutAll: ')'.
