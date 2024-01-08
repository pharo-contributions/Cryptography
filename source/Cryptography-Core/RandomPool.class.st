"
A random pool of numbers
"
Class {
	#name : #RandomPool,
	#superclass : #Stream,
	#instVars : [
		'key',
		'pool',
		'outputStream',
		'inputIndex'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Cryptography-Core-RandomAndPrime'
}

{ #category : #default }
RandomPool class >> default [

	^ default ifNil: [ default := self new: 4096 ]
]

{ #category : #'intance creation' }
RandomPool class >> new [
	^ self new: 256
]

{ #category : #'intance creation' }
RandomPool class >> new: anInteger [
	^ self basicNew initializePoolSize: anInteger
]

{ #category : #accessing }
RandomPool >> atEnd [
	^ false
]

{ #category : #utilities }
RandomPool >> grabRandomBitsFromSoundInput: bitCount [
	"Grab the given number of random bits of 'noise' from a sound input source. Typically, one would use a microphone or line input as the sound source, although many sound cards have enough thermal noise that you get random low-order sample bits even with no microphone connected. Only the least signficant bit of the samples is used. Since not all sound cards support 16-bits of sample resolution, we use the lowest bit that changes."

	| recorder buf mid samples bitMask randomBits bit |
	"collect some sound data"
	recorder := SoundRecorder new clearRecordedSound.
	recorder resumeRecording.
	(Delay forSeconds: 1) wait.
	recorder stopRecording.
	buf := recorder condensedSamples.

	"grab bitCount samples from the middle"
	mid := buf monoSampleCount // 2.
	samples := buf copyFrom: mid to: mid + bitCount - 1.

	"find the least significant bit that varies"
	bitMask := 1.
	[bitMask < 16r10000 and:
	 [(samples collect: [:s | s bitAnd: bitMask]) asSet size < 2]]
		whileTrue: [bitMask := bitMask bitShift: 1].
	bitMask = 16r10000 ifTrue: [^ self error: 'sound samples do not vary'].

	"pack the random bits into a positive integer"
	randomBits := 0.
	1 to: samples size do: [:i |
		bit := ((samples at: i) bitAnd: bitMask) = 0 ifTrue: [0] ifFalse: [1].
		randomBits := (randomBits bitShift: 1) + bit].

	self nextPutAll: randomBits
]

{ #category : #initialization }
RandomPool >> initializePoolSize: anInteger [
	key := ByteArray new: TripleDES keySize.
	pool := ByteArray new: anInteger // TripleDES blockSize + 1 * TripleDES blockSize.
	outputStream := ByteArray new readStream.
	inputIndex := 1.
	self nextPutAll: Time millisecondClockValue printString asByteArray.
	self stir
]

{ #category : #accessing }
RandomPool >> next [
	outputStream atEnd
		ifTrue: [self stir.
				outputStream := (pool copyFrom: 1 to: pool size // 2) readStream].
	^ outputStream next
]

{ #category : #accessing }
RandomPool >> next: anInteger [
	| answer |
	answer := ByteArray new: anInteger.
	1 to: anInteger do: [ :each | answer at: each put: self next].
	^ answer
]

{ #category : #accessing }
RandomPool >> nextPut: aByte [
	| keyIndex |
	inputIndex = pool size ifTrue: [self stir].
	inputIndex := inputIndex \\ pool size + 1.
	pool at: inputIndex put: ((pool at: inputIndex) bitXor: aByte).
	keyIndex := inputIndex \\ key size + 1.
	key at: keyIndex put: ((key at: keyIndex) bitXor: aByte).
	^ aByte
]

{ #category : #accessing }
RandomPool >> nextPutAll: aCollection [
	aCollection do: [ :each | self nextPut: each].
	^ aCollection
]

{ #category : #accessing }
RandomPool >> stir [
	| cipher block |
	cipher := (TripleDES key: key) cbc.
	cipher initialVector: (pool copyFrom: pool size - TripleDES blockSize + 1 to: pool size).
	1 to: pool size - TripleDES blockSize + 1 by: TripleDES blockSize do: [ :startIndex |
		block := pool copyFrom: startIndex to: startIndex + TripleDES blockSize - 1.
		cipher encryptBlock: block.
		pool replaceFrom: startIndex to: startIndex + TripleDES blockSize - 1 with: block]
]
