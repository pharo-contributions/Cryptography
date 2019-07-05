"
The ElGamal public-key encryption scheme is related to the Diffie-Hellman key agreement. Their security is based on the intractability of the same number theoretic problems (the discrete logarithm problem and the Diffie-Hellman problem).

See Handbook of Applied Cryptography, Ch. 8, p. 294.

Key generation:
* Generate a large random prime p and a generator alpha of the multiplicative group Zp* of the integers modulo p
* Select a random integer a between 1 and p-2, and compute alpha^a mod p
* The public key is (p, alpha, alpha^a)
  The private key is a

Example of encryption:
| elgamal pub priv c |
elgamal := ElGamalKeyGenerator new.
elgamal generateKeysOfSize: 15.
pub := elgamal publicKey.
priv := elgamal privateKey.
c := pub encryptElement: 31.
priv decryptElement: c.


Example of signature:
| elgamal pub priv signature |
elgamal := ElGamalKeyGenerator new.
elgamal generateKeysOfSize: 15.
pub := elgamal publicKey.
priv := elgamal privateKey.
signature := priv signMessage: 'hello'.
pub verifySignature: signature onMessage: 'hello'.


"
Class {
	#name : #ElGamalKeyGenerator,
	#superclass : #Object,
	#instVars : [
		'p',
		'alpha',
		'a'
	],
	#category : #'Cryptography-ElGamal'
}

{ #category : #'instance creation' }
ElGamalKeyGenerator class >> bits: anInteger [
	^ self new generateKeysOfSize: anInteger
]

{ #category : #utils }
ElGamalKeyGenerator class >> generatorOfZp: safePrimeP [
	"Finds a generator of Zp* where p is a safe prime: p = 2q+1 with q prime.
	The order of Zp* is n = p-1 = 2q, so we know the factorization of n.
	See Handbook of Applied Cryptography, Ch.4, p.163 "

	| alpha p n |
	p := safePrimeP.
	n := p - 1.
	[alpha := SecureRandom picker nextInt: n.
	((alpha raisedTo: n/2 modulo: p) = 1 or: [(alpha raisedTo: 2 modulo: p) = 1])] whileFalse.
	^ alpha
]

{ #category : #accessing }
ElGamalKeyGenerator >> destroy [
	p destroy.
	alpha destroy.
	a destroy
]

{ #category : #private }
ElGamalKeyGenerator >> generateKeysOfSize: numberOfBits [
	p := PrimesFinder safePrimeOfSize: numberOfBits.
	alpha := self class generatorOfZp: p.
	a := SecureRandom picker nextInt: p-2
]

{ #category : #accessing }
ElGamalKeyGenerator >> privateKey [
	^ ElGamalPrivateKey 
		setModulo: p 
		generator: alpha
		secretExponent: a

]

{ #category : #accessing }
ElGamalKeyGenerator >> publicKey [
	^ ElGamalPublicKey 
		setModulo: p 
		generator: alpha 
		generatorRaisedToA: (alpha raisedTo: a modulo: p)

]
