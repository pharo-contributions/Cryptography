initialize-release
capTopOfStack: aCap

	self hasTopCap ifTrue: [
		upStack pop.
		self topCap downProtocol: nil].
	topCap := aCap.
	aCap duplexStack: self.
	upStack push: self topCap.
	downStack isEmpty ifFalse: [self topCap downProtocol: downStack head].
