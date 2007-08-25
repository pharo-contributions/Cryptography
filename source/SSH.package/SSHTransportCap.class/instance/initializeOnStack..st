initialize-release
initializeOnStack: aStack

	aStack capTopOfStack: self.
	self initializeHandshakeStateMachine.
	self initializeSecurityCoordinator.
	self initializeReadAndWriteStates.
	self send: 'SSH-2.0-version', String lf.
	self securityCoordinator securityParams bulkCipherAlgorithm: #null.
	self securityCoordinator securityParams packagerAlgorithm: #binary.
	self installWriteConnectionState.