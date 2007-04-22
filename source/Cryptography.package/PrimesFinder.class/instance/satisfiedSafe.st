testing
satisfiedSafe
	wheel satisfiedSafe ifFalse: [^ false].
	^ (MillerRabin isProbablyPrime: candidate)
		and: [MillerRabin isProbablyPrime: 2*candidate+1]