"
This class implements the Data Encryption Standard (DES) block cipher per
ANSI X3.92.  It requires the presence of the 'DESPlugin'.  At some future
date the functionality of the plugin may be provided in pure Smalltalk, but
the slowness would be prohibitive for anything other than trivial usage.
The main barrier to translation is the heavy use of zero-based indexing of
arrays.

How to use: you first provide an 8-byte key which will be used to encode
and decode the data. Internally, this is 'cooked' into a 32-word format to
speed up the encryption process.  The data is then sent in 8-byte packets
to be encoded or decoded.  You must externally account for padding.  See
the 'testing' category on the class side for examples.

As of this date (1/26/2000), the U.S. Government has lifted many of the
previous restrictions on the export of encryption software, but you should
check before exporting anything including this code.

Submitted by Duane Maxwell.


"
Class {
	#name : #DES,
	#superclass : #BlockCipher,
	#instVars : [
		'cookedKey',
		'key',
		'encrypting',
		'nonPrimitive'
	],
	#category : 'Cryptography-DES'
}

{ #category : #accessing }
DES class >> blockSize [
	^ 8
]

{ #category : #accessing }
DES class >> keySize [
	^ 8
]

{ #category : #accessing }
DES >> decryptBlock: aByteArray [
	| int |
	self primPluginAvailable
		ifTrue: [
			encrypting = false ifFalse: [self key: key encrypt: false].
			^self transform: aByteArray].
	nonPrimitive isNil ifTrue: [
		nonPrimitive := DESNonPrimitive new setKeyFromByteArray: key]. 
	int := ((aByteArray unsignedLongAt: 1 bigEndian: true) bitShift: 32)
			+ (aByteArray unsignedLongAt: 5 bigEndian: true).
	int := nonPrimitive decryptBlock: int.
	aByteArray unsignedLongAt: 1 put: (int bitShift: -32) bigEndian: true.
	aByteArray unsignedLongAt: 5 put: (int bitAnd: 16rFFFFFFFF) bigEndian: true
]

{ #category : #accessing }
DES >> encryptBlock: aByteArray [
	| int |
	self primPluginAvailable
		ifTrue: [
			encrypting = true ifFalse: [self key: key encrypt: true].
			^self transform: aByteArray].
	nonPrimitive isNil ifTrue: [
		nonPrimitive := DESNonPrimitive new setKeyFromByteArray: key]. 
	int := ((aByteArray unsignedLongAt: 1 bigEndian: true) bitShift: 32)
			+ (aByteArray unsignedLongAt: 5 bigEndian: true).
	int := nonPrimitive encryptBlock: int.
	aByteArray unsignedLongAt: 1 put: (int bitShift: -32) bigEndian: true.
	aByteArray unsignedLongAt: 5 put: (int bitAnd: 16rFFFFFFFF) bigEndian: true
]

{ #category : #accessing }
DES >> key: aByteArray [
	key := aByteArray.
	encrypting := nil.
	nonPrimitive := nil
]

{ #category : #private }
DES >> key: aByteArray encrypt: aBoolean [
	encrypting := aBoolean.
	self primPluginAvailable ifFalse: [^self].
	aByteArray size = 8 ifFalse: [self error: 'DES key must be 8 bytes'].
	cookedKey := WordArray new: 32.
	cookedKey atAllPut: 0.
	self primCookKey: aByteArray mode: (aBoolean ifTrue: [1] ifFalse:
[0]) to: cookedKey
]

{ #category : #primitives }
DES >> primCookKey: aByteArray mode: flag to: cooked [
	<primitive: 'primitiveDESCookKey' module: 'DESPlugin'>
	^ self primitiveFailed

	
]

{ #category : #primitives }
DES >> primPluginAvailable [
	<primitive: 'primitiveDESPluginAvailable' module: 'DESPlugin'>
	^ false
]

{ #category : #primitives }
DES >> primTransform: aByteArray using: cooked [
	<primitive: 'primitiveDESTransform' module: 'DESPlugin'>
	^ self primitiveFailed
]

{ #category : #private }
DES >> transform: block [

	self primPluginAvailable ifFalse: [self error: 'DES plugin missing'].
	cookedKey ifNil: [ self error: 'DES key not provided'].
	cookedKey size = 32 ifFalse: [ self error: 'DES cooked key damaged'].
	block size = 8 ifFalse: [ self error: 'DES block must be 8
bytes'].
	self primTransform: block using: cookedKey.

	
]
