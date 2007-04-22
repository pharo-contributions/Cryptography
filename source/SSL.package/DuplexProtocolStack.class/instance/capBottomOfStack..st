initialize-release
capBottomOfStack: aCap

	self hasBottomCap ifTrue: [
		downStack popFirst.
		self bottomCap upProtocol: nil].
	bottomCap := aCap.
	aCap duplexStack: self.
	downStack pushFirst: self bottomCap.
	upStack isEmpty ifFalse: [self bottomCap upProtocol: upStack tail].
