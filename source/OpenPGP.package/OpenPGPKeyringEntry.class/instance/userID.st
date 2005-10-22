accessing
userID
	^self
		detectPacket: [:p | p isUserIDPacket]
		return: [:p | p dataAsString]