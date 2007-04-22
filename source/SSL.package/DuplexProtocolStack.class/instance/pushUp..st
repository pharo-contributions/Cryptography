stack
pushUp: aProto

	self hasTopCap ifTrue: [upStack pop].
	upStack push: aProto.
	self hasTopCap ifTrue: [upStack push: self topCap].
	self hasBottomCap ifTrue: [self bottomCap upProtocol: upStack tail].
