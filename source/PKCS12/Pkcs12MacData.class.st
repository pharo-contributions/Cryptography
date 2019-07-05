Class {
	#name : #Pkcs12MacData,
	#superclass : #Object,
	#instVars : [
		'mac',
		'macSalt',
		'iterations'
	],
	#category : 'PKCS12'
}

{ #category : #accessing }
Pkcs12MacData >> iterations [
	"Answer the value of iterations"

	^ iterations
]

{ #category : #accessing }
Pkcs12MacData >> iterations: anObject [
	"Set the value of iterations"

	iterations := anObject
]

{ #category : #accessing }
Pkcs12MacData >> mac [
	"Answer the value of mac"

	^ mac
]

{ #category : #accessing }
Pkcs12MacData >> mac: anObject [
	"Set the value of mac"

	mac := anObject
]

{ #category : #accessing }
Pkcs12MacData >> macSalt [
	"Answer the value of macSalt"

	^ macSalt
]

{ #category : #accessing }
Pkcs12MacData >> macSalt: anObject [
	"Set the value of macSalt"

	macSalt := anObject
]
