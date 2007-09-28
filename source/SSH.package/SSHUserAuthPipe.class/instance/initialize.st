initialize-release
initialize

	self stateMachine: (SSHUserAuthHandshakeStateMachine newOnConnection: self).
	self userName: ''.
	self password: ''.
