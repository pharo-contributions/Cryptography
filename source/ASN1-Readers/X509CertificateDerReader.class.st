Class {
	#name : #X509CertificateDerReader,
	#superclass : #Object,
	#instVars : [
		'derBytes'
	],
	#category : #'ASN1-Readers-X509'
}

{ #category : #'instance creation' }
X509CertificateDerReader class >> fromDerBytes: bytes [

	^ self new 
		derBytes: bytes;
		yourself.

]

{ #category : #'instance creation' }
X509CertificateDerReader class >> fromFile: filename [
	"(X509CertificateDerReader fromFile: '/Users/slosher/Desktop/squeak/certificates/rsa.cert') asCertificate"
	"(X509CertificateDerReader fromFile: '/Users/slosher/Desktop/squeak/certificates/dsa.cert') asCertificate"
	"(X509CertificateDerReader fromFile: '/Users/slosher/Desktop/squeak/certificates/class3cacert.crt') asCertificate"
	"(X509CertificateDerReader fromFile: '/Users/slosher/Desktop/squeak/certificates/class1cacert.crt') asCertificate"

	| fs data |
	fs := StandardFileStream fileNamed: filename.
	data := fs contentsOfEntireFile.
	^ self new initializeFromFileContents: data

]

{ #category : #accessing }
X509CertificateDerReader >> derBytes [
	"Answer the value of derBytes"

	^ derBytes
]

{ #category : #accessing }
X509CertificateDerReader >> derBytes: anObject [
	"Set the value of derBytes"

	derBytes := anObject
]

{ #category : #'initialize-release' }
X509CertificateDerReader >> initializeFromFileContents: data [

	| i j theData |
	i := data indexOfSubCollection: '--BEGIN ' startingAt: 1.
	i = 0 
		ifTrue: [theData := data reject: [:c | (c = $-) or: [c isSeparator]]]
		ifFalse: [
			i := data indexOfSubCollection: 'CERTIFICATE--' startingAt: i.
			j := data indexOfSubCollection: '--END ' startingAt: i.
			i := data findAnySubStr: String crlf startingAt: i.
			theData := (data copyFrom: i to: j)
				reject: [:c | (c = $-) or: [c isSeparator]]].
	theData := (Base64MimeConverter mimeDecodeToBytes: theData readStream) contents.
	self derBytes: theData.

]
