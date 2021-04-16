Class {
	#name : #ASN1OctetsType,
	#superclass : #ASN1BasicType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1OctetsType >> decodeConstructedValueWithDERStream: derStream length: length [

	| octets stopPosition |
	length = -1
		ifTrue: [^ self decodeValueIndefiniteLengthWithDERStream: derStream].
	octets := self octetsClass new.
	stopPosition := derStream position + length.
	[derStream position < stopPosition] whileTrue: [
		octets := octets, (self decodeWithDERStream: derStream)].
	^ octets
]

{ #category : #decoding }
ASN1OctetsType >> decodeValueIndefiniteLengthWithDERStream: derStream [

	| octets value |
	octets := self octetsClass new.
	[derStream peekTag = 0
		ifTrue: [value := ASN1EndOfIndefiniteLengthType new decodeWithDERStream: derStream]
		ifFalse: [value := self decodeWithDERStream: derStream].
	value isKindOf: ASN1EndOfIndefiniteLengthMarker] whileFalse: [
		octets := octets, value].
	^ octets
]

{ #category : #decoding }
ASN1OctetsType >> decodeWithDERStream: derStream [

	| tag numericTag object |
	tag := derStream peekTag.
	numericTag := tag bitAnd: 2r00011111.
	numericTag = (self asn1Tag bitAnd: 2r00011111)
		ifFalse: [self error: 'asn1 decoder: bad tag'].
	derStream nextTag.
	(tag bitAnd: 2r00100000) > 0
		ifTrue: [object := self 
			decodeConstructedValueWithDERStream: derStream 
			length: derStream nextLength]
		ifFalse: [object := self 
			decodeValueWithDERStream: derStream 
			length: derStream nextLength].
	^ object
]

{ #category : #accessing }
ASN1OctetsType >> octetsClass [

	^ self subclassResponsibility
]
