Class {
	#name : #Pkcs12SecretBag,
	#superclass : #Object,
	#instVars : [
		'secretId',
		'secretValue'
	],
	#category : 'PKCS12'
}

{ #category : #accessing }
Pkcs12SecretBag >> secretId [
	"Answer the value of secretId"

	^ secretId
]

{ #category : #accessing }
Pkcs12SecretBag >> secretId: anObject [
	"Set the value of secretId"

	secretId := anObject
]

{ #category : #accessing }
Pkcs12SecretBag >> secretValue [
	"Answer the value of secretValue"

	^ secretValue
]

{ #category : #accessing }
Pkcs12SecretBag >> secretValue: anObject [
	"Set the value of secretValue"

	secretValue := anObject
]
