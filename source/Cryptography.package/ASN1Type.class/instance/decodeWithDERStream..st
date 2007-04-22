decoding
decodeWithDERStream: derStream

	| tag |
	tag := derStream nextTag.
	(self matchesTag: tag)
		ifFalse: [self error: 'asn1 decoder: bad tag'].
	^ self 
		decodeValueWithDERStream: derStream 
		length: derStream nextLength.
	
