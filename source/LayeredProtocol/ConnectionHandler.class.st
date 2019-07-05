"
Kom48 (Comanche beta 4.8)
bolot 4/2/2001 18:44

ConnectionHandler

Comment from kom46:
- also see ConnectionQueue
- does not keep the queue of open sockets
- launches the applications/modules immediately
  upon accepting a connection
"
Class {
	#name : #ConnectionHandler,
	#superclass : #Object,
	#instVars : [
		'portNumber',
		'socketClass',
		'process',
		'priority',
		'handlerBlock',
		'lastError',
		'socketsToDestroy'
	],
	#classVars : [
		'Registry'
	],
	#category : 'LayeredProtocol-Endpoints'
}

{ #category : #'instance creation' }
ConnectionHandler class >> onPort: aNumber handler: aBlock priority: pNum [
	^self new
		initializeOnPort: aNumber
		handler: aBlock
		priority: pNum
]

{ #category : #registry }
ConnectionHandler class >> register: anObject [

	self registry add: anObject
]

{ #category : #registry }
ConnectionHandler class >> registry [

	Registry == nil ifTrue: [
		Registry := WeakRegistry new
	].
	^Registry
]

{ #category : #registry }
ConnectionHandler class >> unregister: anObject [

	self registry remove: anObject ifAbsent: [ ]
]

{ #category : #'initialize-release' }
ConnectionHandler >> destroySockets [
	socketsToDestroy ~~ nil ifTrue: [ 
		socketsToDestroy do: [ :ea | ea destroy ].
	].
	socketsToDestroy := OrderedCollection new
]

{ #category : #'initialize-release' }
ConnectionHandler >> finalize [

	"Like #stop, but without the #unregister"

	process ~~ nil ifTrue: [
		process terminate.
	].
	process := nil.
	self destroySockets.



]

{ #category : #'initialize-release' }
ConnectionHandler >> initializeOnPort: aNumber handler: aBlock priority: pNumber [
	portNumber := aNumber.
	handlerBlock := aBlock.
	priority := pNumber.
	socketsToDestroy := OrderedCollection new
]

{ #category : #'initialize-release' }
ConnectionHandler >> initializeProcessAtPriority: pNumber [
	process := [ self pvtListenLoop ] newProcess. 
	process priority: pNumber
]

{ #category : #queries }
ConnectionHandler >> isRunning [

	^process ~~ nil
]

{ #category : #private }
ConnectionHandler >> newListener [
	| listener |

	self flag: #todo. "listener _ self socketClass newTCP."
	listener := Socket newTCP.
	listener setOption: 'SO_REUSEADDR' value: true.
	"listener setOption: 'SO_LINGER' value: false."
	"backlog is how many simultaneous connections to accept at the same time"
	listener listenOn: portNumber backlogSize: 10.
	^listener

]

{ #category : #accessing }
ConnectionHandler >> portNumber [
	^portNumber
]

{ #category : #printing }
ConnectionHandler >> printOn: aStream [
	aStream nextPutAll: (self class name asString, ' port: ', self portNumber asString).
	self isRunning ifTrue: [
		aStream nextPutAll: ' [running]'
	] ifFalse:[
		aStream nextPutAll: ' [stopped]'
	]
]

{ #category : #accessing }
ConnectionHandler >> priority [
	^priority
]

{ #category : #accessing }
ConnectionHandler >> process [
	process == nil ifTrue: [
		self initializeProcessAtPriority: self priority.
	].
	^process
]

{ #category : #private }
ConnectionHandler >> pvtListenLoop [
	[
		self pvtNewListenLoop
	] on: Error do: [ :ex |
		process := nil.
		self destroySockets.
		ex pass.
	]
]

{ #category : #private }
ConnectionHandler >> pvtNewListenLoop [
	| socket listener |
	listener _ self newListener.
	self socketsToDestroy add: listener.	

	"If the listener is not valid then the we cannot use the
	BSD style accept() mechanism."
	listener isValid ifFalse: [^self pvtOldListenLoop].
	[ [ true ] whileTrue: [
		socket := listener waitForAcceptFor: 10 ifTimedOut: [nil].
		(socket notNil and: [ socket isConnected ])
			ifTrue: [
				handlerBlock value: socket.
				socket := nil]
			ifFalse: [
				socket notNil ifTrue: [socket destroy].
				listener isValid
					ifFalse: [(Delay forMilliseconds: 100) wait.
						listener destroy.
						listener := self newListener].
			].
	]	] on: Error do: [ :ex |
			self halt.
			ex pass.
	]
]

{ #category : #private }
ConnectionHandler >> pvtOldListenLoop [
	"see comment on ConnectionQueue>>oldStyleListenLoop"
	| socket |
	socket := nil.

	[ true ] whileTrue: [
		(socket == nil) ifTrue: [
			"try to create a new socket for listening"
			socket := Socket createIfFail: [ nil ]].

		(socket == nil)
		ifTrue: [(Delay forMilliseconds: 100) wait]
		ifFalse: [
			socket setOption: 'SO_REUSEADDR' value: true.
			socket isUnconnected ifTrue: [ socket listenOn: portNumber ].
			socket waitForConnectionUntil: (Socket deadlineSecs: 10).
			socket isConnected
				ifTrue: ["connection established"
					"mutex critical: [" handlerBlock value: socket "]".
					socket := nil]
				ifFalse: [
					socket isWaitingForConnection
						ifFalse: [
							socket destroy. 
							socket := nil. 
							(NetworkError new 
								messageText: 'port unavailable: ', portNumber asString; 
								signal;
								yourself)]].
		].
	]
]

{ #category : #registry }
ConnectionHandler >> register [

	^self class register: self
]

{ #category : #accessing }
ConnectionHandler >> socketsToDestroy [

	socketsToDestroy == nil ifTrue: [
		socketsToDestroy := OrderedCollection new.
	].
	^socketsToDestroy
]

{ #category : #'starting and stopping' }
ConnectionHandler >> start [
	self stop.
	self process resume.
	self register
]

{ #category : #'starting and stopping' }
ConnectionHandler >> stop [
	self unregister.
	process ~~ nil ifTrue: [
		process terminate.
	].
	process := nil.

	"We do the following in a timely manner instead of relying on
	finalization because we may want to turn right around and start
	listening again.  If an old socket is still around an listening, it may
	interfere with a new one's ability to hear."

	self destroySockets
]

{ #category : #registry }
ConnectionHandler >> unregister [

	^self class unregister: self
]
