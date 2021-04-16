"
A secure random number generator
"
Class {
	#name : #SecureRandom,
	#superclass : #RandomGenerator,
	#instVars : [
		'seed',
		'key'
	],
	#category : #'Cryptography-RandomAndPrime'
}

{ #category : #example }
SecureRandom class >> fromUser [
	"Ask the user to type a long random string and use the result to seed the secure random number generator."
	<script: 'self fromUser inspect'>

	| string |
	string := UIManager default request: 'Enter a long random string to seed the random generator.'.
	^ self key: string
]

{ #category : #'class initialization' }
SecureRandom class >> initialize [
	super initialize.
	Smalltalk 
		addToStartUpList: self ;
		addToShutDownList: self.
	self startUp
]

{ #category : #'instance creation' }
SecureRandom class >> key: aByteArray [
	^ self basicNew key: aByteArray
]

{ #category : #'instance creation' }
SecureRandom class >> new [
	^ self key: (RandomPool default next: 64)
]

{ #category : #'initialization-release' }
SecureRandom >> destroy [
	key destroy.
	key := 0.
	seed := 0
]

{ #category : #'initialization-release' }
SecureRandom >> key: aByteArray [
	| srcIndex |
	key := LargePositiveInteger new: (aByteArray size min: 64).
	srcIndex := 0.
	key bytesCount to: 1 by: -1 do: [:i |
		key byteAt: i put: (aByteArray at: (srcIndex := srcIndex + 1)) asInteger].
	key highBit > 512 ifTrue: [key := key bitShift: key highBit - 512].
	key := key normalize.
	seed := 16rEFCDAB8998BADCFE10325476C3D2E1F067452301 "initial seed"
]

{ #category : #accessing }
SecureRandom >> next [
	^ self nextRandom160 bitAnd: 16rFF
]

{ #category : #accessing }
SecureRandom >> next: anInteger into: anArray [
	1 to: anInteger do: [:index | anArray at: index put: self next].
	^ anArray
]

{ #category : #accessing }
SecureRandom >> nextBits: bitLength [
	| answer extraBits |
	answer := 0.
	bitLength // 160
		timesRepeat: [answer := (answer bitShift: 160) bitOr: self nextRandom160].
	extraBits := bitLength \\ 160.
	answer := (answer bitShift: extraBits) bitOr: (self nextRandom160 bitShift: extraBits - 160).
	^ answer
]

{ #category : #accessing }
SecureRandom >> nextBytes: byteLength [
	^ (self nextBits: byteLength*8) asByteArray
]

{ #category : #accessing }
SecureRandom >> nextBytesNonZero: byteLength [

	| answer bytesWritten tempArray tempIndex |
	answer := ByteArray new: byteLength.
	bytesWritten := 0.
	tempIndex := 20.
	[bytesWritten < byteLength]
		whileTrue: [
			tempIndex >= 20 ifTrue: [
				tempArray := self nextRandom160 asByteArrayOfSize: 20.
				tempIndex := 1].
			(tempArray at: tempIndex) ~= 0 ifTrue: [
				answer at: (bytesWritten := bytesWritten + 1) put: (tempArray at: tempIndex)].
			tempIndex := tempIndex + 1].
	^ answer
]

{ #category : #accessing }
SecureRandom >> nextFrom: start to: end [
	"Answer a random integer between start and end."
	| r |
	r := self nextInt: end-start+1.
	^ r+start-1
]

{ #category : #accessing }
SecureRandom >> nextInt: anInteger [
	"Answer a random integer in the interval [1, anInteger]."
	| r high |
	anInteger strictlyPositive ifFalse: [ self error: 'Range must be positive' ].
	high := anInteger-1.
	[ (r := self nextBits: anInteger highBit)
		between: 0
		and: high ] whileFalse.
	^ r+1
]

{ #category : #private }
SecureRandom >> nextRandom160 [
	"Answer a newly generated 160-bit random number in the range [1..(2^160 - 1)]."
	"Details: Try again in the extremely unlikely chance that zero is encountered."

	| result |
	result := 0.
	[result = 0] whileTrue: [
		result := SHA1 new hashInteger: key seed: seed.
		key := key + result + 1].
	^ result
]

{ #category : #printing }
SecureRandom >> printOn: aStream [
	aStream 
		nextPutAll: 'a ' ;
		nextPutAll: self class name
]
