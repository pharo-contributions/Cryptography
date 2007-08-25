initialize-release
initializeOnConnection: conn

	connection := conn.
	self securityParams: SSHSecurityParameters new.
