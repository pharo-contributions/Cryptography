Class {
	#name : #X509AnotherName,
	#superclass : #Object,
	#instVars : [
		'typeId',
		'value'
	],
	#category : 'X509-Extensions'
}

{ #category : #accessing }
X509AnotherName >> typeId [
	"Answer the value of typeId"

	^ typeId
]

{ #category : #accessing }
X509AnotherName >> typeId: anObject [
	"Set the value of typeId"

	typeId := anObject
]

{ #category : #accessing }
X509AnotherName >> value [

	^ value
]

{ #category : #accessing }
X509AnotherName >> value: anObject [
	"Set the value of value"

	value := anObject
]
