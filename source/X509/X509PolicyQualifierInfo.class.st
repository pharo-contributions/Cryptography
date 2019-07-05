Class {
	#name : #X509PolicyQualifierInfo,
	#superclass : #Object,
	#instVars : [
		'id',
		'qualifier'
	],
	#category : 'X509-Extensions'
}

{ #category : #accessing }
X509PolicyQualifierInfo >> id [
	"Answer the value of id"

	^ id
]

{ #category : #accessing }
X509PolicyQualifierInfo >> id: anObject [
	"Set the value of id"

	id := anObject
]

{ #category : #accessing }
X509PolicyQualifierInfo >> qualifier [
	"Answer the value of qualifier"

	^ qualifier
]

{ #category : #accessing }
X509PolicyQualifierInfo >> qualifier: anObject [
	"Set the value of qualifier"

	qualifier := anObject
]
