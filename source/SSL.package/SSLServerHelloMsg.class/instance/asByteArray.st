converting
asByteArray

	| writeStream |
	writeStream := (WriteStream on: ByteArray new)
		nextPutAll: self serverVersion asByteArray;
		nextPutAll: self random;
		nextPutAll: (self sessionId asByteArray size) asByteArray;
		nextPutAll: self sessionId asByteArray;
		nextPutAll: self cipherSuite codeAsByteArray;
		nextPutAll: self compressionMethod asByteArray.
	^ writeStream contents.
