encoding
encode: anObject withDERStream: derStream

	| tempStream |
	derStream nextPutTag: (self asn1Tag bitOr: 160).
	tempStream := derStream newStream.
	self parent encode: anObject withDERStream: tempStream.
	derStream nextPutLength: tempStream size.
	derStream nextPutAll: tempStream contents.
