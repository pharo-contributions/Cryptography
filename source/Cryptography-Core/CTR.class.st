"
This CTR mode implementation was guided by

	Nils Ferguson, Bruce Schneier.  Pratical Cryptography.  
	Wiley, 2003.
	pp. 75-82, 111-127.

With CTR, my initialVector is partitioned into a nonce and a counter (""i"" in the book).  My blockSize, 128-bits, are available to accommodate both of these ""fields"".  The two of them combined together form my #initialVector (IV).  The book suggests the nonce portion used as a message-number used also in sequencing messages of a secure-channel (chapter 8).  The overall requirement is that the same initialVector (i.e., counter+nonce combination) never be used twice for this key (instance).  The counter is re-set to 1 each time the nonce is set.

If you run out of counter, I signal a CryptographyError.
"
Class {
	#name : #CTR,
	#superclass : #BlockCipherMode,
	#instVars : [
		'counter',
		'counterBits',
		'maximumCounterValue'
	],
	#category : #'Cryptography-Core-Core'
}

{ #category : #accessing }
CTR >> counter [
	^ counter
]

{ #category : #private }
CTR >> counter: anInteger [ 
	vector 
		uint: counterBits
		at: self positionOfCounter
		put: anInteger.
	counter := anInteger
]

{ #category : #'initialization-release' }
CTR >> counterBits: anInteger [
	((16 to: 128 by: 16) includes: anInteger) ifFalse:
		[ CryptographyError signal: 'invalid counter size' ].
	counterBits := anInteger.
	maximumCounterValue := (1 bitShift: counterBits) - 1
]

{ #category : #private }
CTR >> counterBytes [
	^ counterBits/8
]

{ #category : #accessing }
CTR >> decryptBlock: aByteArray [
	"One of the advantages of CTR mode is that the decrypt implementation is exactly like the encrypt."
	self encryptBlock: aByteArray
]

{ #category : #'initialization-release' }
CTR >> destroy [
	super destroy.
	counter := 0 "avoid potential leakage"
]

{ #category : #accessing }
CTR >> encryptBlock: aByteArray [
	| kSubI |
	kSubI := self nextBlock.
	aByteArray withIndexDo:
		[ : eachByte : x |
		aByteArray 
			at: x
			put: (eachByte bitXor: (kSubI at: x)).
		"reduce leakage"
		kSubI at: x put: 0 ]
]

{ #category : #private }
CTR >> highestNonce [
	^ (1 bitShift: self nonceBits) - 1
]

{ #category : #private }
CTR >> incrementCounter [
	counter >= maximumCounterValue 
		ifTrue:
			[ CryptographyError signal: 'cannot operate on more than ', maximumCounterValue printString, ' blocks at a time.' ].
	self counter: counter + 1
]

{ #category : #accessing }
CTR >> incrementNonce [
	"increment my nonce"
	| answer |
	answer := self nonce + 1.
	self nonce: answer.
	^ answer
]

{ #category : #'initialization-release' }
CTR >> initialize [

	super initialize.
	self counterBits: 32
]

{ #category : #private }
CTR >> isExpired [
	^ self nonce = self highestNonce 
]

{ #category : #testing }
CTR >> isStreamCipher [
	^ true
]

{ #category : #private }
CTR >> nextBlock [
	| kSubI |
	self incrementCounter.
	kSubI := vector copy.  "as named in the book"
	cipher encryptBlock: kSubI.
	^ kSubI
]

{ #category : #accessing }
CTR >> nonce [
	^ vector
		uint: self nonceBits
		at: self positionOfNonce
]

{ #category : #accessing }
CTR >> nonce: anInteger [
	vector
		uint: self nonceBits
		at: self positionOfNonce
		put: anInteger.
	self counter: 0
]

{ #category : #private }
CTR >> nonceBits [
	"The number of bits left over for the nonce."
	^ (self blockSize*8) - counterBits
]

{ #category : #private }
CTR >> positionOfCounter [
	^ 1
]

{ #category : #private }
CTR >> positionOfNonce [
	^ self counterBytes + 1
]

{ #category : #'initialization-release' }
CTR >> setCipher: aCipher [
	super setCipher: aCipher.
	self counter: 0
]
