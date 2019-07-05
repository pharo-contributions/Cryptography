"
This class holds data describing a public key. Subclasses exist for OpenPGP V3 and V4 formats.

Instance Variables:
creationTime			<Integer> number of seconds since 1.1.1970 GMT (presumably)
publicKeyAlgorithm		<Integer> number of public key algorithm. See RFC2440 for possible values.
algorithmSpecificData	<Array of: Integer> data specifying the key in the chosen public key algorithm
fingerprint				<ByteArray> hash of the key's data, used to verify the authenticity of a key via phone etc. 
"
Class {
	#name : #OpenPGPPublicKeyPacket,
	#superclass : #OpenPGPPacket,
	#instVars : [
		'creationTime',
		'validDays',
		'publicKeyAlgorithm',
		'algorithmSpecificData',
		'fingerprint',
		'userIDString',
		'photo'
	],
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPPublicKeyPacket >> acceptVisitor: aVisitor [
	^aVisitor handlePublicKeyPacket: self
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> algorithmSpecificData [
	algorithmSpecificData isNil ifTrue: [self parseData].
	^algorithmSpecificData
]

{ #category : #private }
OpenPGPPublicKeyPacket >> computeFingerprint [
	| str bits len hash result |
	version <= 3 ifTrue: [
		str := ReadWriteStream on: (ByteArray new: 300).
		self mpis do: [:each |
			bits := each highBit.
			str nextNumber: bits+7//8 put: each].
		str reset.
		hash := MD5 hashStream: str.
		result := 0.
		hash do: [:each | result := (result bitShift: 8) + each].
		^result].
	version = 4 ifTrue: [
		str := ReadWriteStream on: (ByteArray new: 300).
		str
			nextPut: 16r99;
			nextNumber: 2 put: 0;
			nextPut: 4;
			nextNumber: 4 put: creationTime;
			nextPut: publicKeyAlgorithm.
		self mpis do: [:each |
			str nextNumber: 2 put: (bits := each highBit).
			str nextNumber: bits+7//8 put: each].
		len := str position-3.
		str position: 1.
		str nextNumber: 2 put: len.
		str reset.
		^SecureHashAlgorithm new hashStream: str]
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> creationDateAndTime [
	| t |
	t := self creationTime + 2177452800.
	"^Array with: (Date fromSeconds: t) with: (Time fromSeconds: t\\86400)"
	^DateAndTime fromSeconds: t
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> creationDateAndTimeFormatted [
	| str |
	str := WriteStream on: String new.
	self printCreationDateAndTimeOn: str.
	^str contents
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> creationTime [
	creationTime isNil ifTrue: [self parseData].
	^creationTime
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> fingerprint [
	fingerprint = nil ifTrue: [fingerprint := self computeFingerprint].
	^fingerprint
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> fingerprintHex [
	"Return a string with this key's fingerprint.
	Version 3 has 16 8-bit hex values; version 4 has 10 16-bit hex values"
	| str fp dig n |
	str := WriteStream on: String new.
	fp := self fingerprint.
	n := self version = 3 ifTrue: [16] ifFalse: [20].
	n to: 1 by: -1 do: [:i |
		dig := fp digitAt: i.
		str nextPut: (Character digitValue: dig // 16).
		str nextPut: (Character digitValue: dig \\ 16).
		(n = 16 or: [i odd]) ifTrue: [str space.
			i = (n/2+1) ifTrue: [str space]]].
	^str contents
]

{ #category : #testing }
OpenPGPPublicKeyPacket >> isKeyPacket [
	^true
]

{ #category : #testing }
OpenPGPPublicKeyPacket >> isPublicKeyPacket [
	^self isPrivateKeyPacket not
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> keyID [
	^(self version <= 3
		ifTrue: [self mpis first]
		ifFalse: [self fingerprint]) bitAnd: 16rFFFFFFFF
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> keyID8 [
	^(self version <= 3
		ifTrue: [self mpis first]
		ifFalse: [self fingerprint]) bitAnd: 16rFFFFFFFFFFFFFFFF
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> keyID8Hex [
	"Return a string with this key's 8-byte ID as hex values"
	| str id dig |
	str := WriteStream on: String new.
	id := self keyID8.
	8 to: 1 by: -1 do: [:i |
		dig := id digitAt: i.
		str nextPut: (Character digitValue: dig // 16).
		str nextPut: (Character digitValue: dig \\ 16).
		i = 5 ifTrue: [str space]].
	^str contents
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> keyIDHex [
	"Return a string with this key's ID as hex values"
	| str id dig |
	str := WriteStream on: String new.
	id := self keyID.
	4 to: 1 by: -1 do: [:i |
		dig := id digitAt: i.
		str nextPut: (Character digitValue: dig // 16).
		str nextPut: (Character digitValue: dig \\ 16)].
	^str contents
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> mpis [
	^self algorithmSpecificData mpis
]

{ #category : #reading }
OpenPGPPublicKeyPacket >> parseData: aStream [
	version := aStream next.
	creationTime := aStream nextNumber: 4.
	version <= 3 ifTrue: [
		validDays := aStream nextNumber: 2.
		publicKeyAlgorithm := aStream next.
		algorithmSpecificData := (OpenPGPPublicKeyAlgorithmData forPGPAlgorithmID: publicKeyAlgorithm) readFrom: aStream].
	version = 4 ifTrue: [
		publicKeyAlgorithm := aStream next.
		algorithmSpecificData := (OpenPGPPublicKeyAlgorithmData forPGPAlgorithmID: publicKeyAlgorithm) readFrom: aStream]
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> photo [
	photo notNil ifTrue: [^photo].
	^self
		detectPacket: [:p | p isPhotoIDPacket]
		return: [:p | photo := p image]
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> photoID [
	^self ownedPackets detect: [:p | p isPhotoIDPacket] ifNone: []
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> preferred [
	^'?'
]

{ #category : #printing }
OpenPGPPublicKeyPacket >> printCreationDateAndTimeOn: aStream [
	| t |
	t := self creationDateAndTime.
	t asDate printOn: aStream format: #(1 2 3 $. 1 1 2).
	aStream space.
	t asTime print24: true on: aStream
]

{ #category : #printing }
OpenPGPPublicKeyPacket >> printDataOn: aStream [
	aStream nextPutAll: ', id='.
	aStream nextPutAll: self keyIDHex.
	aStream nextPutAll: ', fingerprint= '.
	aStream nextPutAll: self fingerprintHex.
	self userIDs first printDataOn: aStream
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> publicKey [
	^algorithmSpecificData publicKey
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> trust [
	^'?'
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> type [
	^'type'
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> userIDString [
	userIDString isNil ifTrue: [userIDString := self userIDs first dataAsString].
	^userIDString
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> userIDs [
	^self ownedPackets select: [:each | each isUserIDPacket]
]

{ #category : #accessing }
OpenPGPPublicKeyPacket >> version [
	version isNil ifTrue: [self parseData].
	^version
]
