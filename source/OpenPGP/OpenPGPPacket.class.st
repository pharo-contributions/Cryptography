"
This class is used to represent OpenPGP packets. There are no subclasses; all type-specific behavior is implemented by the interpretedData inst var. This makes it easier to parse and write OpenPGP files, even if they contain unknown packet types.

Instance Variables:
header			<Integer>		the first byte of the packet
dataSize			<Integer|nil>		size of the data, or nil if the packet has undetermined size
data			<ByteArray>		raw data contents of packet
trust			<ByteArray|nil>	contents of associated trust packed
"
Class {
	#name : #OpenPGPPacket,
	#superclass : #Object,
	#instVars : [
		'header',
		'version',
		'data',
		'trust',
		'owner',
		'ownedPackets'
	],
	#classVars : [
		'TagTypes'
	],
	#category : 'OpenPGP-Packets'
}

{ #category : #'class initialization' }
OpenPGPPacket class >> initialize [
	"OpenPGPPacket initialize"
	TagTypes := Array new: 64 withAll: 'user defined'.
	#(	0	'Reserved'
		1	'Public-Key Encrypted Session Key'
		2	'Signature'
		3	'Symmetric-Key Encrypted Session Key'
		4	'One-Pass Signature'
		5	'Secret Key'
		6	'Public Key'
		7	'Secret Subkey'
		8	'Compressed Data'
		9	'Symmetrically Encrypted Data'
		10	'Marker'
		11	'Literal Data'
		12	'Trust'
		13	'User ID'
		14	'Public Subkey'
		17	'Photo ID') pairsDo: [:index :string |
				TagTypes at: index+1 put: string]
]

