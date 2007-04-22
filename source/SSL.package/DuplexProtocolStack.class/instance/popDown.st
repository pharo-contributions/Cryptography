stack
popDown

	| proto |
	downStack notEmpty ifTrue: [proto := downStack pop].
	self hasTopCap ifTrue: [self topCap downProtocol: downStack head].
	^ proto
