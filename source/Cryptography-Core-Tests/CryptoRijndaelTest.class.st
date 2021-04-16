Class {
	#name : #CryptoRijndaelTest,
	#superclass : #TestCase,
	#category : #'Cryptography-Core-Tests-Rijndael'
}

{ #category : #'block ciphers' }
CryptoRijndaelTest >> runBlockCipherModeTest: cipherModeSelector [
	| key encipherer decipherer startMsg |
	key := #(190 219 189 251 27 38 8 9 135 25 167 8 238 107 29 251 136 65 107 0 37 215 45 130 84 87 13 206 8 55 74 82) asByteArray.
	encipherer := (Rijndael key: key) perform: cipherModeSelector.  
	decipherer := (Rijndael key: key) perform: cipherModeSelector.
	"Stream ciphers do not require padding, therefore blocks can be less than the encipherer's blockSize."
	startMsg := encipherer isStreamCipher ifTrue: [ 900 ] ifFalse: [ 1000 ].
	startMsg to: 1200 do:
		[ : n |  | block originalBlock iv |
		block := ('some message', n printString) asByteArray.
		iv := ByteArray new: Rijndael blockSize.
		iv uint: Rijndael blockSize*8 at: 1 put: n.
		encipherer initialVector: iv copy.
		decipherer initialVector: iv copy.
		originalBlock := block copy.
		encipherer encryptBlock: block.
		self deny: block = originalBlock.
		self assert: block size = originalBlock size.
		decipherer decryptBlock: block.
		self assert: block = originalBlock ]
]

{ #category : #'as yet unclassified' }
CryptoRijndaelTest >> runEncryptDecrypt: blockCipherClass [
	| msg key1 key2 enc1 enc2 dec1 dec2 ct2 ct1 |
	enc1 := blockCipherClass key: (key1 := SecureRandom picker nextBytes: 16).
	dec1 := blockCipherClass key: key1.
	enc2 := blockCipherClass key: (key2 := SecureRandom picker nextBytes: 16).
	dec2 := blockCipherClass key: key2.
	msg := 'hello how are you?' asByteArray.
	ct2 := enc2 encrypt: msg.
	self deny: msg = ct2.
	self assert: (dec2 decrypt: ct2) = msg.
	"ensure the cipher still works if its key is changed after creation, both for the encryptor instance and decryptor instance."
	enc1 key: key2.  dec1 key: key2.
	ct1 := enc1 encrypt: msg.
	self assert: (dec1 decrypt: ct1) = msg
]

{ #category : #'as yet unclassified' }
CryptoRijndaelTest >> testByteArrayPadding [
	| paddedHello fullBlockPad needsFullPad |
	paddedHello := #(104 101 108 108 111 11 11 11 11 11 11 11 11 11 11 11 ) asByteArray.
	self assert: paddedHello isProperlyPadded.
	self assert: ('hello' asByteArray padToMultipleOf: 16) equals: paddedHello.
	self assert: paddedHello unpaddedSize equals: 'hello' size.

	fullBlockPad := #(16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16) asByteArray.
	self assert: fullBlockPad asByteArray isProperlyPadded.

	needsFullPad := '1234567890123456' asByteArray padToMultipleOf: 16.
	self assert: needsFullPad size equals: 32.
	self assert: (needsFullPad copyFrom: 17 to: 32) equals: fullBlockPad.
	self assert: needsFullPad isProperlyPadded.
	self assert: needsFullPad unpaddedSize equals: 16
]

{ #category : #'block ciphers' }
CryptoRijndaelTest >> testCBC [
	self runBlockCipherModeTest: #cbc
]

{ #category : #'block ciphers' }
CryptoRijndaelTest >> testCFB [
	self runBlockCipherModeTest: #cfb
]

{ #category : #'block ciphers' }
CryptoRijndaelTest >> testCTR [
	self runBlockCipherModeTest: #ctr
]

{ #category : #others }
CryptoRijndaelTest >> testEncryptDecrypt [
	BlockCipherMode allSubclasses asArray do:
		[ : each |
		[ self runEncryptDecrypt: each ]
			on: Warning
			do: [ : warn | warn resume ] ]
]

{ #category : #'block ciphers' }
CryptoRijndaelTest >> testOFB [
	self runBlockCipherModeTest: #ofb
]

{ #category : #'block ciphers' }
CryptoRijndaelTest >> testRijndael [
	| rijndael vector |
	rijndael := Rijndael new keySize: 16; key: (0 to: 15) asByteArray.
	vector := (0 to: 15) asByteArray.
	rijndael encryptBlock: vector.
	self assert: vector hex equals: '0a940bb5416ef045f1c39458c653ea5a'.
	rijndael decryptBlock: vector.
	self assert: vector hex equals: '000102030405060708090a0b0c0d0e0f'.

	rijndael := Rijndael new blockSize: 16; keySize: 24.
	rijndael key: (0 to: 16r17) asByteArray.
	vector := (0 to: 15) asByteArray.
	rijndael encryptBlock: vector.
	self assert: vector hex = '0060bffe46834bb8da5cf9a61ff220ae'.
	rijndael decryptBlock: vector.
	self assert: vector hex = '000102030405060708090a0b0c0d0e0f'.

	rijndael := Rijndael new blockSize: 16; keySize: 32.
	rijndael key: (0 to: 16r1F) asByteArray.
	vector := (0 to: 15) asByteArray.
	rijndael encryptBlock: vector.
	self assert: vector hex = '5a6e045708fb7196f02e553d02c3a692'.
	rijndael decryptBlock: vector.
	self assert: vector hex = '000102030405060708090a0b0c0d0e0f'
]

{ #category : #'block ciphers' }
CryptoRijndaelTest >> testRijndael128128 [
	| key vector cipher |
	key := #(16r2B 16r7E 16r15 16r16 16r28 16rAE 16rD2 16rA6 16rAB 16rF7 16r15 16r88 16r09 16rCF 16r4F 16r3C) asByteArray.
	vector := #(16r32 16r43 16rF6 16rA8 16r88 16r5A 16r30 16r8D 16r31 16r31 16r98 16rA2 16rE0 16r37 16r07 16r34) asByteArray.

	cipher := Rijndael new keySize: 16; key: key.
	cipher encryptBlock: vector.
	self assert: vector hex equals: '3925841d02dc09fbdc118597196a0b32'.
	cipher decryptBlock: vector.
	self assert: vector hex equals: '3243f6a8885a308d313198a2e0370734'
]
