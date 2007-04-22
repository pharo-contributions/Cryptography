conn states
asWriteSecurityState

	| connState |
	connState := SSLWriteConnectionState newOnConnection: self protocolCap.
	connState
		compressionState: (self compressionAlgorithmStateOn: connState);
		cipherState: (self bulkCipherAlgorithmStateOn: connState);
		macState: (self macAlgorithmStateOn: connState);
		yourself.
	^ connState