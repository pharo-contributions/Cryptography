Class {
	#name : #Pkcs12PrivateKeyFileReader,
	#superclass : #Object,
	#instVars : [
		'pfx',
		'privateKeys',
		'certs',
		'password'
	],
	#category : 'PKCS12'
}

{ #category : #'as yet unclassified' }
Pkcs12PrivateKeyFileReader class >> fromFile: filename [
	"(Pkcs12PrivateKeyFileReader fromFile: '/Users/slosher/Desktop/squeak/certificates/usarhiocertpks12.pfx')"

	| password |
	password := FillInTheBlank requestPassword: 'Enter your password'.
	^ self fromFile: filename password: password.

]

{ #category : #'as yet unclassified' }
Pkcs12PrivateKeyFileReader class >> fromFile: filename password: aPassword [
	"(Pkcs12PrivateKeyFileReader fromFile: '/Users/slosher/Desktop/squeak/certificates/usarhiocertpks12.pfx')"

	| fs data |
	fs := StandardFileStream fileNamed: filename.
	data := fs contentsOfEntireFile.
	^ self new
		password: aPassword;
		initializeFromFileContents: data.

]

{ #category : #accessing }
Pkcs12PrivateKeyFileReader >> asCertificate [

	self certs isEmpty ifTrue: [^ nil].
	^ self certs first

]

{ #category : #accessing }
Pkcs12PrivateKeyFileReader >> asPrivateKey [

	self privateKeys isEmpty ifTrue: [^ nil].
	^ self privateKeys first
]

{ #category : #accessing }
Pkcs12PrivateKeyFileReader >> certs [
	"Answer the value of certs"

	certs isNil ifTrue: [self certs: OrderedCollection new].
	^ certs
]

{ #category : #accessing }
Pkcs12PrivateKeyFileReader >> certs: anObject [
	"Set the value of certs"

	certs := anObject
]

{ #category : #'initialize-release' }
Pkcs12PrivateKeyFileReader >> decodeContentInfo: contentInfo [

	| safeContents |
	contentInfo contentType oid = '1.2.840.113549.1.7.1'
		ifTrue: [
			safeContents := ASN1Stream 
				decodeBytes: contentInfo content
				withType: ((ASN1Module name: #pkcs) find: #SafeContents).
			safeContents do: [:eachSafeBag | self decodeSafeBag: eachSafeBag].
			^ self].
	contentInfo contentType oid = '1.2.840.113549.1.7.6'
		ifTrue: [
			safeContents := contentInfo content decryptWithPassword: self password.
			safeContents do: [:eachSafeBag | self decodeSafeBag: eachSafeBag].
			^ self].
	self error: 'unknown content info: ', contentInfo contentType oid.

]

{ #category : #'initialize-release' }
Pkcs12PrivateKeyFileReader >> decodeSafeBag: safeBag [

	| asn1 key keyBag cert |
	safeBag bagId oid = '1.2.840.113549.1.12.10.1.1'
		ifTrue: [
			asn1 := ASN1Stream decodeBytes: safeBag bagValue.
			(asn1 at: 1) > 0
				ifTrue: [key := RSAPublicKey exponent: (asn1 at: 3) modulo: (asn1 at: 1)]
				ifFalse: [key := RSAPrivateKey p: (asn1 at: 5) q: (asn1 at: 6) dP: (asn1 at: 7) dQ: (asn1 at: 8) qInv: (asn1 at: 9)].
			self privateKeys add: key.
			^ self].
	safeBag bagId oid = '1.2.840.113549.1.12.10.1.2'
		ifTrue: [
			keyBag := safeBag bagValue decryptWithPassword: self password.
			key := keyBag asPrivateKey.
			self privateKeys add: key.
			^ self].
	safeBag bagId oid = '1.2.840.113549.1.12.10.1.3'
		ifTrue: [
			cert := ASN1Stream 
				decodeBytes: safeBag bagValue certValue 
				withType: ((ASN1Module name: #x509) find: #Certificate).
			self certs add: cert.
			^ self].
	self error: 'unknown safe bag: ', safeBag bagId oid.

]

{ #category : #'initialize-release' }
Pkcs12PrivateKeyFileReader >> initializeFromFileContents: data [

	| authSafe |
	self pfx: (ASN1Stream 
		decodeBytes: data asByteArray
		withType: ((ASN1Module name: #pkcs) find: #PFX)).
	self validatePFXMAC.
	authSafe := ASN1Stream 
		decodeBytes: self pfx authSafe content 
		withType: ((ASN1Module name: #pkcs) find: #AuthenticatedSafe).
	authSafe do: [:eachContentInfo | self decodeContentInfo: eachContentInfo].
	self password: nil.
]

{ #category : #accessing }
Pkcs12PrivateKeyFileReader >> password [
	"Answer the value of password"

	^ password
]

{ #category : #accessing }
Pkcs12PrivateKeyFileReader >> password: anObject [
	"Set the value of password"

	password := anObject
]

{ #category : #accessing }
Pkcs12PrivateKeyFileReader >> pfx [
	"Answer the value of pfx"

	^ pfx
]

{ #category : #accessing }
Pkcs12PrivateKeyFileReader >> pfx: anObject [
	"Set the value of pfx"

	pfx := anObject
]

{ #category : #accessing }
Pkcs12PrivateKeyFileReader >> privateKeys [
	"Answer the value of privateKeys"

	privateKeys isNil ifTrue: [self privateKeys: OrderedCollection new].
	^ privateKeys
]

{ #category : #accessing }
Pkcs12PrivateKeyFileReader >> privateKeys: anObject [
	"Set the value of privateKeys"

	privateKeys := anObject
]

{ #category : #'initialize-release' }
Pkcs12PrivateKeyFileReader >> validatePFXMAC [

	| data salt iterations macValue calculatedMacValue hashMaterial hmac |
	data := self pfx authSafe content.
	salt := self pfx macData macSalt.
	iterations := self pfx macData iterations.
	macValue := self pfx macData mac digest.
	hashMaterial := Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 3
		fromPassword: self password
		salt: salt
		iterations: iterations
		size: 20.
	hmac := SHA1 new hmac.
	hmac key: hashMaterial.
	calculatedMacValue := hmac digestMessage: data.
	calculatedMacValue = macValue
		ifFalse: [self error: 'invalid MAC'].
	
]
