stack
pushDown: aProto

	downStack push: aProto.
	self hasTopCap ifTrue: [self topCap downProtocol: downStack head].
