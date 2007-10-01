process
addStateClass: aStateClass

	| inst |
	self pendingStates add: (inst := aStateClass newOnMachine: self).
	^ inst