accessing
nextInt: anInteger
	"Answer a random integer in the interval [1, anInteger]."
	| r high bits highestMultiple |
	anInteger strictlyPositive ifFalse: [ self error: 'Range must be positive' ].
	high _ anInteger-1.
	bits _ high highBit.
	"Calculate highestMultiple of anInteger, so that we can simply divide r by anInteger and use the remainder for the random value."
	highestMultiple _ (1 bitShift: bits) truncateTo: anInteger.
	[ (r _ self nextBits: bits)
		between: 0
		and: highestMultiple ] whileFalse.
	^ r\\anInteger+1