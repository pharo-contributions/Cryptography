Class {
	#name : #OpenPGPSymmetricKeyEncryptedSessionKeyPacket,
	#superclass : #OpenPGPPacket,
	#instVars : [
		'algorithm',
		's2kSpecifier',
		'sessionKey'
	],
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPSymmetricKeyEncryptedSessionKeyPacket >> acceptVisitor: aVisitor [
	^aVisitor handleSymmetricKeyEncryptedSessionKeyPacket: self
]

{ #category : #'as yet unclassified' }
OpenPGPSymmetricKeyEncryptedSessionKeyPacket >> cipherWithPassphrase: aString [
	| cipher |
	cipher := OpenPGPPacket symmetricKeyAlgorithmFor: algorithm.
	cipher setKey: (s2kSpecifier stringToKey: aString numBytes: cipher keySize).
	^cipher
]

{ #category : #testing }
OpenPGPSymmetricKeyEncryptedSessionKeyPacket >> isSymmetricKeyEncryptedSessionKeyPacket [
	^true
]

{ #category : #reading }
OpenPGPSymmetricKeyEncryptedSessionKeyPacket >> parseData: aStream [
	aStream next = 4 ifFalse: [self error: 'Version must be 4'].
	algorithm := aStream next.
	s2kSpecifier := aStream nextS2KSpecifier.
	aStream atEnd ifFalse: [sessionKey := aStream upToEnd]
]
