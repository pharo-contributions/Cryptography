Class {
	#name : #OpenPGPSecretSubkeyPacket,
	#superclass : #OpenPGPPacket,
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPSecretSubkeyPacket >> acceptVisitor: aVisitor [
	^aVisitor handleSecretSubkeyPacket: self
]
