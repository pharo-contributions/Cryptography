visitor
handleCompressedDataPacket: anOpenPGPPacket
	| data |
	data := anOpenPGPPacket uncompressedData.
	config handleStream: (ReadStream on: data) visitor: self