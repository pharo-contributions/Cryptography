accessing
algorithmSpecificData
	algorithmSpecificData isNil ifTrue: [self parseData].
	^algorithmSpecificData