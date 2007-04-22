converting
asByteArray

	| writeStream |
	writeStream := (WriteStream on: ByteArray new)
		nextPutAll: (self modulus size asByteArrayOfSize: 2);
		nextPutAll: self modulus;
		nextPutAll: (self exponent size asByteArrayOfSize: 2);
		nextPutAll: self exponent;
		yourself.
	^ writeStream contents.
