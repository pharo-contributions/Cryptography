Class {
	#name : #ASN1ChoiceElement,
	#superclass : #Object,
	#instVars : [
		'owner',
		'symbol',
		'type'
	],
	#category : 'ASN1-Types'
}

{ #category : #private }
ASN1ChoiceElement >> addedTo: aType [

	owner := aType.

]

{ #category : #decoding }
ASN1ChoiceElement >> decodeWithDERStream: derStream [

	| tag |
	derStream atEnd ifTrue: [^ self error: 'missing element'].
	tag := derStream peekTag.
	(self matchesTag: tag)
		ifTrue: [^ type decodeWithDERStream: derStream]
		ifFalse: [^ self error: 'bad choice'].

]

{ #category : #encoding }
ASN1ChoiceElement >> encode: anObject withDERStream: derStream [

	self type encode: anObject withDERStream: derStream.
]

{ #category : #'subtype utilities' }
ASN1ChoiceElement >> explicitTag: integer [

	self type: self type explicitSubType.
	^ self type tag: integer.

]

{ #category : #'subtype utilities' }
ASN1ChoiceElement >> implicitTag: integer [

	self type: self type implicitSubType.
	^ self type tag: integer.

]

{ #category : #testing }
ASN1ChoiceElement >> isTypeFor: anObject [

	^self type isTypeFor: anObject
]

{ #category : #testing }
ASN1ChoiceElement >> matchesTag: anInteger [

	^self type matchesTag: anInteger
]

{ #category : #accessing }
ASN1ChoiceElement >> owner [
	"Answer the value of owner"

	^ owner
]

{ #category : #accessing }
ASN1ChoiceElement >> owner: anObject [
	"Set the value of owner"

	owner := anObject
]

{ #category : #accessing }
ASN1ChoiceElement >> symbol [
	"Answer the value of symbol"

	^ symbol
]

{ #category : #accessing }
ASN1ChoiceElement >> symbol: anObject [
	"Set the value of symbol"

	symbol := anObject
]

{ #category : #accessing }
ASN1ChoiceElement >> type [
	"Answer the value of type"

	^ type
]

{ #category : #accessing }
ASN1ChoiceElement >> type: anObject [
	"Set the value of type"

	type := anObject
]
