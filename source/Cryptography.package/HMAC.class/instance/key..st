accessing
key: aByteArray
	key _ aByteArray.
	key size > hash blockSize ifTrue: [key _ hash hashMessage: key].
	key size < hash blockSize ifTrue: [key _ key, (ByteArray new: hash blockSize - key size)]