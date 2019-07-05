Class {
	#name : #OpenPGPCompressedDataPacket,
	#superclass : #OpenPGPPacket,
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPCompressedDataPacket >> acceptVisitor: aVisitor [
	^aVisitor handleCompressedDataPacket: self
]

{ #category : #accessing }
OpenPGPCompressedDataPacket >> uncompressedData [
	data first = 1 ifFalse: [self error: 'only inflate supported'].
	^(InflateStream on: data from: 2 to: data size) upToEnd
]
