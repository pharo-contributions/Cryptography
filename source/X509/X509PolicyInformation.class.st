Class {
	#name : #X509PolicyInformation,
	#superclass : #Object,
	#instVars : [
		'id',
		'qualifiers'
	],
	#category : 'X509-Extensions'
}

{ #category : #accessing }
X509PolicyInformation >> id [
	"Answer the value of id"

	^ id
]

{ #category : #accessing }
X509PolicyInformation >> id: anObject [
	"Set the value of id"

	id := anObject
]

{ #category : #accessing }
X509PolicyInformation >> qualifiers [
	"Answer the value of qualifiers"

	^ qualifiers
]

{ #category : #accessing }
X509PolicyInformation >> qualifiers: anObject [
	"Set the value of qualifiers"

	qualifiers := anObject
]
