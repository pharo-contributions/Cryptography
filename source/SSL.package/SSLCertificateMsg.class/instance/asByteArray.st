converting
asByteArray

	| writeStream certStream bytes |
	certStream := WriteStream on: ByteArray new.
	self certificateList do: [:eachCert |
		bytes := eachCert asAsn1Bytes.
		certStream
			nextPutAll: (bytes size asByteArrayOfSize: 3);
			nextPutAll: bytes].
	bytes := certStream contents.
	writeStream := WriteStream on: ByteArray new.
	writeStream
		nextPutAll: (bytes size asByteArrayOfSize: 3);
		nextPutAll: bytes.
	^writeStream contents.
