"
My instances are Miller-Rabin algorithms. Miller-Rabin is a probabilistic algorithm for primality testing.
"
Class {
	#name : #MillerRabin,
	#superclass : #Object,
	#instVars : [
		'target',
		'iterations',
		'satisfied',
		'samples',
		'minusOne',
		'k',
		'n0'
	],
	#category : #'Cryptography-Core-RandomAndPrime'
}

{ #category : #'primality testing' }
MillerRabin class >> isProbablyPrime: p [
	| probabilistic |
	probabilistic := self new.
	probabilistic target: p.
	[probabilistic satisfied
		and:
			["error > (1 / 1024)"
			probabilistic iterations < 5]]
		whileTrue: [probabilistic iterate].
	^ probabilistic satisfied
]

{ #category : #accessing }
MillerRabin >> error [
	^ 1 / (4 raisedTo: iterations)
]

{ #category : #computing }
MillerRabin >> iterate [
	| b t x |
	iterations := iterations + 1.
	b := SecureRandom picker nextInt: samples.
	(target gcd: b) = 1 ifFalse: [^ satisfied := false].
	t := 0.
	x := b raisedTo: n0 modulo: target.
	(x = 1 or: [x = minusOne]) ifFalse: [
		[x := x squared \\ target.
		t := t + 1.
		satisfied := x = minusOne.
		satisfied not and: [t < k]] whileTrue.
		satisfied ifFalse: [^ satisfied]]

]

{ #category : #accessing }
MillerRabin >> iterations [
	^ iterations
]

{ #category : #computing }
MillerRabin >> reset [
	iterations := 0.
	satisfied := true.
	minusOne := target - 1.
	samples := minusOne.
	k := minusOne lowBit - 1.
	n0 := minusOne bitShift: k negated
]

{ #category : #accessing }
MillerRabin >> satisfied [
	^ satisfied
]

{ #category : #accessing }
MillerRabin >> target: anInteger [
	target := anInteger.
	self reset
]
