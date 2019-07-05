Class {
	#name : #TripleDES,
	#superclass : #BlockCipher,
	#instVars : [
		'des1',
		'des2',
		'des3'
	],
	#category : 'Cryptography-DES'
}

{ #category : #accessing }
TripleDES class >> blockSize [
	^ 8
]

{ #category : #accessing }
TripleDES class >> keySize [
	^ 8*3
]

{ #category : #'instance creation' }
TripleDES class >> new [
	^ super new initialize
]

{ #category : #accessing }
TripleDES >> decryptBlock: plainText [
	des3 decryptBlock: plainText.
	des2 encryptBlock: plainText.
	des1 decryptBlock: plainText
]

{ #category : #accessing }
TripleDES >> encryptBlock: plainText [
	des1 encryptBlock: plainText.
	des2 decryptBlock: plainText.
	des3 encryptBlock: plainText
]

{ #category : #accessing }
TripleDES >> initialize [
	des1 := DES new.
	des2 := DES new.
	des3 := DES new
]

{ #category : #accessing }
TripleDES >> key: aByteArray [
	des1 key: (aByteArray copyFrom: 1 to: 8).
	des2 key: (aByteArray copyFrom: 9 to: 16).
	des3 key: (aByteArray copyFrom: 17 to: 24)
]
