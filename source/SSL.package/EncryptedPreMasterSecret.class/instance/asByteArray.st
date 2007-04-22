converting
asByteArray

	| writeStream |
	writeStream := (WriteStream on: ByteArray new)
		nextPutAll: (self preMasterSecret size asByteArrayOfSize: 2);
		nextPutAll: self preMasterSecret;
		yourself.
	^ writeStream contents.
