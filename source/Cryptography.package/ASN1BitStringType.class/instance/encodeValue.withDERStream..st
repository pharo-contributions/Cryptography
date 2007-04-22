encoding
encodeValue: anObject withDERStream: derStream

	derStream 
		nextPut: anObject bitsPadding;
		nextPutAll: anObject bytes asByteArray.
