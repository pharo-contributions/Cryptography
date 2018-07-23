encoding
encode: anObject withDERStream: derStream

	| tempStream |
	derStream nextPutTag: self asn1Tag.
	tempStream := derStream newStream.
	self encodeValue: anObject withDERStream: tempStream.
	derStream nextPutLength: tempStream size.
	derStream nextPutAll: tempStream contents.
	^ derStream
