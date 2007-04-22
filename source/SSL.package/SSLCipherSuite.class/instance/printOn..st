printing
printOn: stream

	stream nextPutAll: self hexCodeString.
	stream nextPutAll: '->'.
	stream nextPutAll: self cipherName.