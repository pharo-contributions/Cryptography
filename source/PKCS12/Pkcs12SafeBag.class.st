Class {
	#name : #Pkcs12SafeBag,
	#superclass : #Object,
	#instVars : [
		'bagId',
		'bagValue',
		'bagAttributes'
	],
	#category : 'PKCS12'
}

{ #category : #accessing }
Pkcs12SafeBag >> bagAttributes [
	"Answer the value of bagAttributes"

	^ bagAttributes
]

{ #category : #accessing }
Pkcs12SafeBag >> bagAttributes: anObject [
	"Set the value of bagAttributes"

	bagAttributes := anObject
]

{ #category : #accessing }
Pkcs12SafeBag >> bagId [
	"Answer the value of bagId"

	^ bagId
]

{ #category : #accessing }
Pkcs12SafeBag >> bagId: anObject [
	"Set the value of bagId"

	bagId := anObject
]

{ #category : #accessing }
Pkcs12SafeBag >> bagValue [
	"Answer the value of bagValue"

	^ bagValue
]

{ #category : #accessing }
Pkcs12SafeBag >> bagValue: anObject [
	"Set the value of bagValue"

	bagValue := anObject
]
