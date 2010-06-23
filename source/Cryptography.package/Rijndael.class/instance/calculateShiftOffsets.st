setup
calculateShiftOffsets
	(nB = 4 or: [nB = 6]) ifTrue: [shiftOffset1 _ 1. shiftOffset2 _ 2. shiftOffset3 _ 3].
	nB = 8 ifTrue: [shiftOffset1 _ 1. shiftOffset2 _ 3. shiftOffset3 _ 4]