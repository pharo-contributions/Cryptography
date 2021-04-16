"
RC4 (Rivest Cipher 4 also known as ARC4 or ARCFOUR meaning Alleged RC4)
"
Class {
	#name : #ARC4,
	#superclass : #Object,
	#instVars : [
		'sbox',
		'i',
		'j'
	],
	#category : #'Cryptography-RC4'
}

{ #category : #accessing }
ARC4 >> decrypt: aByteArray [
	^ self encrypt: aByteArray
]

{ #category : #accessing }
ARC4 >> encrypt: aByteArray [
	| newBytes |
	newBytes := aByteArray copy.
	1 to: aByteArray size do: [ :each | newBytes at: each put: ((aByteArray at: each) bitXor: self next)].
	^ newBytes
]

{ #category : #accessing }
ARC4 >> key: aByteArray [
	| k other |
	sbox := (0 to: 255) asByteArray.
	k := (0 to: 255) collect: [ :each | aByteArray at: each \\ aByteArray size + 1].
	other := 0.
	1 to: 256 do: [ :each |
		other := other + (sbox at: each) + (k at: each) \\ 256.
		sbox swap: each with: other+1].
	i := j := 0
]

{ #category : #accessing }
ARC4 >> next [
	| t |
	i := i + 1 \\ 256.
	j := j + (sbox at: i+1) \\ 256.
	sbox swap: i+1 with: j+1.
	t := (sbox at: i+1) + (sbox at: j+1) \\ 256.
	^ sbox at: t+1
]
