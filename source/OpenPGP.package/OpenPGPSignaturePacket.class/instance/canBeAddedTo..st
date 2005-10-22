testing
canBeAddedTo: aPacket
	^aPacket isUserIDPacket or: [aPacket isPhotoIDPacket or: [aPacket isPublicKeyPacket or: [aPacket isSubkeyPacket]]]