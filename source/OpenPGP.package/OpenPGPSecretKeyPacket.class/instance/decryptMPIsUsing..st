private
decryptMPIsUsing: passphrase
	"Decrypt the secret key data to use in signing and decryption of encrypted messages.
	Returns an Array of LargePositiveIntegers"
	| k cast5 cfb bytes sum str |
	encryptionAlgorithm = 3 ifFalse: [self error: 'Only CAST5 supported at the moment'].
	k := stringToKeySpecifier stringToKey: passphrase numBytes: 16.
	cast5 := CAST5 new setKey: k.
	cfb := CFBEncryption new cipher: cast5 initialVector: initialVector.
	bytes := cfb decryptBytes: mpis.
	sum := (bytes unsignedShortAt: bytes size -1 bigEndian: true).
	bytes := bytes copyFrom: 1 to: bytes size-2.
	bytes sum = sum ifFalse: [^nil].
	str := OpenPGPStream on: (ReadStream on: bytes).
	^str mpisUpToEnd