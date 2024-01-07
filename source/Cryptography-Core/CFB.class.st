"
Cipher Feedback Mode 
"
Class {
	#name : #CFB,
	#superclass : #BlockCipherMode,
	#category : #'Cryptography-Core-Core'
}

{ #category : #accessing }
CFB >> decryptBlock: aByteArray [ 
	| nextVector |
	nextVector := aByteArray copy.
	cipher encryptBlock: vector.
	1 
		to: aByteArray size
		do: 
			[ : i | 
			aByteArray 
				at: i
				put: ((vector at: i) bitXor: (aByteArray at: i)) ].
	self vector: nextVector
]

{ #category : #accessing }
CFB >> encryptBlock: aByteArray [ 
	cipher encryptBlock: vector.
	1 
		to: aByteArray size
		do: 
			[ : i | 
			aByteArray 
				at: i
				put: ((vector at: i) bitXor: (aByteArray at: i)) ].
	self vector: aByteArray copy
]

{ #category : #testing }
CFB >> isStreamCipher [
	"Because the actual ciphertext plays a role in computing the next vector, streaming mode seems inappropriate for CFB.  There's also an implementation issue; the vector is shortened after the last (irregularly sized) block, rendering that BlockCipher instance unusable.."
	^ false
]
