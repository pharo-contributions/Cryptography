initialize-release
initializeOnStack: aStack

	aStack capTopOfStack: self.
	self initializeSecurityParameters.
	self setInitialVersion: SSLProtocolVersion tls11.
	self initializeSerialization.
	self initializeMessageDefragmentation.
	self initializeHandshakeStateMachine.
	self initializeReadAndWriteStates.
