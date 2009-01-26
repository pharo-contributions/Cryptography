accessing
nextBits: bitLength
	| answer extraBits |
	answer _ 0.
	bitLength // 160
		timesRepeat: [answer _ (answer bitShift: 160) bitOr: self nextRandom160].
	extraBits _ bitLength \\ 160.
	answer _ (answer bitShift: extraBits) bitOr: (self nextRandom160 bitShift: extraBits - 160).
	^ answer