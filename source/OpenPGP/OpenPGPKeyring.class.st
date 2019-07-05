"
Istances of this class store PGP keyrings.

Instance Variables:
entries	<Dictionary of: String->OpenPGPKeyringEntry>	entries keyed by key ID (16-byte hex string)
"
Class {
	#name : #OpenPGPKeyring,
	#superclass : #Object,
	#instVars : [
		'entries'
	],
	#category : 'OpenPGP-Core'
}

{ #category : #accessing }
OpenPGPKeyring >> entries [
	^entries
]

{ #category : #accessing }
OpenPGPKeyring >> keysWithID: aKeyID [
	^entries select: [:each | each packets first keyID = aKeyID]
]

{ #category : #accessing }
OpenPGPKeyring >> keysWithUserIDMatching: aString [
	^entries select: [:each | (each packets
							detect: [:pack | pack isUserIDPacket and: [aString match: pack data asString]]
							ifNone: []) notNil]
]

{ #category : #reading }
OpenPGPKeyring >> readFrom: aStream [
	| packet entry |
	entries := OrderedCollection new.
	[aStream atEnd] whileFalse: [
		packet := aStream nextPacket.
		packet isKeyPacket
			ifTrue: [packet owner: self. entries add: (entry := packet)]
			ifFalse: [(entry add: packet) ifFalse: [self halt]]].
	entries := entries asSortedCollection: [:a :b | a userIDString < b userIDString]
]
