initialize-release
initializeOnStack: aStack

	aStack capTopOfStack: self.
	self initializeHandshakeStateMachine.
	self initializeSecurityCoordinator.
	self initializeReadAndWriteStates.
	self binary.
