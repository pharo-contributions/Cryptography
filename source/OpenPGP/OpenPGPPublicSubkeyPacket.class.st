Class {
	#name : #OpenPGPPublicSubkeyPacket,
	#superclass : #OpenPGPPacket,
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPPublicSubkeyPacket >> acceptVisitor: aVisitor [
	^aVisitor handlePublicSubkeyPacket: self
]

{ #category : #testing }
OpenPGPPublicSubkeyPacket >> canBeAddedTo: aPacket [
	^aPacket isPublicKeyPacket
]

{ #category : #testing }
OpenPGPPublicSubkeyPacket >> isSubkeyPacket [
	^true
]
