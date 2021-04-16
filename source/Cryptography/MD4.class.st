Class {
	#name : #MD4,
	#superclass : #HashFunction,
	#instVars : [
		'a',
		'b',
		'c',
		'd',
		'input',
		'output'
	],
	#category : #'Cryptography-MD4'
}

{ #category : #'instance creation' }
MD4 class >> encode: aString [
	^ (self input: aString)
		run;
		output
]

{ #category : #'instance creation' }
MD4 class >> input: anArray [ 
	^ self new input: anArray
]

{ #category : #'instance creation' }
MD4 class >> new [
	^ super new initialize
]

{ #category : #'instance creation' }
MD4 class >> oidString [

	^ '1.2.840.113549.2.5'.

]

{ #category : #copying }
MD4 >> copy4: u to: anArray startingAt: n [
	anArray
		at: n put: (u bitAnd: 16rFF);
		at: n + 1 put: (u >> 8 bitAnd: 16rFF);
		at: n + 2 put: (u >> 16 bitAnd: 16rFF);
		at: n + 3 put: (u >> 24 bitAnd: 16rFF)
]

{ #category : #copying }
MD4 >> copy4ToOutput [
	self
		copy4: a to: output startingAt: 1;
		copy4: b to: output startingAt: 5;
		copy4: c to: output startingAt: 9;
		copy4: d to: output startingAt: 13
]

{ #category : #copying }
MD4 >> copy64: anArray [ 
	^ self copy64: anArray startingAt: 1
]

{ #category : #copying }
MD4 >> copy64: anArray startingAt: n [ 
	| array u answer |
	array := anArray collect: [:char | char asInteger].
	answer := Array new: 16.
	1 to: answer size
		do: 
			[:i | 
			u := (array at: i - 1 * 4 + 3 + n) << 24.
			u := u bitOr: (array at: i - 1 * 4 + 2 + n) << 16.
			u := u bitOr: (array at: i - 1 * 4 + 1 + n) << 8.
			u := u bitOr: (array at: i - 1 * 4 + 0 + n) << 0.
			answer at: i put: u].
	^ answer
]

{ #category : #functions }
MD4 >> fFunction: x [ 
	^ ((b bitAnd: c)
		bitOr: (b bitInvert bitAnd: d))
		+ x
]

{ #category : #functions }
MD4 >> fRound: x shift: s [ 
	a := self lshift: a + (self fFunction: x) bits: s
]

{ #category : #functions }
MD4 >> gFunction: x [ 
	^ ((b bitAnd: c)
		bitOr: ((b bitAnd: d)
				bitOr: (c bitAnd: d)))
		+ x + 16r5A827999
]

{ #category : #functions }
MD4 >> gRound: x shift: s [ 
	a := self lshift: a + (self gFunction: x) bits: s
]

{ #category : #functions }
MD4 >> hFunction: x [ 
	^ ((b bitXor: c)
		bitXor: d)
		+ x + 16r6ED9EBA1
]

{ #category : #functions }
MD4 >> hRound: x shift: s [ 
	a := self lshift: a + (self hFunction: x) bits: s
]

{ #category : #accessing }
MD4 >> hashMessage: aStringOrByteArray [
	self input: aStringOrByteArray asByteArray.
	self run.
	^ self output
]

{ #category : #accessing }
MD4 >> hashStream: aStream [
	^ self hashMessage: aStream upToEnd
]

{ #category : #initialization }
MD4 >> initialize [
	
	super initialize.
	a := 16r67452301.
	b := 16rEFCDAB89.
	c := 16r98BADCFE.
	d := 16r10325476.
	output := ByteArray new: 16
]

{ #category : #accessing }
MD4 >> input: anArray [ 
	input := anArray
]

{ #category : #functions }
MD4 >> lshift: u bits: s [ 
	"
	(Md4 new lshift: 1 s: 33) printStringRadix: 2 
	"

	| lo |
	lo := u bitAnd: 16rFFFFFFFF.
	^ (lo << s bitAnd: 16rFFFFFFFF)
		bitOr: lo >> (32 - s)
]

{ #category : #computing }
MD4 >> mdFour64: array [ 
	| aa bb cc dd indexes s |
	aa := a.
	bb := b.
	cc := c.
	dd := d.
	indexes := #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16) readStream.
	s := #(3 7 11 19 3 7 11 19 3 7 11 19 3 7 11 19) readStream.
	[indexes atEnd]
		whileFalse: [self fRound: (array at: indexes next)
				shift: s next; turn].
	indexes := #(1 5 9 13 2 6 10 14 3 7 11 15 4 8 12 16) readStream.
	s := #(3 5 9 13 3 5 9 13 3 5 9 13 3 5 9 13) readStream.
	[indexes atEnd]
		whileFalse: [self gRound: (array at: indexes next)
				shift: s next; turn].
	indexes := #(1 9 5 13 3 11 7 15 2 10 6 14 4 12 8 16) readStream.
	s := #(3 9 11 15 3 9 11 15 3 9 11 15 3 9 11 15) readStream.
	[indexes atEnd]
		whileFalse: [self hRound: (array at: indexes next)
				shift: s next; turn].
	a := a + aa bitAnd: 16rFFFFFFFF.
	b := b + bb bitAnd: 16rFFFFFFFF.
	c := c + cc bitAnd: 16rFFFFFFFF.
	d := d + dd bitAnd: 16rFFFFFFFF
]

{ #category : #accessing }
MD4 >> output [
	^ output
]

{ #category : #computing }
MD4 >> run [
	| n buffer bb j offset |
	buffer := ByteArray new: 128.
	n := input size.
	bb := n * 8.
	j := 0.
	[n > 64]
		whileTrue: 
			[self mdFour64: (self copy64: input startingAt: j + 1).
			j := j + 64.
			n := n - 64].
	buffer atAllPut: 0.
	1 to: n do: [:i | buffer at: i put: (input at: j + i)].
	buffer at: n + 1 put: 16r80.
	offset := n <= 55 ifTrue: [56] ifFalse: [120].
	self copy4: bb to: buffer startingAt: offset + 1.
	self mdFour64: (self copy64: buffer).
	n > 55 ifTrue: [self mdFour64: (self copy64: buffer startingAt: 64)].
	buffer atAllPut: 0.
	self copy4ToOutput.
	a := b := c := d := 0
]

{ #category : #functions }
MD4 >> turn [
	| temp |
	temp := d.
	d := c.
	c := b.
	b := a.
	a := temp
]
