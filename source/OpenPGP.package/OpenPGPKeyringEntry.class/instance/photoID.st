accessing
photoID
	^self
		detectPacket: [:p | p isPhotoIDPacket]
		return: [:p | p image]