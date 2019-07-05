Class {
	#name : #ASN1AnyDefinedByType,
	#superclass : #ASN1BasicType,
	#instVars : [
		'definedBy',
		'typeMap',
		'defaultType'
	],
	#category : 'ASN1-Types'
}

{ #category : #accessing }
ASN1AnyDefinedByType >> at: key [

	^self typeMap at: key ifAbsent: [self defaultType]
]

{ #category : #accessing }
ASN1AnyDefinedByType >> at: key put: typeSpec [

	^self typeMap at: key put: (self typeFrom: typeSpec)
]

{ #category : #decoding }
ASN1AnyDefinedByType >> decodeWithDERStream: derStream [

	self error: 'must decode in the scope of a structured container'.

]

{ #category : #decoding }
ASN1AnyDefinedByType >> decodeWithDERStream: derStream owner: owner ownerType: ownerType [

	| keyValue type |
	keyValue := (ownerType elementWithSymbol: self definedBy)
		valueFrom: owner.
	type := self at: keyValue.
	^ type decodeWithDERStream: derStream.

]

{ #category : #accessing }
ASN1AnyDefinedByType >> defaultType [
	"Answer the value of defaultType"

	^ defaultType
]

{ #category : #accessing }
ASN1AnyDefinedByType >> defaultType: anObject [
	"Set the value of defaultType"

	defaultType := self typeFrom: anObject
]

{ #category : #accessing }
ASN1AnyDefinedByType >> definedBy [
	"Answer the value of definedBy"

	^ definedBy
]

{ #category : #accessing }
ASN1AnyDefinedByType >> definedBy: anObject [
	"Set the value of definedBy"

	definedBy := anObject
]

{ #category : #encoding }
ASN1AnyDefinedByType >> encode: obj withDERStream: derStream [

	self error: 'must encode in the scope of a structured container'.

]

{ #category : #encoding }
ASN1AnyDefinedByType >> encode: anObject withDERStream: derStream owner: owner ownerType: ownerType [

	| keyValue type |
	keyValue := (ownerType elementWithSymbol: self definedBy)
		valueFrom: owner.
	type := self at: keyValue.
	^ type encode: anObject withDERStream: derStream.

]

{ #category : #'initialize-release' }
ASN1AnyDefinedByType >> initialize [

	self typeMap: Dictionary new.

]

{ #category : #testing }
ASN1AnyDefinedByType >> matchesTag: anInteger [

	^ (self typeMap
		detect: [:each | each matchesTag: anInteger]
		ifNone: [nil]) notNil

]

{ #category : #accessing }
ASN1AnyDefinedByType >> typeMap [
	"Answer the value of typeMap"

	^ typeMap
]

{ #category : #accessing }
ASN1AnyDefinedByType >> typeMap: anObject [
	"Set the value of typeMap"

	typeMap := anObject
]
