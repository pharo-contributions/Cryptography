Class {
	#name : #DSAPrivateKey,
	#superclass : #Object,
	#instVars : [
		'p',
		'q',
		'g',
		'x'
	],
	#category : #'Cryptography-DSA'
}

{ #category : #'instance creation' }
DSAPrivateKey class >> p: p q: q g: g x: x [
	^ self new p: p q: q g: g x: x
]

{ #category : #'as yet unclassified' }
DSAPrivateKey >> computeSignatureForMessageHash: hash [
	"Answer the digital signature of the given message hash using the given private key. A signature is a pair of large integers."

	| r s k tmp |
	r := s := 0.
	[r = 0 or: [s = 0]] whileTrue: [
		k := self nextRandom160 \\ q.
		r := (g raisedTo: k modulo: p) \\ q.
		tmp := (hash asInteger + (x * r)) \\ q.
		s := (k inverseModulo: q) * tmp \\ q].
	^ Array with: r with: s
]

{ #category : #'as yet unclassified' }
DSAPrivateKey >> nextRandom160 [
	^ (RandomPool default next: 20) asInteger
]

{ #category : #'as yet unclassified' }
DSAPrivateKey >> p: p0 q: q0 g: g0 x: x0 [
	p := p0.
	q := q0.
	g := g0.
	x := x0
]

{ #category : #'as yet unclassified' }
DSAPrivateKey >> signMessage: aStringOrStream [
	| hasher h sig |

	hasher := SHA1 new.
	(aStringOrStream class isBytes)
		ifTrue: [h := hasher hashMessage: aStringOrStream]
		ifFalse: [h := hasher hashStream: aStringOrStream].
	sig := self computeSignatureForMessageHash: h.
	^ self signatureToString: sig
]

{ #category : #'as yet unclassified' }
DSAPrivateKey >> signatureToString: aSignature [
	"Answer a string representation of the given signature. This string can be parsed using the stringToSignature: method."

	| s |
	s := WriteStream on: (String new: 2000).
	s nextPutAll: '[DSA digital signature '.
	s nextPutAll: (aSignature first printStringBase: 16).
	s space.
	s nextPutAll: (aSignature second printStringBase: 16).
	s nextPutAll: ']'.
	^ s contents
]
