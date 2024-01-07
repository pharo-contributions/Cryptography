"
Abstract superclass for random generators
"
Class {
	#name : #RandomGenerator,
	#superclass : #Object,
	#classInstVars : [
		'picker'
	],
	#category : #'Cryptography-Core-RandomAndPrime'
}

{ #category : #utilities }
RandomGenerator class >> destroyPickers [
	self withAllSubclassesDo: 
		[ : each | 
		(each instVarNamed: 'picker') ifNotNil: [ : thePicker | thePicker destroy ].
		each 
			instVarNamed: 'picker'
			put: nil ]
]

{ #category : #'instance creation' }
RandomGenerator class >> generateKey [
	| unguessableBytes prior |
	prior := UUID new shuffled asInteger.
	unguessableBytes := ByteArray streamContents: 
		[ : stream | 
		self unpredictableStringsDo: 
			[ : each | 
			| current |
			current := each size < 30 
				ifTrue: 
					[ "Some of the inputs are pretty short, expand them a little, and take opportunity to inject some extra craziness."
					(each asByteArray asInteger
						raisedTo: 64
						modulo: 6773186437430423149	"prime") asByteArray ]
				ifFalse: [ each ].
			"make each value dependent on the prior values, so the adversary is required to get every single string exactly right AND guess every the randomizations correctly."
			current := SHA1 new hashMessage: (current bitXor: prior).
			stream nextPutAll: current asByteArray.
			prior := current ] ].
	^ SHA256 new hashMessage: unguessableBytes
]

{ #category : #'class initialization' }
RandomGenerator class >> initialize [

	Smalltalk
		addToStartUpList: self ;
		addToShutDownList: self.
	self startUp
]

{ #category : #testing }
RandomGenerator class >> isAbstract [ 

	^ self == RandomGenerator
]

{ #category : #create }
RandomGenerator class >> key: anInteger [
	self subclassResponsibility 
]

{ #category : #create }
RandomGenerator class >> picker [
	^ picker ifNil: [ picker := self withGeneratedKey ]
]

{ #category : #'startup - shutdown' }
RandomGenerator class >> shutDown [
	super shutDown.
	self destroyPickers
]

{ #category : #'startup - shutdown' }
RandomGenerator class >> startUp [
	super startUp.
	self destroyPickers
]

{ #category : #utilities }
RandomGenerator class >> unpredictableStringsDo: aBlock [
	"Enumerate sources of information from my environment that should be generally hard to guess."
	| time |
	time := Time millisecondsToRun:
		[ aBlock
			value: World imageForm bits compressToByteArray ;
			value: Sensor mousePoint x asString ;
			value: Sensor mousePoint y asString ;
			value: Time millisecondClockValue asByteArray ;
			value: Date today asString ;
			value: Time now asString ;
			value: Display extent asString.
		100 timesRepeat: [ aBlock value: UUID new ].
		#(imagePath lastUpdateString systemInformationString shortImageName datedVersion lastQuitLogPosition licenseStringTemplate)  collect:
			[ : each |
			aBlock value: (SmalltalkImage current perform: each) asByteArray ] ].
	aBlock 
		value: time asByteArray;
		"maybe the pointer has moved, hit it again."
		value: Sensor mousePoint asString ;
		value: Time millisecondClockValue asByteArray

]

{ #category : #create }
RandomGenerator class >> withGeneratedKey [
	^ self key: self generateKey
]

{ #category : #cleanup }
RandomGenerator >> destroy [
	self subclassResponsibility 
]

{ #category : #accessing }
RandomGenerator >> nextBits: bitLength [
	self subclassResponsibility 
]

{ #category : #accessing }
RandomGenerator >> nextBytes: byteLength [
	self subclassResponsibility 
]

{ #category : #accessing }
RandomGenerator >> nextFrom: start to: end [
	"Answer a random integer between start and end."
	| r |
	r := self nextInt: end-start+1.
	^ r+start-1
]

{ #category : #accessing }
RandomGenerator >> nextInt: anInteger [
	"Answer a random integer in the interval [1, anInteger]."
	| r high |
	anInteger strictlyPositive ifFalse: [ self error: 'Range must be positive' ].
	high := anInteger-1.
	[ (r := self nextBits: anInteger highBit)
		between: 0
		and: high ] whileFalse.
	^ r+1
]
