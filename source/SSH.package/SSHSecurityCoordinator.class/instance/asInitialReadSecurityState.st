conn states
asInitialReadSecurityState

	| connState |
	connState := SSHInitialReadConnectionState newOnConnection: self connection.
	connState
		cipherState: (self bulkCipherAlgorithmStateOn: connState);
		packagerState: (self packagerAlgorithmStateOn: connState);
		yourself.
	^ connState