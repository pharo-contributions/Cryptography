*cryptography-core-accumulator ops
leftRotateBy: bits
	"Rotate my contents left by the given number of bits, retaining exactly 32 bits."
	"Details: Perform this operation with as little LargeInteger arithmetic as possible."

	| bitCount s1 s2 newHi |
	"ensure bitCount is in range [0..32]"
	bitCount _ bits \\ 32.
	bitCount < 0 ifTrue: [bitCount _ bitCount + 32].

	bitCount > 16
		ifTrue: [
			s1 _ bitCount - 16.
			s2 _ s1 - 16.
			newHi _ ((low bitShift: s1) bitAnd: 16rFFFF) bitOr: (hi bitShift: s2).
			low _ ((hi bitShift: s1) bitAnd: 16rFFFF) bitOr: (low bitShift: s2).
			hi _ newHi]
		ifFalse: [
			s1 _ bitCount.
			s2 _ s1 - 16.
			newHi _ ((hi bitShift: s1) bitAnd: 16rFFFF) bitOr: (low bitShift: s2).
			low _ ((low bitShift: s1) bitAnd: 16rFFFF) bitOr: (hi bitShift: s2).
			hi _ newHi]
