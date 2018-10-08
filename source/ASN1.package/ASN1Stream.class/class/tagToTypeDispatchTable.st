class initialization
tagToTypeDispatchTable

	TagToTypeDispatchTable isNil ifTrue: [self initializeTagToTypeDispatchTable].
	^ TagToTypeDispatchTable
