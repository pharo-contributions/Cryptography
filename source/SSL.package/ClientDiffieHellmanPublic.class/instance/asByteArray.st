converting
asByteArray

	| writeStream |
	writeStream := (WriteStream on: ByteArray new)
		nextPutAll: (self yClient size asByteArrayOfSize: 2);
		nextPutAll: self yClient;
		yourself.
	^ writeStream contents.
