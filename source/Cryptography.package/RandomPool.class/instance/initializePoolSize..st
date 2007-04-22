as yet unclassified
initializePoolSize: anInteger
	key _ ByteArray new: TripleDES keySize.
	pool _ ByteArray new: anInteger // TripleDES blockSize + 1 * TripleDES blockSize.
	outputStream _ ByteArray new readStream.
	inputIndex _ 1.
	self nextPutAll: Time millisecondClockValue printString asByteArray.
	self stir