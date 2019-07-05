Class {
	#name : #X509GeneralSubtree,
	#superclass : #Object,
	#instVars : [
		'base',
		'minimum',
		'maximum'
	],
	#category : 'X509-Extensions'
}

{ #category : #accessing }
X509GeneralSubtree >> base [
	"Answer the value of base"

	^ base
]

{ #category : #accessing }
X509GeneralSubtree >> base: anObject [
	"Set the value of base"

	base := anObject
]

{ #category : #accessing }
X509GeneralSubtree >> maximum [
	"Answer the value of maximum"

	^ maximum
]

{ #category : #accessing }
X509GeneralSubtree >> maximum: anObject [
	"Set the value of maximum"

	maximum := anObject
]

{ #category : #accessing }
X509GeneralSubtree >> minimum [
	"Answer the value of minimum"

	^ minimum
]

{ #category : #accessing }
X509GeneralSubtree >> minimum: anObject [
	"Set the value of minimum"

	minimum := anObject
]
