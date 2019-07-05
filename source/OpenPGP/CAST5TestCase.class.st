"
This test case checks that the 3 test key/plaintext pairs (for 40, 80 and 128 bit key length) given in the CAST5 spec are encoded and decoded correctly.
"
Class {
	#name : #CAST5TestCase,
	#superclass : #TestCase,
	#category : 'OpenPGP-Algorithms'
}

{ #category : #running }
CAST5TestCase >> test128BitKey [
	| key plaintext ciphertext |
	key := 16r0123456712345678234567893456789A.
	plaintext := 16r0123456789ABCDEF.
	ciphertext := 16r238B4FE5847E44B2.
	self assert: ((CAST5 new setKey: key) encryptBlock: plaintext) = ciphertext.
	self assert: ((CAST5 new setKey: key) decryptBlock: ciphertext) = plaintext
]

{ #category : #running }
CAST5TestCase >> test40BitKey [
	| key plaintext ciphertext |
	key := 16r01234567120000000000000000000000.
	plaintext := 16r0123456789ABCDEF.
	ciphertext := 16r7AC816D16E9B302E.
	self assert: ((CAST5 new setKey: key) encryptBlock: plaintext) = ciphertext.
	self assert: ((CAST5 new setKey: key) decryptBlock: ciphertext) = plaintext
]

{ #category : #running }
CAST5TestCase >> test80BitKey [
	| key plaintext ciphertext |
	key := 16r01234567123456782345000000000000.
	plaintext := 16r0123456789ABCDEF.
	ciphertext := 16rEB6A711A2C02271B.
	self assert: ((CAST5 new setKey: key) encryptBlock: plaintext) = ciphertext.
	self assert: ((CAST5 new setKey: key) decryptBlock: ciphertext) = plaintext
]
