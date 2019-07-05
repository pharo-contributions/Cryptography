"
I represent the basic version of the Diffie-Hellman key agreement. 
See Handbook of Applied Cryptography, Ch. 12, p. 516

One time setup:
* a safe prime p and a generator alpha of Zp* are published.

Protocol actions:
* Alice chooses a random secret x between 1 and p-2.
* Alice sends Bob message alpha^x mod p.
* Bob chooses a random secret y between 1 and p-2.
* Bob sends Alice message alpha^y mod p.
* Alice receives alpha^y and computes the shared key:
	K = (alpha^y)^x mod p.
* Bob receives alpha^x and computes the shared key:
	K = (alpha^x)^y mod p.

Example from testCase:
| alice bob fromAlice fromBob k1 k2 |
alice := DiffieHellman bits: 15.
bob := DiffieHellman prime: alice prime generator: alice generator.
fromAlice := alice sendMessage.
fromBob := bob sendMessage.
k1 := alice receiveMessage: fromBob.
k2 := bob receiveMessage: fromAlice.
self assert: k1 = k2

"
Class {
	#name : #DiffieHellman,
	#superclass : #Object,
	#instVars : [
		'prime',
		'generator',
		'secret',
		'sharedKey'
	],
	#category : 'Cryptography-ElGamal'
}

{ #category : #'instance creation' }
DiffieHellman class >> bits: anInteger [
	| prime generator |
	prime := PrimesFinder safePrimeOfSize: anInteger.
	generator := ElGamalKeyGenerator generatorOfZp: prime.
	^ self prime: prime generator: generator
]

{ #category : #'instance creation' }
DiffieHellman class >> prime: prime generator: generator [
	^ self new prime: prime; generator: generator
]

{ #category : #accessing }
DiffieHellman >> generator [
	^ generator
]

{ #category : #initialization }
DiffieHellman >> generator: anInteger [
	generator := anInteger
]

{ #category : #accessing }
DiffieHellman >> prime [
	^ prime
]

{ #category : #initialization }
DiffieHellman >> prime: anInteger [
	prime := anInteger
]

{ #category : #protocol }
DiffieHellman >> receiveMessage: anInteger [
	sharedKey := anInteger raisedTo: secret modulo: prime.
	^ sharedKey
]

{ #category : #protocol }
DiffieHellman >> sendMessage [
	secret := SecureRandom picker nextInt: prime-2.
	^ generator raisedTo: secret modulo: prime
]

{ #category : #initialization }
DiffieHellman >> setupPrimeOfSize: bits [
	prime := PrimesFinder safePrimeOfSize: bits.
	generator := ElGamalKeyGenerator generatorOfZp: prime
]

{ #category : #protocol }
DiffieHellman >> sharedKey [
	^ sharedKey
]
