"
See Handbook of Applied Cryptography, Ch. 8, p. 295.

Here we use the notation:
	p = modulo
	alpha = generator
	alpha^a = generatorRaisedToA

Encryption:
* Obtain A's public key (p, alpha, alpha^a).
* Represent the message as an integer m between 0 and p-1.
* Select a random integer k between 1 and p-2.
* Compute:
		gamma = alpha^k mod p
		delta = m * (alpha^a)^k mod p.
* Send the ciphertext c = (gamma, delta).

Signature verification:
* Obtain A's public key (p, alpha, alpha^a).
* Verify that r is between 1 and p-1, if not then reject the signature.
* Compute v1 = (alpha^a)^r * r^s mod p.
* Compute h(m) where h is a hash function
* Compute v2 = alpha^h(m) mod p.
* Accept the signature if and only if v1=v2.


"
Class {
	#name : #ElGamalPublicKey,
	#superclass : #Object,
	#instVars : [
		'modulo',
		'generator',
		'generatorRaisedToA'
	],
	#category : #'Cryptography-Core-ElGamal'
}

{ #category : #'instance creation' }
ElGamalPublicKey class >> setModulo: p generator: alpha generatorRaisedToA: y [
	^ self new setModulo: p generator: alpha generatorRaisedToA: y
]

{ #category : #actions }
ElGamalPublicKey >> encryptElement: anInteger [
	| k gamma delta |
	k := SecureRandom picker nextInt: modulo-2.
	gamma := generator raisedTo: k modulo: modulo.
	delta := anInteger * (generatorRaisedToA raisedTo: k modulo: modulo) \\ modulo.
	^ Array with: gamma with: delta
]

{ #category : #accessing }
ElGamalPublicKey >> hashFunction [
	^ SHA1 new
]

{ #category : #accessing }
ElGamalPublicKey >> setModulo: p generator: alpha generatorRaisedToA: y [
	modulo := p.
	generator := alpha.
	generatorRaisedToA := y.
]

{ #category : #actions }
ElGamalPublicKey >> verifySignature: anArray onMessage: aByteArray [
	| hm r s v1 v2 |
	hm := (self hashFunction hashMessage: aByteArray) asInteger.
	r := anArray at: 1.
	s := anArray at: 2.
	(r between: 1 and: modulo-1) ifFalse: [^ false]. "signature rejected"

	v1 := generatorRaisedToA raisedTo: r modulo: modulo.
	v1 := v1 * (r raisedTo: s modulo: modulo) \\ modulo.
	v2 := generator raisedTo: hm modulo: modulo.
	^ v1 = v2  "signature accepted if v1=v2"
]
