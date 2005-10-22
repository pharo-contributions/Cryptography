visitor
handleLiteralDataPacket: anOpenPGPPacket
	| str |
	str := ReadStream on: anOpenPGPPacket data.
	self halt