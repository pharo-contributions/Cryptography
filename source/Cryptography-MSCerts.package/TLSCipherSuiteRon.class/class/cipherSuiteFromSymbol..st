parsing
cipherSuiteFromSymbol: aSymbol
	
	| withIndex |
	withIndex _ aSymbol findString: 'WITH'.
	withIndex = 0 ifTrue: [^self error: 'No WITH'].
	^aSymbol copyFrom: withIndex + 5 to: aSymbol size - 4