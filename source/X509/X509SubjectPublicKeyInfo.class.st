Class {
	#name : #X509SubjectPublicKeyInfo,
	#superclass : #Object,
	#instVars : [
		'algorithm',
		'subjectPublicKey'
	],
	#category : 'X509'
}

{ #category : #accessing }
X509SubjectPublicKeyInfo >> algorithm [
	"Answer the value of algorithm"

	^ algorithm
]

{ #category : #accessing }
X509SubjectPublicKeyInfo >> algorithm: anObject [
	"Set the value of algorithm"

	algorithm := anObject
]

{ #category : #private }
X509SubjectPublicKeyInfo >> asDSAPublicKey [

	| params y |
	params := self algorithm parameters.
	y := self subjectPublicKeyDecoded.
	^ DSAPublicKey p: (params at: 1) q: (params at: 2) g: (params at: 3) y: y.

]

{ #category : #accessing }
X509SubjectPublicKeyInfo >> asPublicKey [

	self algorithm isDSA ifTrue: [^ self asDSAPublicKey].
	self algorithm isRSA ifTrue: [^ self asRSAPublicKey].
	^ nil
]

{ #category : #private }
X509SubjectPublicKeyInfo >> asRSAPublicKey [

	| keys |
	keys := self subjectPublicKeyDecoded.
	^ (RSAPublicKey exponent: (keys at: 2) asInteger modulo: (keys at: 1) asInteger).

]

{ #category : #accessing }
X509SubjectPublicKeyInfo >> subjectPublicKey [
	"Answer the value of subjectPublicKey"

	^ subjectPublicKey
]

{ #category : #accessing }
X509SubjectPublicKeyInfo >> subjectPublicKey: anObject [
	"Set the value of subjectPublicKey"

	subjectPublicKey := anObject
]

{ #category : #accessing }
X509SubjectPublicKeyInfo >> subjectPublicKeyDecoded [

	^ ASN1Stream decodeBytes: self subjectPublicKey bytes.

]
