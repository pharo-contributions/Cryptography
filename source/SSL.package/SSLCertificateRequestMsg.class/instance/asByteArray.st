converting
asByteArray

	| writeStream |
	writeStream := WriteStream on: ByteArray new.
	writeStream
		nextPutAll: (self certificateTypes asByteArray);
		nextPutAll: self certificateTypes asByteArray;
		nextPutAll: (self certificateAuthorities asByteArrayOfSize: 2);
		nextPutAll: self certificateAuthorities asByteArray.
	^writeStream contents.
