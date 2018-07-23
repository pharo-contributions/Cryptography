encoding
encodeValue: anObject withDERStream: derStream

	anObject 
		ifTrue: [derStream nextPut: 255]
		ifFalse: [derStream nextPut: 0].
