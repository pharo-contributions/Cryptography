converting
asByteArray

	| writeStream |
	writeStream := (WriteStream on: ByteArray new)
		nextPutAll: self signature;
		yourself.
	^ writeStream contents.
