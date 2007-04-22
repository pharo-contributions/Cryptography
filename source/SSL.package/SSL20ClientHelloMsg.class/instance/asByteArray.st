initialization
asByteArray

	| writeStream encodedSuites |
	encodedSuites := (self cipherSuites 
		inject: (WriteStream on: ByteArray new)
		into: [:stream :cipherSuite | 
			stream nextPutAll: (cipherSuite codeAsByteArraySize: 3)]) contents.
	writeStream := ByteArray new writeStream
		nextPutAll: self clientVersion asByteArray;
		nextPutAll: (encodedSuites size asByteArrayOfSize: 2);
		nextPutAll: ((self sessionId asByteArray size) asByteArrayOfSize: 2);
		nextPutAll: (self random size asByteArrayOfSize: 2);
		nextPutAll: encodedSuites;
		nextPutAll: self sessionId asByteArray;
		nextPutAll: self random;
		yourself.
	^writeStream contents.
