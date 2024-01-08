"
Reader for RSA private key files
"
Class {
	#name : #RSAPrivateKeyFileReader,
	#superclass : #Object,
	#instVars : [
		'bytes',
		'decryptedBytes',
		'iv',
		'password'
	],
	#category : #'ASN1-Readers-RSA'
}

{ #category : #'instance creation' }
RSAPrivateKeyFileReader class >> fromFile: filename [
	"(RSAPrivateKeyFileReader fromFile: '/usr/local/ssl/private/CA.key')"
	"(RSAPrivateKeyFileReader fromFile: '/Users/slosher/Desktop/squeak/certificates/rsa.key')"

	^ self new initializeFromFileContents: filename asFileReference contents

]

{ #category : #converting }
RSAPrivateKeyFileReader >> asASN1Value [

	self decryptedBytes isNil 
		ifTrue: [self decrypt].
	^ ASN1Stream decodeBytes: self decryptedBytes.

]

{ #category : #converting }
RSAPrivateKeyFileReader >> asPrivateKey [

	| asn1 |
	asn1 := self asASN1Value.
	(asn1 at: 1) > 0
		ifTrue: [^ RSAPublicKey exponent: (asn1 at: 3) modulo: (asn1 at: 1)].
	^ RSAPrivateKey p: (asn1 at: 5) q: (asn1 at: 6) dP: (asn1 at: 7) dQ: (asn1 at: 8) qInv: (asn1 at: 9)
]

{ #category : #converting }
RSAPrivateKeyFileReader >> asPublicKey [

	| asn1 |
	asn1 := self asASN1Value.
	^ RSAPublicKey exponent: (asn1 at: 3) modulo: (asn1 at: 2)
]

{ #category : #accessing }
RSAPrivateKeyFileReader >> bytes [
	"Answer the value of bytes"

	^ bytes
]

{ #category : #accessing }
RSAPrivateKeyFileReader >> bytes: anObject [
	"Set the value of bytes"

	bytes := anObject
]

{ #category : #initialization }
RSAPrivateKeyFileReader >> decrypt [

	| cipher key block encryptedStream decryptedStream |
	self password ifNil: [self password: (UIManager default requestPassword: 'Enter your password')].
	key := OpenSSLKeyDerivationFunction new 
		derivedKeyFromPassword: self password 
		salt: self iv 
		size: 24.
	cipher := (TripleDES key: key) cbc initialVector: iv.
	encryptedStream := self bytes readStream.
	decryptedStream := ReadWriteStream on: (ByteArray new: encryptedStream size).
	[encryptedStream atEnd] whileFalse: 
		[block := encryptedStream next: 8.
		cipher decryptBlock: block.
		decryptedStream nextPutAll: block].
	self decryptedBytes: decryptedStream contents.

]

{ #category : #accessing }
RSAPrivateKeyFileReader >> decryptedBytes [
	"Answer the value of decryptedBytes"

	^ decryptedBytes
]

{ #category : #accessing }
RSAPrivateKeyFileReader >> decryptedBytes: anObject [
	"Set the value of decryptedBytes"

	decryptedBytes := anObject
]

{ #category : #initialization }
RSAPrivateKeyFileReader >> initializeFromFileContents: data [

	| i j theData |
	i := data indexOfSubCollection: '--BEGIN ' startingAt: 1.
	i = 0 ifTrue: [self derBytes: data asByteArray. ^ self].
	i := data indexOfSubCollection: 'KEY--' startingAt: i.
	i := data findAnySubstring: String crlf startingAt: i.
	j := data findAnySubstring: String crlf startingAt: i + 1.
	self processProcType: (data copyFrom: i + 1 to: j).
	i := j.
	j := data findAnySubstring: String crlf startingAt: i + 1.
	self processDEKInfo: (data copyFrom: i + 1 to: j).
	i := j.
	j := data indexOfSubCollection: '--END ' startingAt: i.
	theData := (data copyFrom: i to: j)
		reject: [:c | (c = $-) or: [c isSeparator]].
	theData := (Base64MimeConverter mimeDecodeToBytes: theData readStream) contents.
	self bytes: theData.

]

{ #category : #accessing }
RSAPrivateKeyFileReader >> iv [
	"Answer the value of iv"

	^ iv
]

{ #category : #accessing }
RSAPrivateKeyFileReader >> iv: anObject [
	"Set the value of iv"

	iv := anObject
]

{ #category : #accessing }
RSAPrivateKeyFileReader >> password [
	"Answer the value of password"

	^ password
]

{ #category : #accessing }
RSAPrivateKeyFileReader >> password: anObject [
	"Set the value of password"

	password := anObject
]

{ #category : #initialization }
RSAPrivateKeyFileReader >> processDEKInfo: data [

	| stream algorithm |
	stream := data readStream.
	stream upTo: $:.
	algorithm := (stream upTo: $,) withBlanksCondensed.
	self iv: (Integer readFrom: stream base: 16) asByteArray.

]

{ #category : #initialization }
RSAPrivateKeyFileReader >> processProcType: data [

]
