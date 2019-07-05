Class {
	#name : #BufferListLayer,
	#superclass : #ProtocolLayer,
	#instVars : [
		'bufferList',
		'serverProcess'
	],
	#category : 'LayeredProtocol-Extras'
}

{ #category : #accessing }
BufferListLayer >> bufferList [

	^ bufferList
]

{ #category : #control }
BufferListLayer >> close [
	"Spawn a background process running the serverLoop."

	super close.

]

{ #category : #stack }
BufferListLayer >> downcallAll: chunk [

	bufferList addLast: chunk
]

{ #category : #stack }
BufferListLayer >> install [

	bufferList := OrderedCollection new: 10.
]

{ #category : #'as yet unclassified' }
BufferListLayer >> note: aSymbol with: anObject [

	super note: aSymbol with: anObject.
	aSymbol == #endpointClosed ifTrue: [^self terminateServer].
	aSymbol == #windowClosed ifTrue: [^self close].
]

{ #category : #stack }
BufferListLayer >> processBuffer [

	| pallet |
	[self session isNil 
		ifTrue: [^ nil].
	(self bufferList notEmpty and: [down notNil])
		ifTrue: [
			pallet := self bufferList.
			bufferList := OrderedCollection new: 10.
			self basicDowncallAll: pallet]
		ifFalse: [(Delay forMilliseconds: 100) wait]]
			repeat.

]

{ #category : #stack }
BufferListLayer >> run [
	"Spawn a background process running the serverLoop."

	super run.
	"serverProcess := [self serverLoop] forkAt: Processor userSchedulingPriority."
]

{ #category : #control }
BufferListLayer >> serverLoop [

	[self processBuffer] 
			ensure: [
				serverProcess := nil. 
				self sessionNote: #endpointClosed.
				self close].

]

{ #category : #control }
BufferListLayer >> terminateServer [
	"Terminate the serverLoop process.  This should never be called directly: use #close instead."

	serverProcess isNil
		ifFalse:
			[serverProcess terminate.
			 serverProcess := nil.
			 self sessionNote: #disconnected]
]
