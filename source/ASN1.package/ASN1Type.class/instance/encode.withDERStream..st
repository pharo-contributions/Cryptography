encoding
encode: anObject withDERStream: derStream

	| size |
	derStream nextPutTag: anObject asn1Tag.
	size := self sizeOfObject: anObject.
	derStream nextPutLength: size.
	self encodeValue: anObject withDERStream: derStream.
	^ derStream
