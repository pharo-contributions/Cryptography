Class {
	#name : #X509Validity,
	#superclass : #Object,
	#instVars : [
		'notBefore',
		'notAfter'
	],
	#category : 'X509'
}

{ #category : #accessing }
X509Validity >> notAfter [
	"Answer the value of notAfter"

	^ notAfter
]

{ #category : #accessing }
X509Validity >> notAfter: anObject [
	"Set the value of notAfter"

	notAfter := anObject
]

{ #category : #accessing }
X509Validity >> notBefore [
	"Answer the value of notBefore"

	^ notBefore
]

{ #category : #accessing }
X509Validity >> notBefore: anObject [
	"Set the value of notBefore"

	notBefore := anObject
]
