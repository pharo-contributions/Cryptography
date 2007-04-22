as yet unclassified
nextPutAll: aCollection
	aCollection do: [ :each | self nextPut: each].
	^ aCollection