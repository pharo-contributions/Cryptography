"
Fortuna is a cryptographically secure pseudorandom number generator specified by Niels Ferguson and Bruce Schneier in chapter 10 of ""Practical Cryptography.""  This generator utilizes a Rijndael (AES) cipher in CTR mode and is patent-free.
"
Class {
	#name : #Fortuna,
	#superclass : #RandomGenerator,
	#instVars : [
		'key',
		'ctr'
	],
	#category : #'Cryptography-RandomAndPrime'
}

{ #category : #example }
Fortuna class >> fromUser [
	"Ask the user to type a long random string and use the result to seed the secure random number generator."
	<script: 'self fromUser inspect'>

	| string |
	string := UIManager default request: 'Enter a long random string to seed the random generator.'.
	^ self key: string
]

{ #category : #'instance creation' }
Fortuna class >> key: aByteArray [
	^ self new 
		setKey: aByteArray ;
		yourself
]

{ #category : #initialize }
Fortuna >> destroy [
	key destroy.
	ctr destroy
]

{ #category : #private }
Fortuna >> generateBlocks: anInteger [
	^ ByteArray streamContents:
		[ : stream |
		anInteger timesRepeat:
			[ stream nextPutAll: ctr nextBlock ] ]
]

{ #category : #initialize }
Fortuna >> initializeCtr [
	ctr := (Rijndael key: key) ctr
]

{ #category : #accessing }
Fortuna >> nextBits: anInteger [ 
	| firstBits bits8 |
	firstBits := (self nextBytes: anInteger // 8) 
		uint: (bits8 := anInteger truncateTo: 8)
		at: 1.
	^ bits8 = anInteger 
		ifTrue: [ firstBits ]
		ifFalse: 
			[ | last8 mask bitsNeeded |
			last8 := self nextBytes: 1.
			bitsNeeded := anInteger - bits8.
			mask := ((1 to: bitsNeeded) 
				inject: 0
				into: [ : total : n | 1 bitShift: n ]) - 1.
			(firstBits bitShift: bitsNeeded) + (last8 first bitAnd: mask) ]
]

{ #category : #accessing }
Fortuna >> nextBytes: anInteger [
	"Generates and answers a ByteArray of size anInteger filled with random data.  This is the #pseudoRandomData: function from p. 166 of Practical Cryptography.  I have renamed it to nextBytes: to be more consistent with Squeaks #nextBits: nomenclature."
	| data |
	(anInteger between: 0 and:  1048576  "2 raisedTo: 20")
		ifFalse:
			[ CryptographyError signal: 'program error, should not generate this much data with the same key.' ].
	data := self generateBlocks: ((anInteger / 16) roundUpTo: 1).
	"Switch to a new key to avoid later compromises of this output."
	self setKey: (self generateBlocks: 2).
	^ data size = anInteger
		ifTrue: [ data ]
		ifFalse: [ data copyFrom: 1 to: anInteger ]
]

{ #category : #initialize }
Fortuna >> setKey: aByteArray [
	aByteArray size < Rijndael keySize
		ifTrue:
			[ CryptographyError signal: 'Fortuna requires a ', Rijndael keySize printString, '-byte key' ].
	key := aByteArray copyFrom: 1 to: Rijndael keySize.
	self initializeCtr
]
