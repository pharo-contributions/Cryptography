"
Cipher Block Chaining Mode
"
Class {
	#name : #CBC,
	#superclass : #BlockCipherMode,
	#category : #'Cryptography-Core-Core'
}

{ #category : #accessing }
CBC >> decryptBlock: aByteArray [ 
	| nextVector |
	nextVector := aByteArray copy.
	cipher decryptBlock: aByteArray.
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
CBC >> encryptBlock: aByteArray [ 
	1 
		to: aByteArray size
		do: 
			[ : i | 
			aByteArray 
				at: i
				put: ((vector at: i) bitXor: (aByteArray at: i)) ].
	cipher encryptBlock: aByteArray.
	self vector: aByteArray copy
]
