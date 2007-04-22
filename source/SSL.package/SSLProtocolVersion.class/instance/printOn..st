printing
printOn: stream

	stream nextPutAll: 'version '.
	stream nextPutAll: self major asString.
	stream nextPutAll: '.'.
	stream nextPutAll: self minor asString.
