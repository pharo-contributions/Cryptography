encoding
encodeValue: anObject withDERStream: derStream

	derStream nextPutAll: anObject tagValue.
