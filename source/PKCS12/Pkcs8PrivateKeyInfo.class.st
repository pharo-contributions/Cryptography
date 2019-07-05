Class {
	#name : #Pkcs8PrivateKeyInfo,
	#superclass : #Object,
	#instVars : [
		'version',
		'privateKeyAlgorithm',
		'privateKey',
		'attributes'
	],
	#category : 'PKCS12'
}

{ #category : #api }
Pkcs8PrivateKeyInfo >> asPrivateKey [

	| asn1 |
	asn1 := ASN1Stream decodeBytes: self privateKey.
	(asn1 at: 1) > 0
		ifTrue: [^ RSAPublicKey exponent: (asn1 at: 3) modulo: (asn1 at: 1)]
		ifFalse: [^ RSAPrivateKey 
			p: (asn1 at: 5) 
			q: (asn1 at: 6) 
			dP: (asn1 at: 7) 
			dQ: (asn1 at: 8) 
			qInv: (asn1 at: 9)]
]

{ #category : #accessing }
Pkcs8PrivateKeyInfo >> attributes [
	"Answer the value of attributes"

	^ attributes
]

{ #category : #accessing }
Pkcs8PrivateKeyInfo >> attributes: anObject [
	"Set the value of attributes"

	attributes := anObject
]

{ #category : #accessing }
Pkcs8PrivateKeyInfo >> privateKey [
	"Answer the value of privateKey"

	^ privateKey
]

{ #category : #accessing }
Pkcs8PrivateKeyInfo >> privateKey: anObject [
	"Set the value of privateKey"

	privateKey := anObject
]

{ #category : #accessing }
Pkcs8PrivateKeyInfo >> privateKeyAlgorithm [
	"Answer the value of privateKeyAlgorithm"

	^ privateKeyAlgorithm
]

{ #category : #accessing }
Pkcs8PrivateKeyInfo >> privateKeyAlgorithm: anObject [
	"Set the value of privateKeyAlgorithm"

	privateKeyAlgorithm := anObject
]

{ #category : #accessing }
Pkcs8PrivateKeyInfo >> version [
	"Answer the value of version"

	^ version
]

{ #category : #accessing }
Pkcs8PrivateKeyInfo >> version: anObject [
	"Set the value of version"

	version := anObject
]
