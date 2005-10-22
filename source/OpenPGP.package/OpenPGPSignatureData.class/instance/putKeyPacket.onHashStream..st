verifying
putKeyPacket: aPacket onHashStream: aStream
	aStream
		nextPut: 16r99;
		nextNumber: 2 put: aPacket dataSize;
		nextPutAll: aPacket data