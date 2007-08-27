process
computeLengthsAndPadding

	| padSize |
	padSize := 8 - ((self payload size + 5) \\ 8) \\ 8.
	padSize < 4 ifTrue: [padSize := padSize + 8].
	self paddingLength: padSize.
	self padding: (ByteArray new: self paddingLength withAll: self paddingLength).
	self packetLength: (self payload size + 1 + self padding size).
