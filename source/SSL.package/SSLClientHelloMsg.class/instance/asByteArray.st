converting
asByteArray

	| writeStream encodedSuites encodedCompressionMethods |
	encodedSuites := (self cipherSuites 
		inject: (WriteStream on: ByteArray new)
		into: [:stream :cipherSuite | 
			stream nextPutAll: cipherSuite codeAsByteArray.
			stream]) contents.
	encodedCompressionMethods := (self compressionMethods
		inject: (WriteStream on: ByteArray new)
		into: [:stream :compressionMethod | 
			stream nextPut: compressionMethod. stream]) contents.
	writeStream := WriteStream on: ByteArray new.
	writeStream
		nextPutAll: self clientVersion asByteArray;
		nextPutAll: self random;
		nextPutAll: (self sessionId asByteArray size) asByteArray;
		nextPutAll: self sessionId asByteArray;
		nextPutAll: (encodedSuites size asByteArrayOfSize: 2);
		nextPutAll: encodedSuites;
		nextPutAll: (encodedCompressionMethods size asByteArrayOfSize: 1);
		nextPutAll: encodedCompressionMethods.
	^writeStream contents.


