"
Instances of this class represent keyring entries. Their first packet is always a public or secret key packet, and the following packets are additional data (IDs, subkeys) and signatures for that key.

Instance Variables:
packets	<OrderedCollection of: OpenPGPPacket>	packets comprising this key
"
Class {
	#name : #OpenPGPKeyringEntry,
	#superclass : #Object,
	#instVars : [
		'packets'
	],
	#classVars : [
		'PreferredKeys'
	],
	#category : 'OpenPGP-Core'
}

{ #category : #'instance creation' }
OpenPGPKeyringEntry class >> new [
	^super new initialize
]

{ #category : #'instance creation' }
OpenPGPKeyringEntry class >> preferredKeys [
	PreferredKeys isNil ifTrue: [PreferredKeys := Set new].
	^PreferredKeys
]

{ #category : #accessing }
OpenPGPKeyringEntry >> add: aPacket [
	packets add: aPacket
]

{ #category : #accessing }
OpenPGPKeyringEntry >> detectPacket: detectBlock return: valueBlock [
	^self
		detectPacket: detectBlock
		return: valueBlock
		ifNone: []
]

{ #category : #accessing }
OpenPGPKeyringEntry >> detectPacket: detectBlock return: valueBlock ifNone: noneBlock [
	packets do: [:each |
		(detectBlock value: each) ifTrue: [^valueBlock value: each]].
	^noneBlock value
]

{ #category : #'initialize-release' }
OpenPGPKeyringEntry >> initialize [
	packets := OrderedCollection new
]

{ #category : #accessing }
OpenPGPKeyringEntry >> keyID [
	^packets first keyID
]

{ #category : #accessing }
OpenPGPKeyringEntry >> keyID8Hex [
	^packets first keyID8Hex
]

{ #category : #accessing }
OpenPGPKeyringEntry >> keyIDHex [
	^packets first keyIDHex
]

{ #category : #accessing }
OpenPGPKeyringEntry >> packets [
	^packets
]

{ #category : #accessing }
OpenPGPKeyringEntry >> photoID [
	^self
		detectPacket: [:p | p isPhotoIDPacket]
		return: [:p | p image]
]

{ #category : #accessing }
OpenPGPKeyringEntry >> preferred [
	"This is stored in a class variable for the time being"
	^self class preferredKeys includes: self keyID
]

{ #category : #accessing }
OpenPGPKeyringEntry >> preferred: aBoolean [
	aBoolean
		ifTrue: [self class preferredKeys add: self keyID]
		ifFalse: [self class preferredKeys remove: self keyID ifAbsent: []]
]

{ #category : #printing }
OpenPGPKeyringEntry >> printOn: aStream [
	| key |
	super printOn: aStream.
	packets isEmpty ifTrue: [^self].
	key := packets first keyID printStringRadix: 16.
	key size < 8 ifTrue: [key := (String new: 8-key size withAll: $0), key].
	aStream nextPutAll: ', keyID='.
	aStream nextPutAll: key.
	aStream nextPutAll: ', created='.
	packets first printCreationDateAndTimeOn: aStream.
	packets do: [:each | each isUserIDPacket ifTrue: [aStream space; print: each dataAsString]]
]

{ #category : #accessing }
OpenPGPKeyringEntry >> trust [
	^'?'
]

{ #category : #accessing }
OpenPGPKeyringEntry >> type [
	^packets first version printString
]

{ #category : #accessing }
OpenPGPKeyringEntry >> userID [
	^self
		detectPacket: [:p | p isUserIDPacket]
		return: [:p | p dataAsString]
]
