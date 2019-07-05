Class {
	#name : #OpenPGPMarkerPacket,
	#superclass : #OpenPGPPacket,
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPMarkerPacket >> acceptVisitor: aVisitor [
	^aVisitor handleMarkerPacket: self
]
