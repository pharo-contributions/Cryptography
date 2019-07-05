Class {
	#name : #OpenPGPSymmetricallyEncryptedDataPacket,
	#superclass : #OpenPGPPacket,
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPSymmetricallyEncryptedDataPacket >> acceptVisitor: aVisitor [
	^aVisitor handleSymmetricallyEncryptedDataPacket: self
]

{ #category : #accessing }
OpenPGPSymmetricallyEncryptedDataPacket >> decryptWithCipher: cipher [
	"Return decrypted data"
	| c s |
	s := cipher blockSize.
	c := CFBEncryption new
		cipher: cipher
		initialVector: (ByteArray new: s)
		shiftSize: s.
	c resyncWith: (data copyFrom: 3 to: s+2).
	^c decryptBytes: (data copyFrom: s+3 to: data size)
]

{ #category : #testing }
OpenPGPSymmetricallyEncryptedDataPacket >> verifyWithCipher: cipher [
	"Test whether the given block cipher (with initialized key) is correct for decrypting our data"
	| c check s |
	s := cipher blockSize.
	c := CFBEncryption new
		cipher: cipher
		initialVector: (ByteArray new: s)
		shiftSize: s.
	check := c decryptBytes: (data copyFrom: 1 to: s+2).
	^(check copyFrom: s-1 to: s) = (check copyFrom: s+1 to: s+2)
]
