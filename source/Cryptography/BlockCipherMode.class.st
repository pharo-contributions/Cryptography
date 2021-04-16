"
Common superclass for Cipher modes
"
Class {
	#name : #BlockCipherMode,
	#superclass : #BlockCipher,
	#instVars : [
		'cipher',
		'vector'
	],
	#category : #'Cryptography-Core'
}

{ #category : #accessing }
BlockCipherMode class >> blockSize [
	^ self shouldNotImplement
]

{ #category : #testing }
BlockCipherMode class >> isAbstract [

	^self == BlockCipherMode 
]

{ #category : #'*cryptography-tests' }
BlockCipherMode class >> key: aByteArray [
	Warning signal: 'you do NOT want to use this method in a real program because we use a hard-coded nonce.  You should take care of your own nonce.'.
	^ (self on: (Rijndael new keySize: aByteArray size; key: aByteArray))
		initialVector: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16) asByteArray
]

{ #category : #accessing }
BlockCipherMode class >> keySize [
	^ self shouldNotImplement
]

{ #category : #'instance creation' }
BlockCipherMode class >> on: aCipher [

	^ (self new) 
		setCipher: aCipher;
		yourself
]

{ #category : #accessing }
BlockCipherMode >> blockSize [
	^ cipher blockSize
]

{ #category : #'initialization-release' }
BlockCipherMode >> destroy [
	vector destroy
]

{ #category : #accessing }
BlockCipherMode >> initialVector: aByteArray [
	"avoid leakage, shred prior vectors before disconnecting them."
	self vector: aByteArray
]

{ #category : #accessing }
BlockCipherMode >> key: aByteArray [
	cipher key: aByteArray
]

{ #category : #accessing }
BlockCipherMode >> keySize [
	^ cipher keySize
]

{ #category : #printing }
BlockCipherMode >> printOn: aStream [
	aStream print: cipher; nextPut: $-; nextPutAll: self class name
]

{ #category : #'initialization-release' }
BlockCipherMode >> setCipher: aCipher [ 
	cipher := aCipher.
	self initialVector: (ByteArray new: self blockSize)
]

{ #category : #accessing }
BlockCipherMode >> vector: aByteArray [ 
	vector == aByteArray ifFalse: 
		[ "avoid leakage, shred prior vectors before disconnecting them."
		vector ifNotNil: [ vector destroy ].
		vector := aByteArray ]
]
