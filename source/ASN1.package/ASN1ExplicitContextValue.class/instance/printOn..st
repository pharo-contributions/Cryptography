printing
printOn: aStream

	aStream nextPutAll: '[', self tagIndex asString, ']', (self tagValue printString).
