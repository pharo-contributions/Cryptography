"
This class implements cipher feedback encryption in concert with any block cipher.

Instance Variables:
cipher	<BlockCipher> used with the encryption
iv		<ByteArray> initialization vector, is updated for every encrypted byte.
encIV	<ByteArray> encrypted IV, used in the decrpytion step of the CFB
index	<Integer> index into encIV used in the decryption step
"
Class {
	#name : #CFBEncryption,
	#superclass : #Object,
	#instVars : [
		'cipher',
		'iv',
		'shiftData',
		'shiftIndex'
	],
	#category : 'OpenPGP-Algorithms'
}

{ #category : #'initialize-release' }
CFBEncryption >> cipher: aBlockCipher initialVector: aByteArray [
	self cipher: aBlockCipher initialVector: aByteArray shiftSize: 1
]

{ #category : #'initialize-release' }
CFBEncryption >> cipher: aBlockCipher initialVector: aByteArray shiftSize: anInteger [
	cipher := aBlockCipher.
	iv := aByteArray copy.
	shiftData := ByteArray new: anInteger.
	shiftIndex := 0
]

{ #category : #encrypting }
CFBEncryption >> decrypt: aCharacterOrInteger [
	| encBlock out |
	encBlock := cipher encryptBytes: iv.
	shiftIndex := shiftIndex+1.
	out := (encBlock at: shiftIndex) bitXor: aCharacterOrInteger asInteger.
	shiftData at: shiftIndex put: aCharacterOrInteger asInteger. 
	shiftIndex = shiftData size ifTrue: [
		iv replaceFrom: 1 to: iv size-shiftIndex with: iv startingAt: shiftIndex+1.
		iv replaceFrom: iv size-shiftIndex+1 to: iv size with: shiftData startingAt: 1.
		shiftIndex := 0].
	^out
]

{ #category : #encrypting }
CFBEncryption >> decryptBytes: aByteArray [
	^aByteArray collect: [:i | self decrypt: i]
]

{ #category : #encrypting }
CFBEncryption >> encrypt: aCharacterOrInteger [
	| encBlock out |
	encBlock := cipher encryptBytes: iv.
	out := encBlock first bitXor: aCharacterOrInteger asInteger.
	iv replaceFrom: 1 to: iv size-1 with: iv startingAt: 2.
	iv at: iv size put: out.
	^out
]

{ #category : #encrypting }
CFBEncryption >> encryptBytes: aByteArray [
	^aByteArray collect: [:i | self encrypt: i]
]

{ #category : #'initialize-release' }
CFBEncryption >> resyncWith: aByteArray [
	iv := aByteArray copy.
	shiftData := ByteArray new: shiftData size.
	shiftIndex := 0
]
