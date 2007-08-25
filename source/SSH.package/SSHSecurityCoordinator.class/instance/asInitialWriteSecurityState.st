conn states
asInitialWriteSecurityState

	| connState |
	connState := SSHInitialWriteConnectionState newOnConnection: self connection.
	connState
		cipherState: (self bulkCipherAlgorithmStateOn: connState);
		packagerState: (self packagerAlgorithmStateOn: connState);
		yourself.
	^ connState