Class {
	#name : #ASN1AbstractString,
	#superclass : #ASN1Value,
	#instVars : [
		'string'
	],
	#category : #'ASN1-Core-Objects'
}

{ #category : #'as yet unclassified' }
ASN1AbstractString class >> fromString: aString [

	^ self new
		string: aString;
		yourself
]

{ #category : #testing }
ASN1AbstractString class >> isAbstract [

	^ self == ASN1AbstractString
]

{ #category : #printing }
ASN1AbstractString >> , aString [

	^ self class new
		string: self string, aString string;
		yourself

]

{ #category : #printing }
ASN1AbstractString >> = aString [

	^ self asString = aString asString

]

{ #category : #printing }
ASN1AbstractString >> asString [

	^ self string
]

{ #category : #printing }
ASN1AbstractString >> hash [

	^ self asString hash
]

{ #category : #initialization }
ASN1AbstractString >> initialize [

	self string: ''
]

{ #category : #printing }
ASN1AbstractString >> printOn: aStream [

	self string printOn: aStream
]

{ #category : #accessing }
ASN1AbstractString >> string [
	"Answer the value of string"

	^ string
]

{ #category : #accessing }
ASN1AbstractString >> string: anObject [
	"Set the value of string"

	string := anObject
]
