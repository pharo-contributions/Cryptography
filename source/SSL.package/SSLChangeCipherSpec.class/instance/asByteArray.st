converting
asByteArray

	^ (WriteStream on: ByteArray new)
		nextPutAll: self type asByteArray;
		contents.
