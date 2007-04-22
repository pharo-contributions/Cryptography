encoding
encode: anObject withDERStream: derStream
	"For a speedup"

	| bytes |
	derStream nextPutTag: anObject asn1Tag.
	bytes := anObject asByteArray.
	derStream nextPutLength: bytes size.
	derStream nextPutAll: bytes.
	^ derStream