{ #category : #accessing }
OpenPGPPacket class >> packetClassForTag: anInteger [
	anInteger = 0 ifTrue: [self error: 'invalid packet tag value'].
	anInteger = 1 ifTrue: [^OpenPGPPublicKeyEncryptedSessionKeyPacket].
	anInteger = 2 ifTrue: [^OpenPGPSignaturePacket].
	anInteger = 3 ifTrue: [^OpenPGPSymmetricKeyEncryptedSessionKeyPacket].
	anInteger = 4 ifTrue: [^OpenPGPOnePassSignaturePacket].
	anInteger = 5 ifTrue: [^OpenPGPSecretKeyPacket].
	anInteger = 6 ifTrue: [^OpenPGPPublicKeyPacket].
	anInteger = 7 ifTrue: [^OpenPGPSecretSubkeyPacket].
	anInteger = 8 ifTrue: [^OpenPGPCompressedDataPacket].
	anInteger = 9 ifTrue: [^OpenPGPSymmetricallyEncryptedDataPacket].
	anInteger = 10 ifTrue: [^OpenPGPMarkerPacket].
	anInteger = 11 ifTrue: [^OpenPGPLiteralDataPacket].
	anInteger = 12 ifTrue: [^OpenPGPTrustPacket].
	anInteger = 13 ifTrue: [^OpenPGPUserIDPacket].
	anInteger = 14 ifTrue: [^OpenPGPPublicSubkeyPacket].
	anInteger = 17 ifTrue: [^OpenPGPPhotoIDPacket].
	^self
]

{ #category : #'instance creation' }
OpenPGPPacket class >> readFrom: aStream [
	| oldFormat lengthType header tag data dataSize |
	header := aStream next.
	header < 128 ifTrue: [self errorInvalidHeader].
	oldFormat := (header bitAnd: 64) = 0.
	oldFormat
		ifTrue: [
			tag := (header bitShift: -2) bitAnd: 15.
			lengthType := header bitAnd: 3.
			lengthType = 3
				ifTrue: [
					data := aStream upToEnd]
				ifFalse: [
					dataSize := aStream nextNumber: (1 bitShift: lengthType).
					data := aStream next: dataSize]]
		ifFalse: [
			tag := header bitAnd: 63.
			[dataSize := aStream nextNewFormatPacketLength.
			data := data isNil
					ifTrue: [aStream next: dataSize abs]
					ifFalse: [data, (aStream next: dataSize abs)].
			dataSize < 0] whileTrue: [].
			dataSize := data size].
	^(self packetClassForTag: tag) new header: header data: data
]

{ #category : #accessing }
OpenPGPPacket class >> symmetricKeyAlgorithmFor: anInteger [
	anInteger = 2 ifTrue: [^TripleDESForOpenPGP new].
	anInteger = 3 ifTrue: [^CAST5 new].
	self error: 'symmetric key algorithm ', anInteger printString, ' not yet available'
]

{ #category : #visitor }
OpenPGPPacket >> acceptVisitor: aVisitor [
	^aVisitor handlePacket: self
]

{ #category : #accessing }
OpenPGPPacket >> add: aPacket [
	ownedPackets isNil ifFalse: [
		(self ownedPackets last add: aPacket)
			ifTrue: [^true]].
	(aPacket canBeAddedTo: self) ifFalse: [^false].
	ownedPackets := ownedPackets isNil
		ifTrue: [Array with: aPacket]
		ifFalse: [ownedPackets copyWith: aPacket].
	aPacket owner: self.
	^true
]

{ #category : #testing }
OpenPGPPacket >> canBeAddedTo: aPacket [
	^false
]

{ #category : #accessing }
OpenPGPPacket >> computeInterpretedData [
	| class |
	self tag = 13 ifTrue: [
		^data asString].
	self tag = 2 ifTrue: [
		data first = 3 ifTrue: [
			class := OpenPGPSignatureV3Data].
		data first = 4 ifTrue: [
			class := OpenPGPSignatureV4Data]].
	self tag = 3 ifTrue: [
		class := OpenPGPSymmetricKeyEncryptedSessionKeyPacket].
	class == nil ifTrue: [self error: 'No reader class for this packet type/version yet'].
	^class new readFrom: (OpenPGPStream on: data)
]

{ #category : #accessing }
OpenPGPPacket >> data [
	^data
]

{ #category : #printing }
OpenPGPPacket >> dataAsString [
	"^(data withEncoding: #UTF8) readStream upToEnd"
	"^(MultiByteBinaryOrTextStream on: data encoding: 'utf-8') halt upToEnd"
	^data asString
]

{ #category : #accessing }
OpenPGPPacket >> dataSize [
	^data size
]

{ #category : #accessing }
OpenPGPPacket >> detectPacket: detectBlock return: valueBlock [
	^self
		detectPacket: detectBlock
		return: valueBlock
		ifNone: []
]

{ #category : #accessing }
OpenPGPPacket >> detectPacket: detectBlock return: valueBlock ifNone: noneBlock [
	ownedPackets isNil ifFalse: [
		self ownedPackets do: [:each |
			(detectBlock value: each) ifTrue: [^valueBlock value: each].
			each detectPacket: detectBlock return: valueBlock ifNone: []]].
	^noneBlock value
]

{ #category : #accessing }
OpenPGPPacket >> header [
	^header
]

{ #category : #'initialize-release' }
OpenPGPPacket >> header: headerInteger data: dataBytes [
	header := headerInteger.
	data := dataBytes.
	"self parseData: (OpenPGPStream on: data)"
]

{ #category : #testing }
OpenPGPPacket >> isKeyPacket [
	^false
]

{ #category : #testing }
OpenPGPPacket >> isOldFormat [
	^(header bitAnd: 64) = 0
]

{ #category : #testing }
OpenPGPPacket >> isPhotoIDPacket [
	^false
]

{ #category : #testing }
OpenPGPPacket >> isPrivateKeyPacket [
	^false
]

{ #category : #testing }
OpenPGPPacket >> isPublicKeyPacket [
	^false
]

{ #category : #testing }
OpenPGPPacket >> isSignaturePacket [
	^false
]

{ #category : #testing }
OpenPGPPacket >> isSubkeyPacket [
	^false
]

{ #category : #testing }
OpenPGPPacket >> isSymmetricKeyEncryptedSessionKeyPacket [
	^false
]

{ #category : #testing }
OpenPGPPacket >> isTrustPacket [
	^false
]

{ #category : #testing }
OpenPGPPacket >> isUserIDPacket [
	^false
]

{ #category : #accessing }
OpenPGPPacket >> oldFormat [
	^(header bitAnd: 64) = 0
]

{ #category : #accessing }
OpenPGPPacket >> ownedPackets [
	^ownedPackets ifNil: [#()]
]

{ #category : #accessing }
OpenPGPPacket >> owner [
	^owner
]

{ #category : #accessing }
OpenPGPPacket >> owner: aPacketOrKeyring [
	owner := aPacketOrKeyring
]

{ #category : #'initialize-release' }
OpenPGPPacket >> parseData [
	self parseData: (OpenPGPStream on: data)
]

{ #category : #'initialize-release' }
OpenPGPPacket >> parseData: aStream [
	"do nothing"
]

{ #category : #printing }
OpenPGPPacket >> printDataOn: aStream [
	aStream nextPutAll: ', data='.
	aStream print: self data
]

{ #category : #printing }
OpenPGPPacket >> printOn: aStream [
	aStream nextPutAll: 'OpenPGP '.
	aStream nextPutAll: (TagTypes at: self tag+1); nextPutAll: ', tag='.
	aStream print: self tag.
	"aStream nextPutAll: ', format='.
	aStream nextPutAll: (self isOldFormat ifTrue: ['old'] ifFalse: ['new'])."
	self version isNil ifFalse: [
		aStream nextPutAll: ', version='.
		self version printOn: aStream.
	].
	aStream nextPutAll: ', size='.
	aStream print: self dataSize.
	self isKeyPacket ifTrue: [
		aStream nextPutAll: ', created='.
		self printCreationDateAndTimeOn: aStream].
	self printDataOn: aStream.
	aStream cr
]

{ #category : #printing }
OpenPGPPacket >> saveOn: aStream [
	| oldFormat lengthType dataSize |
	aStream nextPut: header.
	oldFormat := (header bitAnd: 64) = 0.
	oldFormat
		ifTrue: [
			lengthType := header bitAnd: 3.
			lengthType = 3
				ifTrue: [
					aStream nextPutAll: data]
				ifFalse: [
					aStream nextNumber: (1 bitShift: lengthType) put: data size.
					aStream nextPutAll: data]]
		ifFalse: [
			[self halt.
			dataSize := aStream nextNewFormatPacketLength.
			data := data isNil
					ifTrue: [aStream next: dataSize abs]
					ifFalse: [data, (aStream next: dataSize abs)].
			dataSize < 0] whileTrue: [].
			dataSize := data size].
]

{ #category : #accessing }
OpenPGPPacket >> tag [
	^self isOldFormat
		ifTrue: [(header bitShift: -2) bitAnd: 15]
		ifFalse: [header bitAnd: 63]
]

{ #category : #accessing }
OpenPGPPacket >> trust [
	^trust
]

{ #category : #accessing }
OpenPGPPacket >> trust: anInteger [
	trust := anInteger
]

{ #category : #accessing }
OpenPGPPacket >> version [
	"subclasses can reimplement this"
	^nil
]
