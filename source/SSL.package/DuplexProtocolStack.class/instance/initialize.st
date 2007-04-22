initialize-release
initialize

	upStack := HalfDuplexProtocolStack newUpStackOn: self.
	downStack := HalfDuplexProtocolStack newDownStackOn: self.
	self capBottomOfStack: DuplexProtocolStackBottomCap new.
	self capTopOfStack: DuplexProtocolStackTopCap new.