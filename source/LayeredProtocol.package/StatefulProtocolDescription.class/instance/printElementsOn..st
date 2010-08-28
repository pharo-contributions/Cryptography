printing
printElementsOn: aStream

	aStream nextPutAll: '(initial: ' , initialState printString , ' states:'.
	self keysDo: [:key | aStream space.  key printOn: aStream].
	aStream nextPut: $)