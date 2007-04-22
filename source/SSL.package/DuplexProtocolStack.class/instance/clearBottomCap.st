initialize-release
clearBottomCap

	self hasBottomCap ifTrue: [
		bottomCap upProtocol: nil.
		bottomCap := nil].
