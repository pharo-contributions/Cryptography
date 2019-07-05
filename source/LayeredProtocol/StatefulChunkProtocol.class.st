Class {
	#name : #StatefulChunkProtocol,
	#superclass : #StatefulProtocol,
	#category : 'LayeredProtocol-Extras'
}

{ #category : #protocol }
StatefulChunkProtocol >> downcall: aByte [

	down downcall: aByte
]

{ #category : #protocol }
StatefulChunkProtocol >> downcallAll: chunks [

	down downcallAll: chunks.
]

{ #category : #protocol }
StatefulChunkProtocol >> transitionEvent: anEvent with: anObject [

	currentState := (currentState transitionAt: anEvent)
		transitionFrom: currentState for: client with: anObject
]

{ #category : #protocol }
StatefulChunkProtocol >> upcall: aChunkStream [

	self shouldNotImplement
]

{ #category : #protocol }
StatefulChunkProtocol >> upcallAll: chunk [

	| chunkStream |
	chunkStream := chunk readStream.
	self transitionEvent: chunkStream next with: chunkStream.

]
