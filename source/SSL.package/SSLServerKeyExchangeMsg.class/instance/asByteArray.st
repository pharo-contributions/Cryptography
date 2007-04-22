converting
asByteArray

	| writeStream |
	writeStream := (WriteStream on: ByteArray new)
		nextPutAll: self serverParams asByteArray;
		nextPutAll: self signature;
		yourself.
	^ writeStream contents.
