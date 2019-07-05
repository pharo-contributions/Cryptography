Class {
	#name : #OpenPGPOnePassSignaturePacket,
	#superclass : #OpenPGPPacket,
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPOnePassSignaturePacket >> acceptVisitor: aVisitor [
	^aVisitor handleOpenPassSignaturePacket: self
]
