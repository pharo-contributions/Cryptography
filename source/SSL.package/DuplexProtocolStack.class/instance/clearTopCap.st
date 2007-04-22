initialize-release
clearTopCap

	self hasTopCap ifTrue: [
		topCap downProtocol: nil.
		topCap := nil].
