accessing
decryptWithCipher: cipher
	"Return decrypted data"
	| c s |
	s := cipher blockSize.
	c := CFBEncryption new
		cipher: cipher
		initialVector: (ByteArray new: s)
		shiftSize: s.
	c resyncWith: (data copyFrom: 3 to: s+2).
	^c decryptBytes: (data copyFrom: s+3 to: data size)