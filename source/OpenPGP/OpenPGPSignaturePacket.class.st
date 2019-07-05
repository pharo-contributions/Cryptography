Class {
	#name : #OpenPGPSignaturePacket,
	#superclass : #OpenPGPPacket,
	#instVars : [
		'signatureType',
		'publicKeyAlgorithm',
		'hashAlgorithm',
		'msbOfHash',
		'mpis',
		'creationTime',
		'signer',
		'hashedSubpacketData',
		'unhashedSubpacketData'
	],
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPSignaturePacket >> acceptVisitor: aVisitor [
	^aVisitor handleSignaturePacket: self
]

{ #category : #testing }
OpenPGPSignaturePacket >> canBeAddedTo: aPacket [
	^aPacket isUserIDPacket or: [aPacket isPhotoIDPacket or: [aPacket isPublicKeyPacket or: [aPacket isSubkeyPacket]]]
]

{ #category : #accessing }
OpenPGPSignaturePacket >> creationTime [
	creationTime isNil ifTrue: [self parseData].
	^creationTime
]

{ #category : #testing }
OpenPGPSignaturePacket >> isSignaturePacket [
	^true
]

{ #category : #'initialize-release' }
OpenPGPSignaturePacket >> parseData: aStream [
	version := aStream next.
	version <= 3 ifTrue: [
		aStream next = 5 ifFalse: [self error: 'This number must be 5. See RFC 2440'].
		signatureType := aStream next.
		creationTime := aStream nextNumber: 4.
		signer := aStream next: 8.
		publicKeyAlgorithm := aStream next.
		hashAlgorithm := aStream next.
		msbOfHash := aStream nextNumber: 2.
		mpis := aStream mpisUpToEnd].
	version = 4 ifTrue: [
		signatureType := aStream next.
		publicKeyAlgorithm := aStream next.
		hashAlgorithm := aStream next.
		hashedSubpacketData := aStream nextSubpacketData.
		unhashedSubpacketData := aStream nextSubpacketData.
		msbOfHash := aStream nextNumber: 2.
		mpis := aStream mpisUpToEnd.
		self subpackets: hashedSubpacketData do: [:subdata |
			subdata first = 2 ifTrue: [
				creationTime := (OpenPGPStream on: subdata)
				next: 1; nextNumber: 4]].
		self subpackets: unhashedSubpacketData do: [:subdata |
			subdata first = 16 ifTrue: [
				signer := subdata copyFrom: 2 to: subdata size]]]
]

{ #category : #verifying }
OpenPGPSignaturePacket >> putKeyPacket: aPacket onHashStream: aStream [
	aStream
		nextPut: 16r99;
		nextNumber: 2 put: aPacket dataSize;
		nextPutAll: aPacket data
]

{ #category : #verifying }
OpenPGPSignaturePacket >> putSignatureDataOnHashStream: aStream [
	version = 3 ifTrue: [
		aStream
			nextPut: signatureType;
			nextNumber: 4 put: creationTime].
	version = 4 ifTrue: [
		aStream
			nextPut: 4;
			nextPut: signatureType;
			nextPut: publicKeyAlgorithm;
			nextPut: hashAlgorithm.
		aStream
			nextNumber: 2 put: hashedSubpacketData size;
			nextPutAll: hashedSubpacketData.
		aStream
			nextPut: 4;
			nextPut: 16rFF;
			nextNumber: 4 put: hashedSubpacketData size + 6]
]

{ #category : #verifying }
OpenPGPSignaturePacket >> putUserIdPacket: aPacket onHashStream: aStream [
	aStream
		nextPut: 16rB4;
		nextNumber: 4 put: aPacket dataSize;
		nextPutAll: aPacket data
]

{ #category : #'initialize-release' }
OpenPGPSignaturePacket >> signer [
	signer = nil ifTrue: [self parseData].
	^signer
]

{ #category : #private }
OpenPGPSignaturePacket >> subpackets: aByteArray do: aBlock [
	| str len |
	str := OpenPGPStream on: aByteArray.
	[str atEnd] whileFalse: [
		len := str nextNewFormatPacketLength.
		aBlock value: (str next: len)]
]

{ #category : #verifying }
OpenPGPSignaturePacket >> verifyKey: keyPacket userId: userIdPacket [
	"compute a hash from the given key and userId according to my hash function.
	This method is ugly, but not much more than RFC2440 from which it was created."
	| message hash |
	hashAlgorithm = 2 ifFalse: [self error: 'Only SHA-1 is supported'].
	publicKeyAlgorithm = 17 ifFalse: [self error: 'Only DSA signatures are supported'].
	message := ReadWriteStream on: ByteArray new.
	self putKeyPacket: keyPacket onHashStream: message.
	self putUserIdPacket: userIdPacket onHashStream: message.
	self putSignatureDataOnHashStream: message.
	message reset.
	hash := SecureHashAlgorithm new hashStream: message.
	^DigitalSignatureAlgorithm new
		verifySignature: mpis
		ofMessageHash: hash
		publicKey: keyPacket mpis
]

{ #category : #accessing }
OpenPGPSignaturePacket >> version [
	version isNil ifTrue: [self parseData].
	^version
]
