accessing
creationTime
	creationTime isNil ifTrue: [self parseData].
	^creationTime