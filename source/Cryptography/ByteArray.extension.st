Extension { #name : #ByteArray }

{ #category : #'*cryptography-core' }
ByteArray >> hexStringInNibbles [


	^ (self  
		inject: String new writeStream
		into: [:stream :byte |
			stream
				nextPut: ('0123456789ABCDEF' at: byte // 16 + 1);
				nextPut: ('0123456789ABCDEF' at: byte \\ 16 + 1);
				nextPut: Character space.  
			stream]) contents.

]

{ #category : #'*cryptography-core' }
ByteArray >> isProperlyPadded [
	"Verify my bytes have padding applied by #padToMultipleOf:.  The padding scheme used here is option #2 as specified by Ferguson and Schneier in 'Practical Cryptography', p. 68-69."
	| pad end start |
	pad := self last.
	end := self size.
	start := end - pad + 1.
	^ start > 0
	and: [ (start to: end) allSatisfy: [ : each | (self at: each) = pad ] ]
]

{ #category : #'*cryptography-core' }
ByteArray >> padToMultipleOf: blockSize [
	"Answer a new ByteArray that is padded to anInteger bytes.  This is used by block-based ciphers where the length of the ByteArray to be encrypted must be a multiple of that ciphers #blockSize.  The padding scheme used here is option #2 as specified by Ferguson and Schneier in 'Practical Cryptography', p. 68-69."
	| answer pad |
	answer := ByteArray new: (self paddedSize: blockSize).
	answer
		replaceFrom: 1
		to: self size
		with: self
		startingAt: 1.
	pad := answer size - self size.
	self size+1 
		to: answer size 
		do: [ : x | answer at: x put: pad ].
	^ answer
]

{ #category : #'*cryptography-core' }
ByteArray >> paddedSize: blockSize [
	"If my size is an exact multiple of blockSize, an entire pad-block is required.  That's why we have the +1."
	^ (self size+1) roundUpTo: blockSize
]

{ #category : #'*cryptography-core' }
ByteArray >> toEBase64String [

	| base64Table stream firstIndex secondIndex thirdIndex fourthIndex extra |
	base64Table := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz=_'.

	stream := String new writeStream.
	1 to: self size - 2 by: 3 do: [:i |
		firstIndex := ((self at: i) bitAnd: 16rFC) >> 2.
		secondIndex := ((((self at: i) bitAnd: 16r03) << 4) bitOr: (((self at: i+1) bitAnd: 16rF0) >> 4)).
		thirdIndex := ((((self at: i+1) bitAnd: 16r0F) << 2) bitOr: (((self at: i+2) bitAnd: 16rC0) >> 6)).
		fourthIndex := ((self at: i+2) bitAnd: 16r3F).
		stream nextPut: (base64Table at: firstIndex + 1).
		stream nextPut: (base64Table at: secondIndex + 1).
		stream nextPut: (base64Table at: thirdIndex + 1).
		stream nextPut: (base64Table at: fourthIndex + 1)].

	extra := self size - (self size // 3 * 3).
	extra = 0 ifTrue: [^ stream contents].
	extra = 1 ifTrue: [
		firstIndex := ((self at: self size) bitAnd: 16rFC) >> 2.
		secondIndex := ((self at: self size) bitAnd: 16r03) << 4.
		stream nextPut: (base64Table at: firstIndex + 1).
		stream nextPut: (base64Table at: secondIndex + 1).
		^ stream contents].
	extra = 2 ifTrue: [
		firstIndex := ((self at: self size - 1) bitAnd: 16rFC) >> 2.
		secondIndex := ((((self at: self size - 1) bitAnd: 16r03) << 4) bitOr: (((self at: self size) bitAnd: 16rF0) >> 4)).
		thirdIndex := ((self at: self size) bitAnd: 16r0F) << 2.
		stream nextPut: (base64Table at: firstIndex + 1).
		stream nextPut: (base64Table at: secondIndex + 1).
		stream nextPut: (base64Table at: thirdIndex + 1).
		^ stream contents].

]

{ #category : #'*cryptography-core' }
ByteArray >> uint: bits at: anInteger [

	| answer bytes |
	bits == 64 ifTrue: [ ^ self unsigned64At: anInteger ].
	bits == 56 ifTrue: [ ^ self unsigned56At: anInteger ].
	bits == 48 ifTrue: [ ^ self unsigned48At: anInteger ].
	bits == 40 ifTrue: [ ^ self unsigned40At: anInteger ].
	bits == 32
		ifTrue:
			[ ^ self
				unsignedLongAt: anInteger
				bigEndian: false ].
	bits == 16
		ifTrue:
			[ ^ self
				unsignedShortAt: anInteger
				bigEndian: false ].
	bits == 8 
		ifTrue:
			[ ^ self byteAt: anInteger ].
	bytes := bits // 8.
	answer := LargePositiveInteger new: bytes.
	1 to: bytes do:
		[ :digitPosition |
		answer
			digitAt: digitPosition
			put: (self at: digitPosition + anInteger - 1) ].
	^answer normalize
]

{ #category : #'*cryptography-core' }
ByteArray >> uint: bits at: position put: anInteger [

	position
		to: position + (bits // 8) - 1
		do:
			[ :pos |
			self
				at: pos
				put: (anInteger digitAt: pos-position+1) ].
	^ anInteger
]

{ #category : #'*cryptography-core' }
ByteArray >> unpad [
	| pad end |
	self isProperlyPadded ifFalse: [ CryptographyError signal: 'Authentication failure (improperly padded!)' ].
	pad := self last.
	end := self size - pad.
	^ self copyFrom: 1 to: end
]

{ #category : #'*cryptography-core' }
ByteArray >> unpaddedSize [
	"If I was padded by a BlockCipher, answer the size of the original plaintext."
	self isProperlyPadded ifFalse: [ CryptographyError signal: 'Authentication failure (improperly padded!)' ].
	^ self size - self last
]

{ #category : #'*cryptography-core' }
ByteArray >> unsigned40At: index [
	"Return a unsigned integer quantity starting from the given byte index"

	| b0 b1 b2 b3 w |

	w := self at: index.
	b3 := self at: index+1.
	b2 := self at: index+2.
	b1 := self at: index+3.
	b0 := self at: index+4.

	"Minimize LargeInteger arithmetic"
	b3 = 0 ifFalse:[w := (b3 bitShift: 8) + w].
	b2 = 0 ifFalse:[w := (b2 bitShift: 16) + w].
	b1 = 0 ifFalse:[w := (b1 bitShift: 24) + w].
	b0 = 0 ifFalse:[w := (b0 bitShift: 32) + w].

	^w
]

{ #category : #'*cryptography-core' }
ByteArray >> unsigned48At: index [
	"Return a unsigned integer quantity starting from the given byte index"

	| b0 b1 b2 b3 b4 w |

	w := self at: index.
	b4 := self at: index+1.
	b3 := self at: index+2.
	b2 := self at: index+3.
	b1 := self at: index+4.
	b0 := self at: index+5.

	"Minimize LargeInteger arithmetic"
	b4 = 0 ifFalse:[w := (b4 bitShift: 8) + w].
	b3 = 0 ifFalse:[w := (b3 bitShift: 16) + w].
	b2 = 0 ifFalse:[w := (b2 bitShift: 24) + w].
	b1 = 0 ifFalse:[w := (b1 bitShift: 32) + w].
	b0 = 0 ifFalse:[w := (b0 bitShift: 40) + w].

	^w
]

{ #category : #'*cryptography-core' }
ByteArray >> unsigned56At: index [
	"Return a unsigned integer quantity starting from the given byte index"

	| b0 b1 b2 b3 b4 b5 w |

	w := self at: index.
	b5 := self at: index+1.
	b4 := self at: index+2.
	b3 := self at: index+3.
	b2 := self at: index+4.
	b1 := self at: index+5.
	b0 := self at: index+6.

	"Minimize LargeInteger arithmetic"
	b5 = 0 ifFalse:[w := (b5 bitShift: 8) + w].
	b4 = 0 ifFalse:[w := (b4 bitShift: 16) + w].
	b3 = 0 ifFalse:[w := (b3 bitShift: 24) + w].
	b2 = 0 ifFalse:[w := (b2 bitShift: 32) + w].
	b1 = 0 ifFalse:[w := (b1 bitShift: 40) + w].
	b0 = 0 ifFalse:[w := (b0 bitShift: 48) + w].

	^w
]

{ #category : #'*cryptography-core' }
ByteArray >> unsigned64At: index [
	"Return a unsigned integer quantity starting from the given byte index"

	| b0 b1 b2 b3 b4 b5 b6 w |

	w := self at: index.
	b6 := self at: index+1.
	b5 := self at: index+2.
	b4 := self at: index+3.
	b3 := self at: index+4.
	b2 := self at: index+5.
	b1 := self at: index+6.
	b0 := self at: index+7.

	"Minimize LargeInteger arithmetic"
	b6 = 0 ifFalse:[w := (b6 bitShift: 8) + w].
	b5 = 0 ifFalse:[w := (b5 bitShift: 16) + w].
	b4 = 0 ifFalse:[w := (b4 bitShift: 24) + w].
	b3 = 0 ifFalse:[w := (b3 bitShift: 32) + w].
	b2 = 0 ifFalse:[w := (b2 bitShift: 40) + w].
	b1 = 0 ifFalse:[w := (b1 bitShift: 48) + w].
	b0 = 0 ifFalse:[w := (b0 bitShift: 56) + w].

	^w
]
