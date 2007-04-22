decoding
decodeValueIndefiniteLengthWithDERStream: derStream

	| coll value |
	coll := self containerClass new.
	[derStream peekTag = 0
		ifTrue: [value := ASN1EndOfIndefiniteLengthType new decodeWithDERStream: derStream]
		ifFalse: [value := self elementType decodeWithDERStream: derStream].
	value isKindOf: ASN1EndOfIndefiniteLengthMarker] 
		whileFalse: [coll add: value].
	^coll