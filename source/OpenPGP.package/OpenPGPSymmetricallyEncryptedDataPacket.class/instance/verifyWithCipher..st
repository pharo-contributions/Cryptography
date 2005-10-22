testing
verifyWithCipher: cipher
	"Test whether the given block cipher (with initialized key) is correct for decrypting our data"
	| c check s |
	s := cipher blockSize.
	c := CFBEncryption new
		cipher: cipher
		initialVector: (ByteArray new: s)
		shiftSize: s.
	check := c decryptBytes: (data copyFrom: 1 to: s+2).
	^(check copyFrom: s-1 to: s) = (check copyFrom: s+1 to: s+2)