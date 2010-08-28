printing
printElementsOn: aStream

	aStream nextPutAll: '(name: ' , name printString.
	aStream nextPutAll: ' default: ' , default printString.
	aStream nextPutAll: ' transitions:'.
	self associationsDo: [:transition | aStream space.  transition printOn: aStream.].
	aStream nextPut: $).