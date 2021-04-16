Class {
	#name : #ASN1Entity,
	#superclass : #Object,
	#instVars : [
		'symbol',
		'module'
	],
	#category : #'ASN1-Core-Types'
}

{ #category : #testing }
ASN1Entity class >> isAbstract [

	^ self == ASN1Entity
]

{ #category : #'instance creation' }
ASN1Entity class >> name: aSymbol [

	^self new
		name: aSymbol;
		yourself
]

{ #category : #'instance creation' }
ASN1Entity class >> name: aSymbol in: aModule [

	^aModule add: (self name: aSymbol)
]

{ #category : #'subtype utilities' }
ASN1Entity >> explicitSubType [

	^ (ASN1ExplicitSubType name: nil)
		parent: self;
		yourself.

]

{ #category : #'subtype utilities' }
ASN1Entity >> implicitSubType [

	^ (ASN1ImplicitSubType name: nil)
		parent: self;
		yourself.

]

{ #category : #accessing }
ASN1Entity >> module [
	"Answer the value of module"

	^ module
]

{ #category : #accessing }
ASN1Entity >> module: anObject [
	"Set the value of module"

	module := anObject
]

{ #category : #accessing }
ASN1Entity >> name [
	"Answer the value of symbol"

	^ symbol
]

{ #category : #accessing }
ASN1Entity >> name: anObject [
	"Set the value of symbol"

	symbol := anObject
]

{ #category : #private }
ASN1Entity >> typeFrom: typeSpec [

	^ self module
		ifNil: [typeSpec isBehavior
			ifTrue: [typeSpec new]
			ifFalse: [typeSpec]]
		ifNotNil: [self module typeFrom: typeSpec]
]
