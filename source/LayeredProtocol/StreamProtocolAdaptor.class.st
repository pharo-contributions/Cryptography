Class {
	#name : #StreamProtocolAdaptor,
	#superclass : #ProtocolLayer,
	#instVars : [
		'upBlock',
		'downBlock',
		'flushBlock',
		'noteBlock',
		'cannedString'
	],
	#category : 'LayeredProtocol-Extras'
}

{ #category : #'instance creation' }
StreamProtocolAdaptor class >> example [
	"Send 42 down a stack and then reflect it back up."
	"StreamProtocolAdaptor example"

	(StreamProtocolAdaptor new reflect asProtocolStack
		push: StreamProtocolAdaptor new trace;
		push: StreamProtocolAdaptor new trace;
		push: (StreamProtocolAdaptor new trace
				upBlock: [:stream | Transcript cr; show: 'ping ' , stream upToEnd printString]);
		install;
		run;
		first) downcall: 42
]

{ #category : #'instance creation' }
StreamProtocolAdaptor class >> new [

	^super new initialize
]

{ #category : #'instance creation' }
StreamProtocolAdaptor class >> upBlock: aBlock [

	^self new upBlock: aBlock
]

{ #category : #accessing }
StreamProtocolAdaptor >> cannedString [
	"Answer the value of cannedString"

	^ cannedString
]

{ #category : #accessing }
StreamProtocolAdaptor >> cannedString: anObject [
	"Set the value of cannedString"

	cannedString := anObject
]

{ #category : #control }
StreamProtocolAdaptor >> close [
]

{ #category : #accessing }
StreamProtocolAdaptor >> downBlock: anObject [
	"Set the receiver's instance variable downBlock to anObject."

	downBlock := anObject
]

{ #category : #protocol }
StreamProtocolAdaptor >> downcall: arg [

	self downcallAll: (ByteArray with: arg)
]

{ #category : #protocol }
StreamProtocolAdaptor >> downcallAll: bytes [

	downBlock value: bytes.

]

{ #category : #protocol }
StreamProtocolAdaptor >> flush [

	flushBlock value
]

{ #category : #accessing }
StreamProtocolAdaptor >> flushBlock: anObject [
	"Set the receiver's instance variable flushBlock to anObject."

	flushBlock := anObject
]

{ #category : #initialization }
StreamProtocolAdaptor >> initialize [

	self pass.
	flushBlock := [].
	noteBlock := [:s :a | ]
]

{ #category : #control }
StreamProtocolAdaptor >> kill [
]

{ #category : #protocol }
StreamProtocolAdaptor >> note: aSymbol with: anObject [

	noteBlock value: aSymbol value: anObject
]

{ #category : #accessing }
StreamProtocolAdaptor >> noteBlock: anObject [
	"Set the receiver's instance variable noteBlock to anObject."

	noteBlock := anObject
]

{ #category : #'canned protocols' }
StreamProtocolAdaptor >> pass [

	self cannedString: 'pass'.
	^self
		upBlock: [:chunk | up upcallAll: chunk];
		downBlock: [:chunk | down downcallAll: chunk]
]

{ #category : #'canned protocols' }
StreamProtocolAdaptor >> reflect [

	self cannedString: 'reflect'.
	^self
		upBlock: [:chunk | down downcallAll: chunk];
		downBlock: [:chunk | up upcallAll: chunk; flush]

]

{ #category : #'canned protocols' }
StreamProtocolAdaptor >> reflectDown [

	self cannedString: 'reflectDown'.
	^self
		upBlock: [:chunk | down downcallAll: chunk];
		downBlock: [:chunk | down downcallAll: chunk]

]

{ #category : #'canned protocols' }
StreamProtocolAdaptor >> trace [

	self cannedString: 'trace'.
	^self
		upBlock: [:chunk |
			Transcript cr; nextPutAll: 'up ' , chunk asString; endEntry.
			self triggerEvent: #upcallAll.
			up ifNotNil: [:localUp | localUp upcallAll: chunk]];
		downBlock: [:chunk |
			Transcript cr; nextPutAll: 'down ' , chunk asString; endEntry.
			self triggerEvent: #downcallAll.
			down ifNotNil: [:localDown | localDown downcallAll: chunk]]
]

{ #category : #accessing }
StreamProtocolAdaptor >> upBlock: anObject [
	"Set the receiver's instance variable upBlock to anObject."

	upBlock := anObject
]

{ #category : #protocol }
StreamProtocolAdaptor >> upcall: arg [

	self upcallAll: (ByteArray with: arg).

]

{ #category : #protocol }
StreamProtocolAdaptor >> upcallAll: bytes [

	upBlock value: bytes.

]
