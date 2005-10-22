accessing
userIDs
	^self ownedPackets select: [:each | each isUserIDPacket]