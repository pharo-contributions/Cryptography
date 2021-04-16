"
An RSA private key
"
Class {
	#name : #RSAPrivateKey,
	#superclass : #Object,
	#instVars : [
		'p',
		'q',
		'dP',
		'dQ',
		'qInv'
	],
	#category : #'Cryptography-RSA'
}

{ #category : #'instance creation' }
RSAPrivateKey class >> p: int1 q: int2 dP: int3 dQ: int4 qInv: int5 [

	^ self new
		p: int1 q: int2 dP: int3 dQ: int4 qInv: int5;
		yourself
]

{ #category : #process }
RSAPrivateKey >> crypt: anInteger [

	| m1 m2 h |
	m1 := anInteger raisedTo: self dP modulo: self p.
	m2 := anInteger raisedTo: self dQ modulo: self q.
	h := (m1 - m2) * self qInv \\ self p.
	^ m2 + (self q * h).
	
]

{ #category : #accessing }
RSAPrivateKey >> dP [
	"Answer the value of dP"

	^ dP
]

{ #category : #accessing }
RSAPrivateKey >> dQ [
	"Answer the value of dQ"

	^ dQ
]

{ #category : #accessing }
RSAPrivateKey >> p [
	"Answer the value of p"

	^ p
]

{ #category : #accessing }
RSAPrivateKey >> p: int1 q: int2 dP: int3 dQ: int4 qInv: int5 [

	p := int1.
	q := int2.
	dP := int3.
	dQ := int4.
	qInv := int5.

]

{ #category : #accessing }
RSAPrivateKey >> q [
	"Answer the value of q"

	^ q
]

{ #category : #accessing }
RSAPrivateKey >> qInv [
	"Answer the value of qInv"

	^ qInv
]

{ #category : #process }
RSAPrivateKey >> v15Decrypt: aByteArray [

	| em stream |
	em := self crypt: aByteArray asInteger.
	stream := em asByteArray readStream.
	stream upTo: 16r02.
	stream upTo: 16r00.
	^ stream upToEnd.

]

{ #category : #process }
RSAPrivateKey >> v15SignMessage: aMessage [

	^ self v15SignMessageHash: (
		SHA1 digestInfoAsn1DerEncodingFromMessage: aMessage).

]

{ #category : #process }
RSAPrivateKey >> v15SignMessageHash: encodedMsg [

	| int emLen |
	
	emLen := (p * q) bytesCount -1.
		
	int := LargePositiveInteger basicNew: emLen.
	" Our LargeIntegers are little endian, so we have to reverse the bytes"
	encodedMsg with: (encodedMsg size to: 1 by: -1) do: [:each :index |
		int basicAt: index put: each].
	int basicAt: encodedMsg size + 1 put: 0.

	encodedMsg size + 2 to: emLen - 1 do: [ :ind | int basicAt: ind put: 255].
	int basicAt: emLen put: 1.	
	
	^ (self crypt: int) asByteArray.

]
