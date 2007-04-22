setup
stateFromBytes: aByteArray columns: numberOfColumns
	aByteArray size = (4 * numberOfColumns) ifFalse: [^ self error: 'wrong block size'].
	^ (1 to: numberOfColumns) collect: [:k | ThirtyTwoBitRegister loadFrom: aByteArray at: (k-1)*4 + 1]