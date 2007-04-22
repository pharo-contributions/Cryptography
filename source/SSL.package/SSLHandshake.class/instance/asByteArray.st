converting
asByteArray

	^ (WriteStream on: ByteArray new)
		nextPutAll: self msgType asByteArray;
		nextPutAll: (self length asByteArrayOfSize: 3);
		nextPutAll: self body;
		contents.
