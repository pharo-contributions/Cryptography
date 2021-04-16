Class {
	#name : #ASN1StructureElement,
	#superclass : #ASN1ChoiceElement,
	#instVars : [
		'default',
		'optional'
	],
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1StructureElement >> decode: aTarget withDERStream: derStream [

	| tag val |
	derStream atEnd ifTrue: [ 
		self hasDefault ifTrue: [ ^ self value: self default into: aTarget ].
		self isOptional ifTrue: [ ^ self ].
		^ self error: 'missing element' ].
	tag := derStream peekTag.
	(self matchesTag: tag)
		ifTrue: [ 
			val := type
				       decodeWithDERStream: derStream
				       owner: aTarget
				       ownerType: self owner.
			self value: val into: aTarget.
			^ val ]
		ifFalse: [ 
			self hasDefault ifTrue: [ ^ self value: self default into: aTarget ].
			self isOptional ifTrue: [ ^ self ].
			^ self error: 'missing element' ]
]

{ #category : #accessing }
ASN1StructureElement >> default [
	"Answer the value of default"

	^ default
]

{ #category : #accessing }
ASN1StructureElement >> default: anObject [
	"Set the value of default"

	default := anObject
]

{ #category : #encoding }
ASN1StructureElement >> encode: anObject withDERStream: derStream [

	| val |
	val := self valueFrom: anObject.
	(val == nil and: [ self isOptional ]) ifTrue: [ ^ self ].
	(self hasDefault and: [ self default = val ]) ifTrue: [ ^ self ].
	self type
		encode: val
		withDERStream: derStream
		owner: anObject
		ownerType: self owner
]

{ #category : #testing }
ASN1StructureElement >> hasDefault [

	^ self default notNil
]

{ #category : #testing }
ASN1StructureElement >> hasDefaultOrIsOptional [

	^ self default notNil or: [ self optional ]
]

{ #category : #'initialize-release' }
ASN1StructureElement >> initialize [

	self optional: false
]

{ #category : #testing }
ASN1StructureElement >> isOptional [

	^ self optional
]

{ #category : #testing }
ASN1StructureElement >> isTypeFor: anObject [

	| val |
	val := self valueFrom: anObject.
	^self type isTypeFor: val
]

{ #category : #decoding }
ASN1StructureElement >> mutator [

	^(self symbol copyWith: $:) asSymbol
]

{ #category : #accessing }
ASN1StructureElement >> optional [
	"Answer the value of optional"

	^ optional
]

{ #category : #accessing }
ASN1StructureElement >> optional: anObject [
	"Set the value of optional"

	optional := anObject
]

{ #category : #decoding }
ASN1StructureElement >> value: aValue into: anObject [

	anObject perform: self mutator with: aValue
]

{ #category : #encoding }
ASN1StructureElement >> valueFrom: anObject [

	^ anObject perform: self symbol
]
