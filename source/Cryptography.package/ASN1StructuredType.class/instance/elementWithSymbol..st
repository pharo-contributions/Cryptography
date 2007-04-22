accessing
elementWithSymbol: aSymbol

	^ self elements
		detect: [:each | each symbol == aSymbol]
		ifNone: [self error: 'no element specified in structured type'].
