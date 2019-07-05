Class {
	#name : #OpenPGPPhotoIDPacket,
	#superclass : #OpenPGPPacket,
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPPhotoIDPacket >> acceptVisitor: aVisitor [
	^aVisitor handlePhotoIDPacket: self
]

{ #category : #testing }
OpenPGPPhotoIDPacket >> canBeAddedTo: aPacket [
	^aPacket isPublicKeyPacket
]

{ #category : #accessing }
OpenPGPPhotoIDPacket >> image [
	"Must use RWBinaryOrTextStream because the XBM reader wants to switch the stream to ascii :-("
	^ImageReadWriter formFromStream: (RWBinaryOrTextStream with: (data copyFrom: 23 to: data size))
]

{ #category : #testing }
OpenPGPPhotoIDPacket >> isPhotoIDPacket [
	^true
]
