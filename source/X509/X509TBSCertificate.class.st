Class {
	#name : #X509TBSCertificate,
	#superclass : #Object,
	#instVars : [
		'version',
		'serialNumber',
		'signature',
		'issuer',
		'validity',
		'subject',
		'subjectPublicKeyInfo',
		'extensions'
	],
	#category : 'X509'
}

{ #category : #'initialize-release' }
X509TBSCertificate >> asAsn1Bytes [

	| type |
	type := (ASN1Module name: #x509) find: #TBSCertificate.
	^ ASN1Stream encode: self withType: type

]

{ #category : #accessing }
X509TBSCertificate >> extensions [
	"Answer the value of extensions"

	^ extensions
]

{ #category : #accessing }
X509TBSCertificate >> extensions: anObject [
	"Set the value of extensions"

	extensions := anObject
]

{ #category : #accessing }
X509TBSCertificate >> issuer [
	"Answer the value of issuer"

	^ issuer
]

{ #category : #accessing }
X509TBSCertificate >> issuer: anObject [
	"Set the value of issuer"

	issuer := anObject
]

{ #category : #accessing }
X509TBSCertificate >> issuerUniqueID [

	^ nil
]

{ #category : #accessing }
X509TBSCertificate >> serialNumber [
	"Answer the value of serialNumber"

	^ serialNumber
]

{ #category : #accessing }
X509TBSCertificate >> serialNumber: anObject [
	"Set the value of serialNumber"

	serialNumber := anObject
]

{ #category : #accessing }
X509TBSCertificate >> signature [
	"Answer the value of signature"

	^ signature
]

{ #category : #accessing }
X509TBSCertificate >> signature: anObject [
	"Set the value of signature"

	signature := anObject
]

{ #category : #accessing }
X509TBSCertificate >> subject [
	"Answer the value of subject"

	^ subject
]

{ #category : #accessing }
X509TBSCertificate >> subject: anObject [
	"Set the value of subject"

	subject := anObject
]

{ #category : #accessing }
X509TBSCertificate >> subjectPublicKeyInfo [
	"Answer the value of subjectPublicKeyInfo"

	^ subjectPublicKeyInfo
]

{ #category : #accessing }
X509TBSCertificate >> subjectPublicKeyInfo: anObject [
	"Set the value of subjectPublicKeyInfo"

	subjectPublicKeyInfo := anObject
]

{ #category : #accessing }
X509TBSCertificate >> subjectUniqueID [

	^ nil
]

{ #category : #accessing }
X509TBSCertificate >> validity [
	"Answer the value of validity"

	^ validity
]

{ #category : #accessing }
X509TBSCertificate >> validity: anObject [
	"Set the value of validity"

	validity := anObject
]

{ #category : #accessing }
X509TBSCertificate >> version [
	"Answer the value of version"

	^ version
]

{ #category : #accessing }
X509TBSCertificate >> version: anObject [
	"Set the value of version"

	version := anObject
]
