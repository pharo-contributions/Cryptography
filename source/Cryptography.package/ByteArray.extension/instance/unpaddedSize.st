*cryptography-core
unpaddedSize
	"If I was padded by a BlockCipher, answer the size of the original plaintext."
	self isProperlyPadded ifFalse: [ CryptographyError signal: 'Authentication failure (improperly padded!)' ].
	^ self size - self last