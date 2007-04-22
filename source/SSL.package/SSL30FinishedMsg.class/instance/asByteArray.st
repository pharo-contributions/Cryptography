converting
asByteArray

	| writeStream |
	writeStream := (WriteStream on: ByteArray new)
		nextPutAll: self md5Hash;
		nextPutAll: self shaHash;
		yourself.
	^ writeStream contents.
