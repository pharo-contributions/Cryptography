"
My instances generate public/private RSA pairs.
"
Class {
	#name : #RSAKeyPairGenerator,
	#superclass : #Object,
	#instVars : [
		'bits',
		'p',
		'q',
		'd',
		'dP',
		'dQ',
		'qInv'
	],
	#category : 'Cryptography-RSA'
}

{ #category : #'instance creation' }
RSAKeyPairGenerator class >> bits: anInteger [
	^ self new bits: anInteger
]

{ #category : #initialization }
RSAKeyPairGenerator >> bits: anInteger [
	bits := anInteger
]

{ #category : #private }
RSAKeyPairGenerator >> computePrimes [
	[p := self findPrime. p - 1 \\ self e = 0] whileTrue.
	[q := self findPrime. p - 1 * (q - 1) \\ self e = 0] whileTrue
]

{ #category : #private }
RSAKeyPairGenerator >> d [
	d isNil ifFalse: [^ d].
	^ d := self e inverseModulo: self p - 1 * (self q - 1)
]

{ #category : #private }
RSAKeyPairGenerator >> dp [

	^dP ifNil: [ dP := self d \\ ( self p - 1 ) ]
]

{ #category : #private }
RSAKeyPairGenerator >> dq [

	^dQ ifNil: [ dQ := self d \\ (self q - 1) ]
]

{ #category : #private }
RSAKeyPairGenerator >> e [
	^ 65537
]

{ #category : #private }
RSAKeyPairGenerator >> findPrime [
	^ PrimesFinder primeOfSize: bits // 2
]

{ #category : #private }
RSAKeyPairGenerator >> p [
	p isNil ifTrue: [self computePrimes].
	^ p
]

{ #category : #private }
RSAKeyPairGenerator >> p: anInteger [
	p := anInteger
]

{ #category : #accessing }
RSAKeyPairGenerator >> privateKey [
	^ RSAPrivateKey p: self p q: self q dP: self dp dQ: self dq qInv: self qInv
]

{ #category : #accessing }
RSAKeyPairGenerator >> publicKey [
	^ RSAPublicKey exponent: self e modulo: self p * self q
]

{ #category : #private }
RSAKeyPairGenerator >> q [
	q isNil ifTrue: [self computePrimes].
	^ q
]

{ #category : #private }
RSAKeyPairGenerator >> q: anInteger [
	q := anInteger
]

{ #category : #private }
RSAKeyPairGenerator >> qInv [

	^qInv ifNil: [ "qInv = 1 / q mod p"
		qInv := (EuclidAlgorithm with: q with: p) doBasicAlgorithm; firstCoefficient.
		qInv < 0 ifTrue: [ qInv := qInv \\ p ].
		qInv ]
]
