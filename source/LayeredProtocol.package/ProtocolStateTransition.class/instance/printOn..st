printing
printOn: aStream

	aStream nextPut: ${.
	action printOn: aStream.
	aStream nextPutAll: ' -> '.
	aStream nextPutAll: ((state isMemberOf: Symbol)
		ifTrue: [state]
		ifFalse: [state name]) printString.
	aStream nextPut: $}