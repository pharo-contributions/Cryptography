Class {
	#name : #OpenPGPSignatureV4Data,
	#superclass : #OpenPGPSignatureData,
	#instVars : [
		'hashedSubpacketData',
		'unhashedSubpacketData'
	],
	#category : 'OpenPGP-Core'
}

{ #category : #accessing }
OpenPGPSignatureV4Data >> creationTime [
	self subpackets: hashedSubpacketData do: [:data |
		data first = 2 ifTrue: [^data unsignedLongAt: 2 bigEndian: true]].
	^nil
]

{ #category : #verifying }
OpenPGPSignatureV4Data >> putSignatureDataOnHashStream: aStream [
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
		nextNumber: 4 put: hashedSubpacketData size + 6
]

{ #category : #reading }
OpenPGPSignatureV4Data >> readFrom: aStream [
	aStream next = 4 ifFalse: [self error: 'version type mismatch'].
	signatureType := aStream next.
	publicKeyAlgorithm := aStream next.
	hashAlgorithm := aStream next.
	hashedSubpacketData := aStream nextSubpacketData.
	unhashedSubpacketData := aStream nextSubpacketData.
	msbOfHash := aStream nextNumber: 2.
	mpis := aStream mpisUpToEnd
]

{ #category : #accessing }
OpenPGPSignatureV4Data >> subpackets: aByteArray do: aBlock [
	| str len |
	str := OpenPGPStream on: (ReadStream on: aByteArray).
	[str atEnd] whileFalse: [
		len := str nextNewFormatPacketLength.
		aBlock value: (str next: len)]
]
