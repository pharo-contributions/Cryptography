"
TripleDES uses its 168-bit key to set up 3 DES instances which are used in a cascade to encrypt and decrypt data. It has reasonable cryptoanalytic strength.
"
Class {
	#name : #TripleDESForOpenPGP,
	#superclass : #BlockCipher,
	#instVars : [
		'des1',
		'des2',
		'des3'
	],
	#category : 'OpenPGP-Algorithms'
}

{ #category : #accessing }
TripleDESForOpenPGP class >> blockSize [
	^ 8
]

{ #category : #accessing }
TripleDESForOpenPGP class >> keySize [
	^ 8*3
]

{ #category : #'instance creation' }
TripleDESForOpenPGP class >> new [
	^ super new initialize
]

{ #category : #'encryption/decryption' }
TripleDESForOpenPGP >> blockSize [
	^8
]

{ #category : #'encryption/decryption' }
TripleDESForOpenPGP >> decryptBlock: anInteger [
	^des1 decryptBlock: (des2 encryptBlock: (des3 decryptBlock: anInteger))
]

{ #category : #'encryption/decryption' }
TripleDESForOpenPGP >> encryptBlock: anInteger [
	^des3 encryptBlock: (des2 decryptBlock: (des1 encryptBlock: anInteger))
]

{ #category : #accessing }
TripleDESForOpenPGP >> initialize [
	des1 _ DESForOpenPGP new.
	des2 _ DESForOpenPGP new.
	des3 _ DESForOpenPGP new
]

{ #category : #accessing }
TripleDESForOpenPGP >> key: aByteArray [
	des1 key: (aByteArray copyFrom: 1 to: 8).
	des2 key: (aByteArray copyFrom: 9 to: 16).
	des3 key: (aByteArray copyFrom: 17 to: 24)
]

{ #category : #'encryption/decryption' }
TripleDESForOpenPGP >> keySize [
	^24
]

{ #category : #'initialize-release' }
TripleDESForOpenPGP >> setKey: aNumber [
	| mask64 |
	mask64 := 16rFFFFFFFFFFFFFFFF.
	des1 := DESForOpenPGP new setKey: ((aNumber bitShift: -128) bitAnd: mask64).
	des2 := DESForOpenPGP new setKey: ((aNumber bitShift: -64) bitAnd: mask64).
	des3 := DESForOpenPGP new setKey: (aNumber bitAnd: mask64)
]
