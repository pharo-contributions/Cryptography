Class {
	#name : #ASN1UnmappedType,
	#superclass : #ASN1ConstructedType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1UnmappedType >> decodeValueIndefiniteLengthWithDERStream: derStream [

	| coll value |
	coll := self containerClass new.
	[derStream peekTag = 0
		ifTrue: [value := ASN1EndOfIndefiniteLengthType new decodeWithDERStream: derStream]
		ifFalse: [value := derStream decode].
	value isKindOf: ASN1EndOfIndefiniteLengthMarker] 
		whileFalse: [coll add: value].
	^coll
]

{ #category : #decoding }
ASN1UnmappedType >> decodeValueWithDERStream: derStream length: length [

	| coll end obj |
	length = -1
		ifTrue: [^ self decodeValueIndefiniteLengthWithDERStream: derStream].
	coll := self containerClass new.
	end := derStream position + length.
	[derStream position < end ] whileTrue: [
		obj := derStream decode.
		coll add: obj].
	^coll
]

{ #category : #encoding }
ASN1UnmappedType >> encodeValue: anObject withDERStream: derStream [

	anObject do: [:each |
		derStream encode: each].

]
