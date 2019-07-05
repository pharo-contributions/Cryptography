Class {
	#name : #Pkcs12CRLBag,
	#superclass : #Object,
	#instVars : [
		'crlId',
		'crlValue'
	],
	#category : 'PKCS12'
}

{ #category : #accessing }
Pkcs12CRLBag >> crlId [
	"Answer the value of crlId"

	^ crlId
]

{ #category : #accessing }
Pkcs12CRLBag >> crlId: anObject [
	"Set the value of crlId"

	crlId := anObject
]

{ #category : #accessing }
Pkcs12CRLBag >> crlValue [
	"Answer the value of crlValue"

	^ crlValue
]

{ #category : #accessing }
Pkcs12CRLBag >> crlValue: anObject [
	"Set the value of crlValue"

	crlValue := anObject
]
