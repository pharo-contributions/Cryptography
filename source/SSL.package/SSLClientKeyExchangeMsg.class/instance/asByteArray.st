converting
asByteArray

	| writeStream |
	writeStream := (WriteStream on: ByteArray new)
		nextPutAll: self exchangeKeys asByteArray;
		yourself.
	^ writeStream contents.
