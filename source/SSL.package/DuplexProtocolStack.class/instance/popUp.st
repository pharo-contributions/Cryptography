stack
popUp
	
	| proto |
	self hasTopCap ifTrue: [upStack pop].
	upStack notEmpty ifTrue: [proto := upStack pop].
	self hasTopCap ifTrue: [upStack push: self topCap].
	self hasBottomCap ifTrue: [self bottomCap upProtocol: upStack tail].
	^ proto