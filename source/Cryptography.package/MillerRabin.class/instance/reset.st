computing
reset
	iterations _ 0.
	satisfied _ true.
	minusOne _ target - 1.
	samples _ minusOne.
	k _ minusOne lowBit - 1.
	n0 _ minusOne bitShift: k negated