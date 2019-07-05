Class {
	#name : #SHA256WithPrimitive,
	#superclass : #SHA256,
	#instVars : [
		'state'
	],
	#category : #'Cryptography-SHA256'
}

{ #category : #accessing }
SHA256WithPrimitive class >> blockSize [
	^ 64
]

{ #category : #accessing }
SHA256WithPrimitive class >> hashSize [
	^ 32
]

{ #category : #'as yet unclassified' }
SHA256WithPrimitive class >> isPluginAvailable [

	<primitive: 'primitivePluginAvailable' module: 'SHA256Plugin'>
	^false
]

{ #category : #private }
SHA256WithPrimitive >> finalHash [

	| hash |
	hash := ByteArray new: state size.
	self primFinalHash: hash fromState: state.
	^hash
]

{ #category : #private }
SHA256WithPrimitive >> initialize [

	state := ByteArray new: 32.
	self primInitializeState: state
]

{ #category : #private }
SHA256WithPrimitive >> primFinalHash: aByteArray fromState: s [

	<primitive: 'primitiveFinalHashFromState' module: 'SHA256Plugin'>
	self primitiveFailed
]

{ #category : #private }
SHA256WithPrimitive >> primInitializeState: s [

	<primitive: 'primitiveInitializeState' module: 'SHA256Plugin'>
	self primitiveFailed
]

{ #category : #private }
SHA256WithPrimitive >> primProcessBuffer: aByteArray withState: s [

	<primitive: 'primitiveProcessBufferWithState' module: 'SHA256Plugin'>
	self primitiveFailed
]

{ #category : #private }
SHA256WithPrimitive >> processBuffer: aByteArray [

	self primProcessBuffer: aByteArray withState: state.
	
]

{ #category : #private }
SHA256WithPrimitive >> storeLength: bitLength in: aByteArray [
	"Fill in the final 8 bytes of the given ByteArray with a 64-bit big-endian representation of the original message length in bits."

	| n i |
	n := bitLength.
	i := aByteArray size.
	[n > 0] whileTrue: [
		aByteArray at: i put: (n bitAnd: 16rFF).
		n := n bitShift: -8.
		i := i - 1].

]
