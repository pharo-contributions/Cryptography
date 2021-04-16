"
My instances search for primes of a given size. They implement a probabilistic method. For speed, they first test for divisibility by the primest up to 2000 (in a deterministic way). Next, they employ a probabilistic test (such as MillerRabin).
"
Class {
	#name : #PrimesFinder,
	#superclass : #Object,
	#instVars : [
		'wheel',
		'candidate'
	],
	#category : #'Cryptography-Core-RandomAndPrime'
}

{ #category : #'instance creation' }
PrimesFinder class >> bits: numberOfBits [
	| shift b |
	shift := numberOfBits - 1.
	b := (SecureRandom picker nextBits: shift)+1.
	b := b bitOr: 1. "ensure it is odd"
	b := b bitOr: (1 << shift). "ensure it is of the requiered length"
	^ self candidate: b
]

{ #category : #'instance creation' }
PrimesFinder class >> candidate: n [
	^ self new setCandidate: n
]

{ #category : #'primes generation' }
PrimesFinder class >> primeOfSize: numberOfBits [
	^ (self bits: numberOfBits) nextPrime
]

{ #category : #'primes generation' }
PrimesFinder class >> safePrimeOfSize: numberOfBits [
	^ (self bits: numberOfBits) nextSafePrime
]

{ #category : #accessing }
PrimesFinder >> += anInteger [
	candidate := candidate + anInteger.
	wheel += anInteger
]

{ #category : #accessing }
PrimesFinder >> nextPrime [
	[self += 2. self satisfied] whileFalse.
	^ candidate
]

{ #category : #accessing }
PrimesFinder >> nextSafePrime [
	[self += 2. self satisfiedSafe] whileFalse.
	^ 2*candidate + 1
]

{ #category : #testing }
PrimesFinder >> satisfied [
	wheel satisfied ifFalse: [^ false].
	^ MillerRabin isProbablyPrime: candidate
]

{ #category : #testing }
PrimesFinder >> satisfiedSafe [
	wheel satisfiedSafe ifFalse: [^ false].
	^ (MillerRabin isProbablyPrime: candidate)
		and: [MillerRabin isProbablyPrime: 2*candidate+1]
]

{ #category : #initialization }
PrimesFinder >> setCandidate: n [
	n < 4 ifTrue: [self error: 'the candidate is too small'].
	candidate := n even ifTrue: [n + 1] ifFalse: [n].
	wheel := (PrimesWheel upTo: 2000) += candidate
]
