instance creation
newOnMachine: machine

	^ self new
		initializeOnMachine: machine;
		yourself