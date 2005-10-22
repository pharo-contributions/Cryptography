verifying
putUserIdPacket: aPacket onHashStream: aStream
	aStream
		nextPut: 16rB4;
		nextNumber: 4 put: aPacket dataSize;
		nextPutAll: aPacket data