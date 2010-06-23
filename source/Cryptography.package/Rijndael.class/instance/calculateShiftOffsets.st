setup
calculateShiftOffsets
	(nB = 4 or: [nB = 6]) ifTrue: [shiftOffset1 := 1. shiftOffset2 := 2. shiftOffset3 := 3].
	nB = 8 ifTrue: [shiftOffset1 := 1. shiftOffset2 := 3. shiftOffset3 := 4]