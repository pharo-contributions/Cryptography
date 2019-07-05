Class {
	#name : #OpenPGPPublicKeyEncryptedSessionKeyPacket,
	#superclass : #OpenPGPPacket,
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPPublicKeyEncryptedSessionKeyPacket >> acceptVisitor: aVisitor [
	^aVisitor handlePublicKeyEncryptedSessionKeyPacket: self
]
