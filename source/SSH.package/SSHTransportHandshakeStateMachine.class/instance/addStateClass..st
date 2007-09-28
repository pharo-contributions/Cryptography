process
addStateClass: aStateClass

	self pendingStates add: (aStateClass newOnMachine: self).
