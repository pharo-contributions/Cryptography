accessing
process
	process == nil 
		ifTrue: [self initializeProcess].
	^process