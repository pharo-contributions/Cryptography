as yet unclassified
initializePoolSize: anInteger
	key := ByteArray new: TripleDES keySize.
	pool := ByteArray new: anInteger // TripleDES blockSize + 1 * TripleDES blockSize.
	outputStream := ByteArray new readStream.
	inputIndex := 1.
	self nextPutAll: Time millisecondClockValue printString asByteArray.
	self stir