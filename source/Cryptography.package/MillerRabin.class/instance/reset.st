computing
reset
	iterations := 0.
	satisfied := true.
	minusOne := target - 1.
	samples := minusOne.
	k := minusOne lowBit - 1.
	n0 := minusOne bitShift: k negated