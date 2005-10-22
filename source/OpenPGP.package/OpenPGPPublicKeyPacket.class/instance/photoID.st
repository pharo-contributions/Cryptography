accessing
photoID
	^self ownedPackets detect: [:p | p isPhotoIDPacket] ifNone: []