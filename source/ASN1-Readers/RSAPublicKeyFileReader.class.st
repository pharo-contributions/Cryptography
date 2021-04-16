Class {
	#name : #RSAPublicKeyFileReader,
	#superclass : #Object,
	#instVars : [
		'bytes'
	],
	#category : #'ASN1-Readers-RSA'
}

{ #category : #'instance creation' }
RSAPublicKeyFileReader class >> fromFile: filename [
	"(RSAPrivateKeyFileReader fromFile: '/usr/local/ssl/private/CA.key')"
	"(RSAPrivateKeyFileReader fromFile: '/Users/slosher/Desktop/squeak/certificates/rsa.key')"

	| fs data |
	fs := StandardFileStream fileNamed: filename.
	data := fs contentsOfEntireFile.
	^ self new initializeFromFileContents: data

]

{ #category : #converting }
RSAPublicKeyFileReader >> asASN1Value [

	| asn1 |
	asn1 := ASN1Stream decodeBytes: self bytes.
	^ ASN1Stream decodeBytes: (asn1 at: 2) bytes
]

{ #category : #converting }
RSAPublicKeyFileReader >> asPublicKey [

	| asn1 |
	asn1 := self asASN1Value.
	^ RSAPublicKey exponent: (asn1 at: 2) modulo: (asn1 at: 1)
]

{ #category : #accessing }
RSAPublicKeyFileReader >> bytes [
	"Answer the value of bytes"

	^ bytes
]

{ #category : #accessing }
RSAPublicKeyFileReader >> bytes: anObject [
	"Set the value of bytes"

	bytes := anObject
]

{ #category : #'initialize-release' }
RSAPublicKeyFileReader >> initializeFromFileContents: data [

	| i j theData |
	i := data indexOfSubCollection: '--BEGIN ' startingAt: 1.
	i = 0 ifTrue: [self derBytes: data asByteArray. ^ self].
	i := data indexOfSubCollection: 'KEY--' startingAt: i.
	i := data findAnySubstring: String crlf startingAt: i.
	j := data findAnySubstring: String crlf startingAt: i + 1.
"	self processProcType: (data copyFrom: i + 1 to: j)."
	i := j.
	j := data findAnySubstring: String crlf startingAt: i + 1.
"	self processDEKInfo: (data copyFrom: i + 1 to: j)."
	i := j.
	j := data indexOfSubCollection: '--END ' startingAt: i.
	theData := (data copyFrom: i to: j)
		reject: [:c | (c = $-) or: [c isSeparator]].
	theData := (Base64MimeConverter mimeDecodeToBytes: theData readStream) contents.
	self bytes: theData.

]
