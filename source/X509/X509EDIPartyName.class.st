Class {
	#name : #X509EDIPartyName,
	#superclass : #Object,
	#instVars : [
		'nameAssigner',
		'partyName'
	],
	#category : 'X509-Extensions'
}

{ #category : #accessing }
X509EDIPartyName >> nameAssigner [
	"Answer the value of nameAssigner"

	^ nameAssigner
]

{ #category : #accessing }
X509EDIPartyName >> nameAssigner: anObject [
	"Set the value of nameAssigner"

	nameAssigner := anObject
]

{ #category : #accessing }
X509EDIPartyName >> partyName [
	"Answer the value of partyName"

	^ partyName
]

{ #category : #accessing }
X509EDIPartyName >> partyName: anObject [
	"Set the value of partyName"

	partyName := anObject
]
