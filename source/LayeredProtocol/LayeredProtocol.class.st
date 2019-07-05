"
I am a complete protocol implemented as a stack of subprotocols.  One end of the stack (the bottom or `tail') is usually an endpoint communicating with some remote host or process.  The other end (the top or `head') is either the point of communication for my client (which reads and writes only application-oriented data) or even the client itself.

I am created by sending my class the message #on: aSubProtocol.  You can then send me #push: aProtocol as many times as you like, to push aProtocol onto the head of my protocol stack.  When the stack is complete you must send me #install which tells me to finish creating the internal connections between each subprotocol in the stack.  Finally you send me #run which tells the entire protocol stack to start.
"
Class {
	#name : #LayeredProtocol,
	#superclass : #OrderedCollection,
	#instVars : [
		'properties'
	],
	#category : 'LayeredProtocol-Abstract'
}

{ #category : #examples }
LayeredProtocol class >> example [
	"Send 42 down a stack and then reflect it back up."
	"LayeredProtocol example"

	(ProtocolAdaptor new reflect asProtocolStack
		push: ProtocolAdaptor new trace;
		push: ProtocolAdaptor new trace;
		push: (ProtocolAdaptor new trace
				upBlock: [:arg | Transcript cr; show: 'ping ' , arg printString]);
		install;
		run;
		first) downcall: 42
]

{ #category : #'instance creation' }
LayeredProtocol class >> new [

	^super new initializeProperties
]

{ #category : #'instance creation' }
LayeredProtocol class >> on: proto [

	^self new push: proto
]

{ #category : #private }
LayeredProtocol >> addDown: proto [

	^self addLast: proto
]

{ #category : #private }
LayeredProtocol >> addUp: proto [

	^self addFirst: proto
]

{ #category : #protocol }
LayeredProtocol >> endpoint [

	^self last
]

{ #category : #accessing }
LayeredProtocol >> head [
	"Answer the head of the stack."

	^self first
]

{ #category : #'initialize-release' }
LayeredProtocol >> initializeProperties [

	properties := IdentityDictionary new
]

{ #category : #protocol }
LayeredProtocol >> install [

	| prev |
	prev := nil.
	self do: [:this |
		this session: self.
		prev isNil ifFalse: [this up: prev.  prev down: this].
		this install.
		prev := this]
]

{ #category : #protocol }
LayeredProtocol >> isConnected [

	^self endpoint isConnected
]

{ #category : #protocol }
LayeredProtocol >> kill [

	[self notEmpty] whileTrue: [
		self head close. self pop].
]

{ #category : #protocol }
LayeredProtocol >> note: aSymbol with: anObject [
	"Inform my members that something has happened."

	self do: [:proto | proto note: aSymbol with: anObject].

]

{ #category : #protocol }
LayeredProtocol >> pop [
	"Remove the head of the stack."
	| aProto |
	self isEmpty ifTrue: [^ nil].
	aProto := self removeFirst.
	self isEmpty
		ifFalse: [aProto down: nil.
			self head up: nil].
	aProto session: nil.
	^ aProto
]

{ #category : #accessing }
LayeredProtocol >> propertyAt: aKey [

	^properties at: aKey ifAbsent: []
]

{ #category : #accessing }
LayeredProtocol >> propertyAt: aKey ifAbsent: aBlock [

	^properties at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
LayeredProtocol >> propertyAt: aKey put: aValue [

	^properties at: aKey put: aValue
]

{ #category : #protocol }
LayeredProtocol >> push: aProto [
	"Push a new protocol onto the head of the stack."

	aProto session: self.
	self isEmpty ifFalse: [aProto down: self head.  self head up: aProto].
	aProto install.
	self addFirst: aProto
]

{ #category : #private }
LayeredProtocol >> removeUp [

	^self removeFirst
]

{ #category : #protocol }
LayeredProtocol >> run [

	self do: [:proto | proto run]
]

{ #category : #protocol }
LayeredProtocol >> stop [
	self
		do: [:proto | proto close].
	self kill
]

{ #category : #accessing }
LayeredProtocol >> tail [
	"Answer the tail of the stack."

	^self last
]
