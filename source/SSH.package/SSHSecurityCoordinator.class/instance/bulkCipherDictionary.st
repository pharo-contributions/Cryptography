conn states
bulkCipherDictionary

	^ Dictionary new
		at: #ascii put: SSHAsciiSecurityState;
		at: #null put: SSHNullCipherSecurityState;
		yourself.
