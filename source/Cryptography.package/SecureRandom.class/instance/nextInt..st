accessing
nextInt: anInteger
	"Answer a random integer in the interval [1, anInteger]."
	| r high |
	anInteger strictlyPositive ifFalse: [ self error: 'Range must be positive' ].
	high _ anInteger-1.
	[ (r _ self nextBits: anInteger highBit)
		between: 0
		and: high ] whileFalse.
	^ r+1