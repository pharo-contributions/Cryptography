converting
asByteArray

	^ (WriteStream on: ByteArray new)
		nextPutAll: self type asByteArray;
		nextPutAll: self version asByteArray;
		nextPutAll: (self length asByteArrayOfSize: 2);
		nextPutAll: fragment asByteArray;
		contents.
