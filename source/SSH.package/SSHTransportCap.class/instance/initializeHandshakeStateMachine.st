initialize-release
initializeHandshakeStateMachine
	
	self handshakeStateMachine: (SSHTransportHandshakeStateMachine newOnConnection: self).
