Class {
	#name : #ASN1StructuredType,
	#superclass : #ASN1ConstructedType,
	#instVars : [
		'elements'
	],
	#category : 'ASN1-Types'
}

{ #category : #'accessing - element construction' }
ASN1StructuredType >> add: aSymbol type: type [

	^self addElement: (
		self newElement
			symbol: aSymbol;
			type: (self typeFrom: type))
]

{ #category : #'accessing - element construction' }
ASN1StructuredType >> add: aSymbol type: type explicitTag: integer [

	^(self add: aSymbol type: type)
		explicitTag: integer;
		yourself.

]

{ #category : #'accessing - element construction' }
ASN1StructuredType >> add: aSymbol type: type implicitTag: integer [

	^(self add: aSymbol type: type)
		implicitTag: integer;
		yourself.

]

{ #category : #private }
ASN1StructuredType >> addElement: element [

	self elements addLast: element.
	element addedTo: self.
	^element
]

{ #category : #accessing }
ASN1StructuredType >> elementWithSymbol: aSymbol [

	^ self elements
		detect: [:each | each symbol == aSymbol]
		ifNone: [self error: 'no element specified in structured type'].

]

{ #category : #accessing }
ASN1StructuredType >> elements [
	"Answer the value of elements"

	^ elements
]

{ #category : #accessing }
ASN1StructuredType >> elements: anObject [
	"Set the value of elements"

	elements := anObject
]

{ #category : #accessing }
ASN1StructuredType >> hasElements [

	^ self elements notEmpty
]

{ #category : #'initialize-release' }
ASN1StructuredType >> initialize [

	super initialize.
	self elements: (OrderedCollection new: 5).

]

{ #category : #private }
ASN1StructuredType >> newElement [

	^ ASN1StructureElement new
]
