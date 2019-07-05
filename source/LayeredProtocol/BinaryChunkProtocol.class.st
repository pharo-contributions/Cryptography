Class {
	#name : #BinaryChunkProtocol,
	#superclass : #ProtocolLayer,
	#instVars : [
		'headerSize',
		'header',
		'buffer'
	],
	#category : 'LayeredProtocol-Extras'
}

{ #category : #'instance creation' }
BinaryChunkProtocol class >> new [

	^ self newHeaderSize: 2

]

{ #category : #'instance creation' }
BinaryChunkProtocol class >> newHeaderSize: headerSize [

	^self basicNew
		headerSize: headerSize;
		yourself.

]

{ #category : #accessing }
BinaryChunkProtocol >> buffer [
	"Answer the receiver's instance variable buffer."

	^buffer
]

{ #category : #stack }
BinaryChunkProtocol >> downcall: arg [

	self downcallAll: (ByteArray with: arg)
]

{ #category : #stack }
BinaryChunkProtocol >> downcallAll: chunk [

	| downHeader |
	downHeader := self headerForChunk: chunk.
	down downcallAll: downHeader.
	down downcallAll: chunk.

]

{ #category : #stack }
BinaryChunkProtocol >> hasNextHeader [

	self header isNil ifFalse: [^ true].
	self buffer size >= self headerSize
		ifTrue: [
			self header: (self buffer next: self headerSize) asInteger.
			^true].
	^false

]

{ #category : #accessing }
BinaryChunkProtocol >> header [
	"Answer the receiver's instance variable header."

	^header
]

{ #category : #accessing }
BinaryChunkProtocol >> header: anObject [
	"Set the receiver's instance variable header to anObject."

	header := anObject
]

{ #category : #stack }
BinaryChunkProtocol >> headerForChunk: chunk [

	| size byteStream |
	byteStream := (ByteArray new: self headerSize) writeStream.
	size := chunk size.
	1 to: self headerSize do: [:i | byteStream nextPut: (size digitAt: self headerSize+1-i)].
	^ byteStream contents

]

{ #category : #accessing }
BinaryChunkProtocol >> headerSize [
	"Answer the receiver's instance variable headerSize."

	^headerSize
]

{ #category : #accessing }
BinaryChunkProtocol >> headerSize: anObject [
	"Set the receiver's instance variable headerSize to anObject."

	headerSize := anObject
]

{ #category : #initialize }
BinaryChunkProtocol >> install [

	buffer := BufferStream on: (ByteArray new: 0).
]

{ #category : #stack }
BinaryChunkProtocol >> processChunk [
	"We may be able to use a virtual stream on the buffer segment for speed"

	self header isNil ifTrue: [^ false].
	up isNil ifTrue: [^ false].
	self buffer size >= self header
		ifTrue: [
			| chunk |
			chunk := self buffer next: self header.
			up upcallAll: chunk.
			self header: nil.
			^true].
	^false

]

{ #category : #stack }
BinaryChunkProtocol >> upcall: arg [

	self upcallAll: (ByteArray with: arg).

]

{ #category : #stack }
BinaryChunkProtocol >> upcallAll: bytes [

	self buffer nextPutAll: bytes.
	[self hasNextHeader and: [self processChunk]] whileTrue.

]
