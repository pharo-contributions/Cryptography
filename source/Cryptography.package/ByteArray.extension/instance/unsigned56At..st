*cryptography-core
unsigned56At: index
	"Return a unsigned integer quantity starting from the given byte index"

	| b0 b1 b2 b3 b4 b5 w |

	w _ self at: index.
	b5 _ self at: index+1.
	b4 _ self at: index+2.
	b3 _ self at: index+3.
	b2 _ self at: index+4.
	b1 _ self at: index+5.
	b0 _ self at: index+6.

	"Minimize LargeInteger arithmetic"
	b5 = 0 ifFalse:[w _ (b5 bitShift: 8) + w].
	b4 = 0 ifFalse:[w _ (b4 bitShift: 16) + w].
	b3 = 0 ifFalse:[w _ (b3 bitShift: 24) + w].
	b2 = 0 ifFalse:[w _ (b2 bitShift: 32) + w].
	b1 = 0 ifFalse:[w _ (b1 bitShift: 40) + w].
	b0 = 0 ifFalse:[w _ (b0 bitShift: 48) + w].

	^w