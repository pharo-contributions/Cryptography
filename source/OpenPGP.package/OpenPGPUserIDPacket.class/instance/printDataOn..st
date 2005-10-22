printing
printDataOn: aStream
	aStream nextPutAll: ', uid='.
	aStream nextPutAll: self dataAsString