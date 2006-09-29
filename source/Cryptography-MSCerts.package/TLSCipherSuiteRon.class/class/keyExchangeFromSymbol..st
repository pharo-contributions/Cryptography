parsing
keyExchangeFromSymbol: aSymbol
	
	| withIndex |
	withIndex _ aSymbol findString: 'WITH'.
	withIndex = 0 ifTrue: [^self error: 'No WITH'].
	^aSymbol copyFrom: 5 to: withIndex - 2.