Class {
	#name : #ASN1UnstructuredType,
	#superclass : #ASN1ConstructedType,
	#instVars : [
		'elementType'
	],
	#category : 'ASN1-Types'
}

{ #category : #decoding }
ASN1UnstructuredType >> decodeValueIndefiniteLengthWithDERStream: derStream [

	| coll value |
	coll := self containerClass new.
	[derStream peekTag = 0
		ifTrue: [value := ASN1EndOfIndefiniteLengthType new decodeWithDERStream: derStream]
		ifFalse: [value := self elementType decodeWithDERStream: derStream].
	value isKindOf: ASN1EndOfIndefiniteLengthMarker] 
		whileFalse: [coll add: value].
	^coll
]

{ #category : #decoding }
ASN1UnstructuredType >> decodeValueWithDERStream: derStream length: length [

	| coll end obj |
	length = -1
		ifTrue: [^ self decodeValueIndefiniteLengthWithDERStream: derStream].
	coll := self containerClass new.
	end := derStream position + length.
	[derStream position < end ] whileTrue: [
		obj := self elementType decodeWithDERStream: derStream.
		coll add: obj].
	^coll
]

{ #category : #accessing }
ASN1UnstructuredType >> elementType [
	"Answer the value of elementType"

	^ elementType
]

{ #category : #accessing }
ASN1UnstructuredType >> elementType: anObject [
	"Set the value of elementType"

	elementType := self typeFrom: anObject.

]

{ #category : #encoding }
ASN1UnstructuredType >> encodeValue: anObject withDERStream: derStream [

	anObject do: [:each |
		self elementType 
			encode: each 
			withDERStream: derStream].

]
