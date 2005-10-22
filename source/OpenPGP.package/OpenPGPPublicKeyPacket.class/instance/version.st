accessing
version
	version isNil ifTrue: [self parseData].
	^version