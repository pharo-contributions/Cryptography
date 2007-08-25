initialize-release
initializeHandshakeStateMachine
	
	self handshakeStateMachine: (SSHHandshakeStateMachine newOnConnection: self).
