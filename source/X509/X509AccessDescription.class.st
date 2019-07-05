Class {
	#name : #X509AccessDescription,
	#superclass : #Object,
	#instVars : [
		'accessMethod',
		'accessLocation'
	],
	#category : 'X509-Extensions'
}

{ #category : #accessing }
X509AccessDescription >> accessLocation [
	"Answer the value of accessLocation"

	^ accessLocation
]

{ #category : #accessing }
X509AccessDescription >> accessLocation: anObject [
	"Set the value of accessLocation"

	accessLocation := anObject
]

{ #category : #accessing }
X509AccessDescription >> accessMethod [
	"Answer the value of accessMethod"

	^ accessMethod
]

{ #category : #accessing }
X509AccessDescription >> accessMethod: anObject [
	"Set the value of accessMethod"

	accessMethod := anObject
]
