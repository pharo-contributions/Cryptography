converting
asByteArray

	^ (WriteStream on: ByteArray new)
		nextPutAll: self content;
		nextPutAll: self mac;
		contents.
