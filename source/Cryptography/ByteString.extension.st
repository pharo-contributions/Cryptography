Extension { #name : #ByteString }

{ #category : #'*Cryptography-RandomAndPrime' }
ByteString >> destroy [
	"destroy this string by replacing every character with a space"
	1 to: self size do: [:i | 
		self at: i put: Character space
	]
]

{ #category : #'*Cryptography-RandomAndPrime' }
ByteString >> unsignedLongAt: index bigEndian: aBool [
	"Return a 32bit unsigned integer quantity starting from the given byte index"
	| b0 b1 b2 w |
	aBool ifTrue:[
		b0 := self byteAt: index.
		b1 := self byteAt: index+1.
		b2 := self byteAt: index+2.
		w := self byteAt: index+3.
	] ifFalse:[
		w := self byteAt: index.
		b2 := self byteAt: index+1.
		b1 := self byteAt: index+2.
		b0 := self byteAt: index+3.
	].
	"Minimize LargeInteger arithmetic"
	b2 = 0 ifFalse:[w := (b2 bitShift: 8) + w].
	b1 = 0 ifFalse:[w := (b1 bitShift: 16) + w].
	b0 = 0 ifFalse:[w := (b0 bitShift: 24) + w].
	^w
]

{ #category : #'*Cryptography-RandomAndPrime' }
ByteString >> unsignedLongAt: index put: value bigEndian: aBool [
	"Store a 32bit unsigned integer quantity starting from the given byte index"
	| b0 b1 b2 b3 |
	b0 := value bitShift: -24.
	b1 := (value bitShift: -16) bitAnd: 255.
	b2 := (value bitShift: -8) bitAnd: 255.
	b3 := value bitAnd: 255.
	aBool ifTrue:[
		self byteAt: index put: b0.
		self byteAt: index+1 put: b1.
		self byteAt: index+2 put: b2.
		self byteAt: index+3 put: b3.
	] ifFalse:[
		self byteAt: index put: b3.
		self byteAt: index+1 put: b2.
		self byteAt: index+2 put: b1.
		self byteAt: index+3 put: b0.
	].
	^value
]
