stack
upcallAll: bytes

	self buffer nextPutAll: bytes.
	[self hasNextHeader and: [self processChunk]] whileTrue.
