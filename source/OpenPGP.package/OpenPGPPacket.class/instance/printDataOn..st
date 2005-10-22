printing
printDataOn: aStream
	aStream nextPutAll: ', data='.
	aStream print: self data