Class {
	#name : #ASN1TestModel,
	#superclass : #Object,
	#instVars : [
		'testSlot1',
		'testSlot2'
	],
	#category : #'ASN1-Core-Tests-Utilities'
}

{ #category : #accessing }
ASN1TestModel >> testSlot1 [
	"Answer the value of testSlot1"

	^ testSlot1
]

{ #category : #accessing }
ASN1TestModel >> testSlot1: anObject [
	"Set the value of testSlot1"

	testSlot1 := anObject
]

{ #category : #accessing }
ASN1TestModel >> testSlot2 [
	"Answer the value of testSlot2"

	^ testSlot2
]

{ #category : #accessing }
ASN1TestModel >> testSlot2: anObject [
	"Set the value of testSlot2"

	testSlot2 := anObject
]
