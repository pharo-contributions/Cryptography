Class {
	#name : #ASN1MappedType,
	#superclass : #ASN1StructuredType,
	#instVars : [
		'mapping'
	],
	#category : #'ASN1-Core-Types'
}

{ #category : #testing }
ASN1MappedType class >> isAbstract [

	^ self == ASN1StructuredType
]

{ #category : #'accessing - element construction' }
ASN1MappedType >> add: aSymbol type: type default: anObject [

	^(self add: aSymbol type: type)
		default: anObject;
		yourself.

]

{ #category : #'accessing - element construction' }
ASN1MappedType >> add: aSymbol type: type explicitTag: integer default: anObject [

	^(self add: aSymbol type: type explicitTag: integer)
		default: anObject;
		yourself.

]

{ #category : #'accessing - element construction' }
ASN1MappedType >> add: aSymbol type: type implicitTag: integer default: anObject [

	^(self add: aSymbol type: type implicitTag: integer)
		default: anObject;
		yourself.

]

{ #category : #'accessing - element construction' }
ASN1MappedType >> addOptional: aSymbol type: type [

	^(self add: aSymbol type: type)
		optional: true;
		yourself.

]

{ #category : #'accessing - element construction' }
ASN1MappedType >> addOptional: aSymbol type: type default: anObject [

	^(self add: aSymbol type: type)
		optional: true;
		default: anObject;
		yourself.

]

{ #category : #'accessing - element construction' }
ASN1MappedType >> addOptional: aSymbol type: type explicitTag: integer [

	^(self add: aSymbol type: type explicitTag: integer)
		optional: true;
		yourself.

]

{ #category : #'accessing - element construction' }
ASN1MappedType >> addOptional: aSymbol type: type implicitTag: integer [

	^(self add: aSymbol type: type implicitTag: integer)
		optional: true;
		yourself.

]

{ #category : #decoding }
ASN1MappedType >> decodeValueIndefiniteLengthWithDERStream: derStream [

	| target elementStream ele value |
	target := self mapping new.
	elementStream := self elements readStream.
	[derStream peekTag = 0
		ifTrue: [value := ASN1EndOfIndefiniteLengthType new decodeWithDERStream: derStream]
		ifFalse: [value := elementStream next decode: target withDERStream: derStream].
	value isKindOf: ASN1EndOfIndefiniteLengthMarker] whileFalse.
	[elementStream atEnd] 
		whileFalse: [
			ele := elementStream next.
			ele hasDefault ifTrue: [ele value: ele default into: target].
			ele hasDefaultOrIsOptional
				ifFalse: [self error: 'missing element'] ].
	^ target

]

{ #category : #decoding }
ASN1MappedType >> decodeValueWithDERStream: derStream length: length [

	| stopPosition target elementStream ele |
	length = -1
		ifTrue: [^ self decodeValueIndefiniteLengthWithDERStream: derStream].
	stopPosition := derStream position + length.
	target := self mapping new.
	elementStream := self elements readStream.
	[elementStream atEnd or: [derStream position >= stopPosition]] 
		whileFalse: [
			ele := elementStream next.
			ele decode: target withDERStream: derStream].
	[elementStream atEnd] 
		whileFalse: [
			ele := elementStream next.
			ele hasDefault ifTrue: [ele value: ele default into: target].
			ele hasDefaultOrIsOptional
				ifFalse: [self error: 'missing element'] ].
	derStream position < stopPosition ifTrue: [self error: 'invalid length'].
	^ target

]

{ #category : #encoding }
ASN1MappedType >> encodeValue: anObject withDERStream: derStream [

	self elements do: [:each |
		each encode: anObject withDERStream: derStream].

]

{ #category : #testing }
ASN1MappedType >> isTypeFor: anObject [

	^ self mapping notNil 
		ifTrue: [anObject isKindOf: self mapping]
		ifFalse: [anObject asn1Tag = self tag]

]

{ #category : #accessing }
ASN1MappedType >> mapping [
	"Answer the value of mapping"

	^ mapping
]

{ #category : #accessing }
ASN1MappedType >> mapping: anObject [
	"Set the value of mapping"

	mapping := anObject
]
