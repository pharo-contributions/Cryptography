Class {
	#name : #ASN1SubType,
	#superclass : #ASN1Type,
	#instVars : [
		'parent',
		'tag'
	],
	#category : 'ASN1-Types'
}

{ #category : #testing }
ASN1SubType >> isTypeFor: anObject [

	^self parent isTypeFor: anObject

]

{ #category : #testing }
ASN1SubType >> matchesTag: anInteger [

	^ ((tag bitXor: anInteger) bitAnd: 2r00011111) isZero

]

{ #category : #accessing }
ASN1SubType >> parent [
	"Answer the value of parent"

	^ parent
]

{ #category : #accessing }
ASN1SubType >> parent: anObject [
	"Set the value of parent"

	parent := self typeFrom: anObject.
]

{ #category : #accessing }
ASN1SubType >> tag [

	^ tag
]

{ #category : #accessing }
ASN1SubType >> tag: anObject [
	"Set the value of tag"

	tag := anObject
]
