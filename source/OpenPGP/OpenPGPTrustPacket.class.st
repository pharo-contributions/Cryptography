Class {
	#name : #OpenPGPTrustPacket,
	#superclass : #OpenPGPPacket,
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPTrustPacket >> acceptVisitor: aVisitor [
	^aVisitor handleTrustPacket: self
]

{ #category : #testing }
OpenPGPTrustPacket >> canBeAddedTo: aPacket [
	^aPacket isSignaturePacket
]

{ #category : #testing }
OpenPGPTrustPacket >> isTrustPacket [
	^true
]
