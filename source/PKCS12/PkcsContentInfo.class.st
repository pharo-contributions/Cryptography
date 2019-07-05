Class {
	#name : #PkcsContentInfo,
	#superclass : #Object,
	#instVars : [
		'contentType',
		'content'
	],
	#category : 'PKCS12'
}

{ #category : #accessing }
PkcsContentInfo >> content [
	"Answer the value of content"

	^ content
]

{ #category : #accessing }
PkcsContentInfo >> content: anObject [
	"Set the value of content"

	content := anObject
]

{ #category : #accessing }
PkcsContentInfo >> contentType [
	"Answer the value of contentType"

	^ contentType
]

{ #category : #accessing }
PkcsContentInfo >> contentType: anObject [
	"Set the value of contentType"

	contentType := anObject
]
