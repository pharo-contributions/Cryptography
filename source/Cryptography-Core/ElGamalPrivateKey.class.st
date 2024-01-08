"
See Handbook of Applied Cryptography, Ch. 8, p. 295.

Here we use the notation:
	p = modulo
	alpha = generator
	a = secretExponent

Decryption:
* Receive the ciphertext c = (gamma, delta).
* Use the private key to compute:
	gamma^(p-1-a) = gamma^(-a) = alpha^(-a*k) mod p
* Recover m = (gamma^(p-1-a)) * delta mod p

Signature generation:
* Select a random secret integer k between 1 and p-2, with gcd(k, p-1) = 1.
* Compute r = alpha^k mod p.
* Compute k^(-1) mod (p-1).
* Compute s = k^(-1) * ( h(m) - a*r ) mod (p-1), where h is a hash function.
* The signature for m is the pair (r,s).



"
Class {
	#name : #ElGamalPrivateKey,
	#superclass : #Object,
	#instVars : [
		'modulo',
		'generator',
		'secretExponent'
	],
	#category : #'Cryptography-Core-ElGamal'
}

{ #category : #'instance creation' }
ElGamalPrivateKey class >> setModulo: p generator: alpha secretExponent: a [
	^ self new setModulo: p generator: alpha secretExponent: a


]

{ #category : #actions }
ElGamalPrivateKey >> decryptElement: anArray [
	| gamma delta aux |
	gamma := anArray at: 1.
	delta := anArray at: 2.
	aux := gamma raisedTo: (modulo - 1 - secretExponent) modulo: modulo.
	^ aux * delta \\ modulo
]

{ #category : #accessing }
ElGamalPrivateKey >> hashFunction [
	^ SHA1 new
]

{ #category : #accessing }
ElGamalPrivateKey >> setModulo: p generator: alpha secretExponent: a [
	modulo := p.
	generator := alpha.
	secretExponent := a.
]

{ #category : #actions }
ElGamalPrivateKey >> signMessage: aByteArray [
	| hm k kinv r s |
	hm := (self hashFunction hashMessage: aByteArray) asInteger.

	[k := SecureRandom picker nextInt: modulo - 2.
	(k gcd: modulo-1) = 1] whileFalse.

	r := generator raisedTo: k modulo: modulo.
	kinv := k inverseModulo: (modulo-1).
	s := kinv * (hm - (secretExponent*r)) \\ (modulo-1).
	^ Array with: r with: s
]
