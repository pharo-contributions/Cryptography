Class {
	#name : #OpenPGPUserIDPacket,
	#superclass : #OpenPGPPacket,
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPUserIDPacket >> acceptVisitor: aVisitor [
	^aVisitor handleUserIDPacket: self
]

{ #category : #testing }
OpenPGPUserIDPacket >> canBeAddedTo: aPacket [
	^aPacket isPublicKeyPacket
]

{ #category : #testing }
OpenPGPUserIDPacket >> isUserIDPacket [
	^true
]

{ #category : #printing }
OpenPGPUserIDPacket >> printDataOn: aStream [
	aStream nextPutAll: ', uid='.
	aStream nextPutAll: self dataAsString
]
