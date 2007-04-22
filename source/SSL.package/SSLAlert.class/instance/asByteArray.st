converting
asByteArray

	^ (WriteStream on: ByteArray new)
		nextPutAll: self level asByteArray;
		nextPutAll: self descriptionCode asByteArray;
		contents.
