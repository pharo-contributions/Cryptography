process
pushStateClass: aStateClass

	self pendingStates addFirst: (aStateClass newOnMachine: self).
