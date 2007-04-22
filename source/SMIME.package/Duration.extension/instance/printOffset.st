*smime-printing
printOffset

	| aStream h m |
	aStream := '' writeStream.
	h _ self hours abs.
	m _ self minutes abs.
	self negative ifTrue: [ aStream nextPut: $- ].
	h < 10 ifTrue: [ aStream nextPut: $0. ].
	h printOn: aStream.
	m < 10 ifTrue: [ aStream nextPut: $0. ].
	m printOn: aStream.
	^ aStream contents