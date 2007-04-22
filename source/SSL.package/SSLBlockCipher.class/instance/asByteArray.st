converting
asByteArray

	^ (WriteStream on: ByteArray new)
		nextPutAll: self content;
		nextPutAll: self mac;
		nextPutAll: self padding;
		nextPutAll: self paddingLength asByteArray;
		contents.
