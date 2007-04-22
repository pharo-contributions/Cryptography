process
processOnConnection: conn

	conn handshakeStateMachine process: self
