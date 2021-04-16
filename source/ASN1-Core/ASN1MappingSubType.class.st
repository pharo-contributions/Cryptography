Class {
	#name : #ASN1MappingSubType,
	#superclass : #ASN1SubType,
	#instVars : [
		'mapping',
		'mappingSymbol'
	],
	#category : #'ASN1-Core-Types'
}

{ #category : #accessing }
ASN1MappingSubType >> accessor [

	^self mappingSymbol
]

{ #category : #decoding }
ASN1MappingSubType >> decodeWithDERStream: derStream [

	| target val |
	target := self mapping new.
	val := self parent decodeWithDERStream: derStream.
	target perform: self mutator with: val.
	^ target

]

{ #category : #decoding }
ASN1MappingSubType >> decodeWithDERStream: derStream owner: owner ownerType: ownerType [

	| target val |
	target := self mapping new.
	val := self parent
		decodeWithDERStream: derStream 
		owner: owner 
		ownerType: ownerType.
	target perform: self mutator with: val.
	^ target

]

{ #category : #encoding }
ASN1MappingSubType >> encode: anObject withDERStream: derStream [

	^ self parent
		encode: (anObject perform: self accessor)
		withDERStream: derStream 

]

{ #category : #encoding }
ASN1MappingSubType >> encode: anObject withDERStream: derStream owner: owner ownerType: ownerType [

	^ self parent
		encode: (anObject perform: self accessor) 
		withDERStream: derStream 
		owner: owner 
		ownerType: ownerType

]

{ #category : #accessing }
ASN1MappingSubType >> mapping [
	"Answer the value of mapping"

	^ mapping
]

{ #category : #accessing }
ASN1MappingSubType >> mapping: anObject [
	"Set the value of mapping"

	mapping := anObject
]

{ #category : #accessing }
ASN1MappingSubType >> mapping: aClass mappingSymbol: aSymbol type: aType [

	self mapping: aClass.
	self mappingSymbol: aSymbol.
	self parent: aType
]

{ #category : #accessing }
ASN1MappingSubType >> mappingSymbol [
	"Answer the value of mappingSymbol"

	^ mappingSymbol
]

{ #category : #accessing }
ASN1MappingSubType >> mappingSymbol: anObject [
	"Set the value of mappingSymbol"

	mappingSymbol := anObject
]

{ #category : #testing }
ASN1MappingSubType >> matchesTag: anInteger [

	^ self parent matchesTag: anInteger
]

{ #category : #accessing }
ASN1MappingSubType >> mutator [

	^ (self mappingSymbol copyWith: $:) asSymbol
]
