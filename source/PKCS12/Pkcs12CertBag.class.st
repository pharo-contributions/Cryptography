Class {
	#name : #Pkcs12CertBag,
	#superclass : #Object,
	#instVars : [
		'certId',
		'certValue'
	],
	#category : 'PKCS12'
}

{ #category : #accessing }
Pkcs12CertBag >> certId [
	"Answer the value of certId"

	^ certId
]

{ #category : #accessing }
Pkcs12CertBag >> certId: anObject [
	"Set the value of certId"

	certId := anObject
]

{ #category : #accessing }
Pkcs12CertBag >> certValue [
	"Answer the value of certValue"

	^ certValue
]

{ #category : #accessing }
Pkcs12CertBag >> certValue: anObject [
	"Set the value of certValue"

	certValue := anObject
]
