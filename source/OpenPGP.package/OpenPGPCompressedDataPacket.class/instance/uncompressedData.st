accessing
uncompressedData
	data first = 1 ifFalse: [self error: 'only inflate supported'].
	^(InflateStream on: data from: 2 to: data size) upToEnd