Class {
	#name : #OpenPGPSignatureV3Data,
	#superclass : #OpenPGPSignatureData,
	#instVars : [
		'creationTime',
		'signer'
	],
	#category : 'OpenPGP-Core'
}

{ #category : #accessing }
OpenPGPSignatureV3Data >> creationTime [
	^creationTime
]

{ #category : #verifying }
OpenPGPSignatureV3Data >> putSignatureDataOnHashStream: aStream [
	aStream
		nextPut: signatureType;
		nextNumber: 4 put: creationTime
]

{ #category : #verifying }
OpenPGPSignatureV3Data >> putUserIdPacket: aPacket onHashStream: aStream [
	aStream
		nextPutAll: aPacket data
]

{ #category : #reading }
OpenPGPSignatureV3Data >> readFrom: aStream [
	aStream next = 3 ifFalse: [self error: 'version number mismatch'].
	aStream next = 5 ifFalse: [self error: 'This number must be 5. See RFC 2440'].
	signatureType := aStream next.
	creationTime := aStream nextNumber: 4.
	signer := aStream next: 8.
	publicKeyAlgorithm := aStream next.
	hashAlgorithm := aStream next.
	msbOfHash := aStream nextNumber: 2.
	mpis := aStream mpisUpToEnd
]

{ #category : #accessing }
OpenPGPSignatureV3Data >> signer [
	^signer
]
