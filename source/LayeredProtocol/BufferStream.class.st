"
Kom48 (Comanche beta 4.8)
bolot 4/2/2001 18:43

BufferStream

Comment in Com46:
- is-a ReadWriteStream on a String
- like a queue
  removeNext:/nextPutAll: protocol
"
Class {
	#name : #BufferStream,
	#superclass : #Stream,
	#instVars : [
		'buffer',
		'startPos',
		'endPos'
	],
	#category : 'LayeredProtocol-Endpoints'
}

{ #category : #'instance creation' }
BufferStream class >> on: aString [
	^self basicNew on: aString
]

{ #category : #accessing }
BufferStream >> contents [
	"return contents, non-destructive"
	^buffer copyFrom: startPos to: endPos
]

{ #category : #testing }
BufferStream >> includes: aChar [
	"answer whether buffer includes aChar within bounds"
	| tmp |
	tmp := buffer 
		indexOf: aChar 
		startingAt: startPos
		ifAbsent: [0].
	^(tmp >= startPos) and: [tmp <= endPos]
]

{ #category : #testing }
BufferStream >> includesAll: aString [
	"answer whether the buffer contains aString"
	| tmp |
	tmp := buffer indexOfSubCollection: aString startingAt: startPos.
	^(tmp >= startPos) and: [tmp <= endPos]
]

{ #category : #testing }
BufferStream >> isEmpty [
	^self size <= 0
]

{ #category : #accessing }
BufferStream >> match: aString [
	self size < aString size
		ifTrue: [^false].
	(self next: aString size) = aString
		ifTrue: [^true]
		ifFalse: [self on: aString, self upToEnd].
	^false
]

{ #category : #accessing }
BufferStream >> next [
	"return the next character"
	"consume it"
	^buffer at: (startPos := startPos + 1) - 1
]

{ #category : #accessing }
BufferStream >> next: anInteger [
	"return next anInteger characters"
	"consumes them"
	^buffer copyFrom: startPos to: (startPos := startPos + anInteger) - 1
]

{ #category : #accessing }
BufferStream >> nextPutAll: aString [
	buffer := (buffer copyFrom: startPos to: endPos), aString.
	startPos := 1.
	endPos := buffer size
]

{ #category : #'initialize-release' }
BufferStream >> on: aString [
	buffer := aString.
	startPos := 1.
	endPos := buffer size
]

{ #category : #printing }
BufferStream >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: '(', self size asString, ')'
]

{ #category : #'initialize-release' }
BufferStream >> reset [
	"hack"
	self on: 
		(buffer 
			ifNil: ['']
			ifNotNil: [buffer class new: 0])
]

{ #category : #accessing }
BufferStream >> size [
	^endPos - startPos + 1
]

{ #category : #accessing }
BufferStream >> upTo: aChar [
	"return String up to aChar, but not including"
	"consumes the returned string"
	| i |
	i := buffer 
		indexOf: aChar 
		startingAt: startPos
		ifAbsent: [0].
	(i <= 0 or: [i > endPos])
		ifTrue: [^self upToEnd].
	^self next: (i-startPos)
]

{ #category : #accessing }
BufferStream >> upToAll: aString [
	"return a string before the occurence of aString, if any"
	"consume it"
	| i |
	i := buffer 
		indexOfSubCollection: aString 
		startingAt: startPos
		ifAbsent: [0].
	(i <= 0 or: [i > endPos])
		ifTrue: [^self upToEnd].
	^self next: (i-startPos)
]

{ #category : #accessing }
BufferStream >> upToEnd [
	"return buffer contents,
	consume all my buffer"
	| string |
	string := self contents.
	self reset.
	^string
]
