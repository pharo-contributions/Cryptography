printing
printOn: aStream
	aStream print: cipher; nextPut: $-; nextPutAll: self class name