Class {
	#name : #OpenPGPStream,
	#superclass : #Stream,
	#instVars : [
		'stream'
	],
	#category : 'OpenPGP-Core'
}

{ #category : #'instance creation' }
OpenPGPStream class >> on: aCollection [
	^self onStream: (ReadStream on: aCollection)
]

{ #category : #'instance creation' }
OpenPGPStream class >> onStream: aStream [
	^self basicNew on: aStream
]

{ #category : #'instance creation' }
OpenPGPStream class >> parsePackets: aStream [
	^[(self onStream: aStream) nextPacketsUpToEnd] ensure: [aStream close]
]

{ #category : #accessing }
OpenPGPStream >> atEnd [
	^stream atEnd
]

{ #category : #accessing }
OpenPGPStream >> binary [
	stream binary
]

{ #category : #accessing }
OpenPGPStream >> close [
	stream close
]

{ #category : #accessing }
OpenPGPStream >> mpisUpToEnd [
	| mpis |
	mpis := #().
	[self atEnd] whileFalse: [mpis := mpis copyWith: self nextMPI].
	^mpis
]

{ #category : #accessing }
OpenPGPStream >> next [
	^stream next
]

{ #category : #accessing }
OpenPGPStream >> next: aNumber [
	^stream next: aNumber
]

{ #category : #accessing }
OpenPGPStream >> nextMPI [
	| bits |
	bits := stream next * 256 + stream next.
	^self nextNumber: bits+7//8
]

{ #category : #accessing }
OpenPGPStream >> nextNewFormatPacketLength [
	| len |
	len := stream next.
	len > 191 ifTrue: [
		len := len < 224
			ifTrue: [len - 192 * 256 + stream next + 192]
			ifFalse: [
				len = 255
					ifTrue: [stream nextNumber: 4]
					ifFalse: [(1 bitShift: (len \\ 32)) negated]]].
	^len
]

{ #category : #accessing }
OpenPGPStream >> nextNumber: anInteger [
	| result |
	anInteger <= 4 ifTrue: [
		result := 0.
		anInteger timesRepeat: [result := result * 256 + stream next].
		^result].
	result := Integer new: anInteger neg: false.
	anInteger to: 1 by: -1 do: [:i |
		result digitAt: i put: stream next].
	^result normalize
]

{ #category : #accessing }
OpenPGPStream >> nextPacket [
	^OpenPGPPacket readFrom: self
]

{ #category : #accessing }
OpenPGPStream >> nextPacketsUpToEnd [
	| result |
	result := OrderedCollection new.
	[self atEnd] whileFalse: [
		result add: self nextPacket].
	^result
]

{ #category : #accessing }
OpenPGPStream >> nextS2KSpecifier [
	^OpenPGPS2KSpecifier new readFrom: self
]

{ #category : #accessing }
OpenPGPStream >> nextSubpacketData [
	| len |
	len := self nextNumber: 2.
	^stream next: len
]

{ #category : #private }
OpenPGPStream >> on: aStream [
	stream := aStream.
	stream binary
]
