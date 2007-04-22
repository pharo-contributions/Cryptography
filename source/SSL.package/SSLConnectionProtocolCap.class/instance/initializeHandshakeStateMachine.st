initialize-release
initializeHandshakeStateMachine
	
	self handshakeStateMachine: (SSLHandshakeStateMachine newOnConnection: self).
