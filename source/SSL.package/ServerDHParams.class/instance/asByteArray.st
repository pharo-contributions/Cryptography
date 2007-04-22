converting
asByteArray

	| writeStream |
	writeStream := (WriteStream on: ByteArray new)
		nextPutAll: (self p size asByteArrayOfSize: 2);
		nextPutAll: self p;
		nextPutAll: (self g size asByteArrayOfSize: 2);
		nextPutAll: self g;
		nextPutAll: (self yServer size asByteArrayOfSize: 2);
		nextPutAll: self yServer;
		yourself.
	^ writeStream contents.
