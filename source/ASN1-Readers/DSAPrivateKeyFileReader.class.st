"
Reader for DSA private key files
"
Class {
	#name : #DSAPrivateKeyFileReader,
	#superclass : #Object,
	#instVars : [
		'bytes',
		'decryptedBytes',
		'iv',
		'password'
	],
	#category : #'ASN1-Readers-DSA'
}

{ #category : #'instance creation' }
DSAPrivateKeyFileReader class >> fromFile: filename [
	"(DSAPrivateKeyFileReader fromFile: '/usr/local/ssl/private/dsa.key')"
	"(DSAPrivateKeyFileReader fromFile: '/Users/slosher/Desktop/squeak/certificates/dsa.key')"

	| fs data |
	fs := StandardFileStream fileNamed: filename.
	data := fs contentsOfEntireFile.
	^ self new initializeFromFileContents: data

]

{ #category : #converting }
DSAPrivateKeyFileReader >> asASN1Value [

	self decryptedBytes isNil 
		ifTrue: [self decrypt].
	^ ASN1Stream decodeBytes: self decryptedBytes

]

{ #category : #converting }
DSAPrivateKeyFileReader >> asPrivateKey [

	| asn1 |
	asn1 := self asASN1Value.
	^ DSAPrivateKey p: (asn1 at: 2) q: (asn1 at: 3) g: (asn1 at: 4) x: (asn1 at: 6).

]

{ #category : #converting }
DSAPrivateKeyFileReader >> asPublicKey [

	| asn1 |
	asn1 := self asASN1Value.
	^ DSAPublicKey p: (asn1 at: 2) q: (asn1 at: 3) g: (asn1 at: 4) y: (asn1 at: 5).

]

{ #category : #accessing }
DSAPrivateKeyFileReader >> bytes [
	"Answer the value of bytes"

	^ bytes
]

{ #category : #accessing }
DSAPrivateKeyFileReader >> bytes: anObject [
	"Set the value of bytes"

	bytes := anObject
]

{ #category : #initialization }
DSAPrivateKeyFileReader >> decrypt [

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
DSAPrivateKeyFileReader >> decryptedBytes [
	"Answer the value of decryptedBytes"

	^ decryptedBytes
]

{ #category : #accessing }
DSAPrivateKeyFileReader >> decryptedBytes: anObject [
	"Set the value of decryptedBytes"

	decryptedBytes := anObject
]

{ #category : #initialization }
DSAPrivateKeyFileReader >> initializeFromFileContents: data [

	| i j theData |
	i := data indexOfSubCollection: '--BEGIN ' startingAt: 1.
	i = 0 ifTrue: [self bytes: data asByteArray. ^ self].
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
DSAPrivateKeyFileReader >> iv [
	"Answer the value of iv"

	^ iv
]

{ #category : #accessing }
DSAPrivateKeyFileReader >> iv: anObject [
	"Set the value of iv"

	iv := anObject
]

{ #category : #accessing }
DSAPrivateKeyFileReader >> password [
	"Answer the value of password"

	^ password
]

{ #category : #accessing }
DSAPrivateKeyFileReader >> password: anObject [
	"Set the value of password"

	password := anObject
]

{ #category : #initialization }
DSAPrivateKeyFileReader >> processDEKInfo: data [

	| stream algorithm |
	stream := data readStream.
	stream upTo: $:.
	algorithm := (stream upTo: $,) withBlanksCondensed.
	self iv: (Integer readFrom: stream base: 16) asByteArray.

]

{ #category : #initialization }
DSAPrivateKeyFileReader >> processProcType: data [

]
