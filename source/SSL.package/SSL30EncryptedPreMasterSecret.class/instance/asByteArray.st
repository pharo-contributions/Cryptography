converting
asByteArray

	| writeStream |
	writeStream := (WriteStream on: ByteArray new)
		nextPutAll: self preMasterSecret;
		yourself.
	^ writeStream contents.
