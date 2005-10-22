verifying
verifyKey: keyPacket userId: userIdPacket
	"compute a hash from the given key and userId according to my hash function.
	This method is ugly, but not much more than RFC2440 from which it was created."
	| message hash |
	hashAlgorithm = 2 ifFalse: [self error: 'Only SHA-1 is supported'].
	publicKeyAlgorithm = 17 ifFalse: [self error: 'Only DSA signatures are supported'].
	message := ReadWriteStream on: ByteArray new.
	self putKeyPacket: keyPacket onHashStream: message.
	self putUserIdPacket: userIdPacket onHashStream: message.
	self putSignatureDataOnHashStream: message.
	message reset.
	hash := SecureHashAlgorithm new hashStream: message.
	^DigitalSignatureAlgorithm new
		verifySignature: mpis
		ofMessageHash: hash
		publicKey: keyPacket mpis