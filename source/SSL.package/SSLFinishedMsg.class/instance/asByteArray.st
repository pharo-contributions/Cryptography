converting
asByteArray

	| writeStream |
	writeStream := (WriteStream on: ByteArray new)
		nextPutAll: self verifyData;
		yourself.
	^ writeStream contents.
