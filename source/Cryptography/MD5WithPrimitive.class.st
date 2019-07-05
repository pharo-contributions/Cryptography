Class {
	#name : #MD5WithPrimitive,
	#superclass : #MD5,
	#category : 'Cryptography-MD5'
}

{ #category : #'private-buffers' }
MD5WithPrimitive >> finalHash [

	self primDecodeState: state.
	^state
]

{ #category : #initialization }
MD5WithPrimitive >> initializeState [

	state := ByteArray new: 16.
	self primInitializeState: state

]

{ #category : #initialization }
MD5WithPrimitive >> primDecodeState: s [

	<primitive: 'primitiveDecodeState' module: 'MD5Plugin'>
	self primitiveFailed
]

{ #category : #initialization }
MD5WithPrimitive >> primInitializeState: s [

	<primitive: 'primitiveInitializeState' module: 'MD5Plugin'>
	self primitiveFailed
]

{ #category : #'private-buffers' }
MD5WithPrimitive >> primProcessBuffer: aByteArray withState: s [

	<primitive: 'primitiveProcessBufferWithState' module: 'MD5Plugin'>
	self primitiveFailed
]

{ #category : #'private-buffers' }
MD5WithPrimitive >> processBuffer: aByteArray [

	self primProcessBuffer: aByteArray withState: state.
	
]
