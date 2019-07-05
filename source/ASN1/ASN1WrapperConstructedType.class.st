Class {
	#name : #ASN1WrapperConstructedType,
	#superclass : #ASN1WrapperType,
	#category : 'ASN1-Types'
}

{ #category : #decoding }
ASN1WrapperConstructedType >> decodeValueIndefiniteLengthWithDERStream: derStream [

	| contextValue sequence value |
	contextValue := ASN1ExplicitContextValue new.
	contextValue tagIndex: (derStream currentTag bitAnd: 2r00011111).
	contextValue tagIsPrimitive: false.
	sequence := OrderedCollection new.
	[derStream peekTag = 0
		ifTrue: [value := ASN1EndOfIndefiniteLengthType new decodeWithDERStream: derStream]
		ifFalse: [value := derStream decode].
	value isKindOf: ASN1EndOfIndefiniteLengthMarker] 
		whileFalse: [sequence add: value].
	contextValue tagValue: sequence.
	^contextValue
	

]

{ #category : #decoding }
ASN1WrapperConstructedType >> decodeValueWithDERStream: derStream length: length [

	| aValue sequence stopPosition |
	length = -1
		ifTrue: [^ self decodeValueIndefiniteLengthWithDERStream: derStream].
	aValue := ASN1ExplicitContextValue new.
	aValue tagIndex: (derStream currentTag bitAnd: 2r00011111).
	aValue tagIsPrimitive: false.
	sequence := OrderedCollection new.
	stopPosition := derStream position + length.
	[derStream position < stopPosition] whileTrue: [
		sequence add: derStream decode].
	aValue tagValue: sequence.
	^aValue
	

]

{ #category : #encoding }
ASN1WrapperConstructedType >> encodeValue: anObject withDERStream: derStream [

	anObject tagValue do: [:each |
		derStream encode: each].
	

]

{ #category : #encoding }
ASN1WrapperConstructedType >> sizeOfObject: anObject [

	| derStream |
	derStream := ASN1Stream new.
	anObject tagValue do: [:each |
		derStream encode: each].
	^ derStream size
]
