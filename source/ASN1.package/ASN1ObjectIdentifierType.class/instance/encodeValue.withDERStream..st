encoding
encodeValue: anObject withDERStream: derStream

	| bytes |
	bytes := anObject asByteArray.
	derStream nextPutAll: bytes.
	^ derStream
