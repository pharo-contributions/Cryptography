initialize-release
initializeOnConnection: conn

	connection := conn.
	self securityParams: SSHSecurityParameters new.
	self pendingReadState: self asInitialReadSecurityState.
	self pendingWriteState: self asInitialWriteSecurityState.
	self securityParams bulkCipherAlgorithm: #null.
	self securityParams packagerAlgorithm: #binary.
