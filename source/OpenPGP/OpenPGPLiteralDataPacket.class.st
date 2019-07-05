Class {
	#name : #OpenPGPLiteralDataPacket,
	#superclass : #OpenPGPPacket,
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPLiteralDataPacket >> acceptVisitor: aVisitor [
	^aVisitor handleLiteralDataPacket: self
]
