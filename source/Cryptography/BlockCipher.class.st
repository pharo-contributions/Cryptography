"
Abstract class for blockmode ciphers (those which encrypt/decrypt more than 1 byte at a time, typically 64 bits)
"
Class {
	#name : #BlockCipher,
	#superclass : #Object,
	#category : #'Cryptography-Core'
}

{ #category : #accessing }
BlockCipher class >> blockSize [
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
BlockCipher class >> key: aByteArray [
	^ self new key: aByteArray
]

{ #category : #accessing }
BlockCipher class >> keySize [
	^ self subclassResponsibility
]

{ #category : #accessing }
BlockCipher >> blockSize [
	^ self class blockSize
]

{ #category : #private }
BlockCipher >> blocksIn: aByteArray from: startIndex to: endIndex do: oneArgBlock [ 
	| tempBlock |
	self isStreamCipher
		ifFalse: [ self validateEndpointsFrom: startIndex to: endIndex ].
	tempBlock := ByteArray new: self blockSize.
	startIndex to: endIndex
		by: self blockSize
		do: 
			[ : startPos | 
			tempBlock 
				replaceFrom: 1
				to: (self blockSize min: aByteArray size - startPos + 1)
				with: aByteArray
				startingAt: startPos.
			oneArgBlock value: tempBlock.
			aByteArray 
				replaceFrom: startPos
				to: (startPos + self blockSize - 1 min: aByteArray size)
				with: tempBlock
				startingAt: 1]
]

{ #category : #modes }
BlockCipher >> cbc [
	^ CBC on: self
]

{ #category : #modes }
BlockCipher >> cfb [
	^ CFB on: self
]

{ #category : #modes }
BlockCipher >> ctr [
	^ CTR on: self
]

{ #category : #accessing }
BlockCipher >> decrypt: aByteArray [
	"Answer a copy of aByteArray which is decrypted with my key."
	| decryptedBlock |
	decryptedBlock := 
		self 
			decrypt: aByteArray copy
			from: 1
			to: aByteArray size.
	^ self isStreamCipher 
		ifTrue: [ decryptedBlock ]
		ifFalse: 
			[ decryptedBlock
				copyFrom: 1 
				to: decryptedBlock unpaddedSize ]
]

{ #category : #accessing }
BlockCipher >> decrypt: aByteArray from: startPos to: endPos [ 
	"Decrypt aByteArray in-place."
	self 
		blocksIn: aByteArray
		from: startPos
		to: endPos
		do: [:each | self decryptBlock: each].
	^ aByteArray
]

{ #category : #accessing }
BlockCipher >> decryptBlock: cipherText [
	^ self subclassResponsibility
]

{ #category : #modes }
BlockCipher >> ecb [
	^ self
]

{ #category : #accessing }
BlockCipher >> encrypt: aByteArray [ 
	"Answer a copy of aByteArray which is encrypted with my key."
	| encryptable |
	encryptable := self isStreamCipher
		ifTrue: [ aByteArray copy ]
		ifFalse: [ aByteArray padToMultipleOf: self blockSize ].
	^ self 
		encrypt: encryptable
		from: 1
		to: encryptable size
]

{ #category : #accessing }
BlockCipher >> encrypt: aByteArray from: startPos to: endPos [ 
	"Encrypt aByteArray in place."
	self 
		blocksIn: aByteArray
		from: startPos
		to: endPos
		do: [:each | self encryptBlock: each].
	^aByteArray
]

{ #category : #accessing }
BlockCipher >> encryptBlock: plainText [
	^ self subclassResponsibility
]

{ #category : #testing }
BlockCipher >> isStreamCipher [
	"Answer whether I have stream characteristics; a Stream cipher typically generates its own stream of pseudo-random bytes which is then XOR'd with plaintext.  Another characteristic is no padding is required because the last (odd-sized) block can simply XOR to whatever length needed."
	^ false
]

{ #category : #accessing }
BlockCipher >> key: aKey [
	^ self subclassResponsibility
]

{ #category : #accessing }
BlockCipher >> keySize [
	^ self class keySize
]

{ #category : #modes }
BlockCipher >> ofb [
	^ OFB on: self
]

{ #category : #private }
BlockCipher >> validateEndpointsFrom: startIndex to: endIndex [
	endIndex-startIndex+1 \\ self blockSize = 0 ifFalse: [ CryptographyError signal: 'message size must be a multiple of my blockSize.' ]
]
