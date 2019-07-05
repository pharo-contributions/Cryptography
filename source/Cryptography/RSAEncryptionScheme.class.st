"
Example:

| rsa pub priv rsaes c |
rsa := RSAKeyPairGenerator new.
rsa bits: 1024.
pub := rsa publicKey.
priv := rsa privateKey. 

rsaes := RSAEncryptionScheme new.
rsaes setPublicKey: pub privateKey: priv parameter: 'p'.

c := rsaes encrypt: 'hola'.
(rsaes decrypt: c) asString.


"
Class {
	#name : #RSAEncryptionScheme,
	#superclass : #Object,
	#instVars : [
		'hash',
		'hashLen',
		'rand',
		'publicKey',
		'privateKey',
		'encodingParameter'
	],
	#category : 'Cryptography-RSA'
}

{ #category : #'instance creation' }
RSAEncryptionScheme class >> new [
	^ super new initialize
]

{ #category : #'instance creation' }
RSAEncryptionScheme class >> publicKey: aRSAPublicKey privateKey: aRSAPrivateKey parameter: aString [
	^ self new setPublicKey: aRSAPublicKey privateKey: aRSAPrivateKey parameter: aString
]

{ #category : #'OAEP encoder' }
RSAEncryptionScheme >> decode: em parameter: parameter [
	| emLen maskedSeed maskedDB seedMask seed dbMask dataBlock dbLen pHash pHashPrima i terminado b |
	parameter size > (2 raisedTo: 60) ifTrue: [self error: 'decoding error'].
	emLen := em size.
	emLen < (2 * hashLen + 1) ifTrue: [self error: 'decoding error'].

	maskedSeed := em copyFrom: 1 to: hashLen.
	maskedDB := em copyFrom: (hashLen + 1) to: emLen.
	seedMask := self maskOfLength: hashLen fromString: maskedDB.
	seed := maskedSeed bitXor: seedMask.
	dbMask := self maskOfLength: (emLen - hashLen) fromString: seed.
	dataBlock := maskedDB bitXor: dbMask.
	dbLen := dataBlock size.

	pHash := (hash hashMessage: parameter) asByteArrayOfSize: hashLen.
	pHashPrima := dataBlock copyFrom: 1 to: hashLen.
	i := hashLen + 1.
	terminado := false.
	[terminado] whileFalse: 
		[b := dataBlock at: i.
		b=0 ifTrue: 
			[i := i+1.
			i > dbLen ifTrue: [self error: 'decoding error']]
		ifFalse: 
			[b=1 
				ifTrue: [terminado := true]
				ifFalse: [self error: 'decoding error']
			]
		].
	pHash = pHashPrima ifFalse: [self error: 'decoding error'].
	^ dataBlock copyFrom: i+1 to: dbLen
]

{ #category : #'encryption scheme' }
RSAEncryptionScheme >> decrypt: aByteArray [
	| m |
	m := privateKey crypt: aByteArray asInteger.
	^ self decode: m asByteArray parameter: encodingParameter.
	

	
]

{ #category : #'OAEP encoder' }
RSAEncryptionScheme >> encode: message parameter: parameter length: emLen [
	| messageLen paddingString pHash  dataBlock seed dbMask maskedDB seedMask maskedSeed em |

	parameter size > (2 raisedTo: 60) ifTrue: 
		[self error: 'parameter string too long'].
	messageLen := message size.
	messageLen > (emLen - (2 * hashLen) - 1) ifTrue: 
		[self error: 'message too long'].

	paddingString := 0 asByteArrayOfSize: (emLen - messageLen - (2*hashLen) - 1).
	pHash := (hash hashMessage: parameter) asByteArrayOfSize: hashLen.
	dataBlock := pHash, paddingString, (ByteArray with: 1), message.

	seed := ByteArray new: hashLen.
	1 to: hashLen do: 
		[:i | seed at: i put: (rand next * 256) floor].
	dbMask := self maskOfLength: (emLen - hashLen) fromString: seed.
	maskedDB := dataBlock bitXor: dbMask.
	seedMask := self maskOfLength: hashLen fromString: maskedDB.
	maskedSeed := seed bitXor: seedMask.
	em := maskedSeed, maskedDB.
	^ em
]

{ #category : #'encryption scheme' }
RSAEncryptionScheme >> encrypt: aByteArray [
	| k em c |
	k := publicKey bits // 8.
	em := self encode: aByteArray parameter: encodingParameter length: k-1.
	c := publicKey crypt: em asInteger.
	^ c asByteArray
]

{ #category : #initialization }
RSAEncryptionScheme >> initialize [
	rand := Random new.
	hash := SHA1 new.
	hashLen := 20
]

{ #category : #'mask generator' }
RSAEncryptionScheme >> maskOfLength: numberOfBytes fromString: seedString [
	| t c |
	numberOfBytes > ((2 raisedTo: 32) * hashLen) ifTrue: 
		[self error: 'mask too long'].
	t := ByteArray new.
	0 to: (numberOfBytes / hashLen) floor do: [:counter |
		c := counter asByteArrayOfSize: 4.
		t := t, ((hash hashMessage: seedString, c) asByteArrayOfSize: hashLen)].
	^ t copyFrom: 1 to: numberOfBytes

]

{ #category : #initialization }
RSAEncryptionScheme >> setPublicKey: aRSAPublicKey privateKey: aRSAPrivateKey parameter: aString [
	publicKey := aRSAPublicKey.
	privateKey := aRSAPrivateKey.
	encodingParameter := aString
]
