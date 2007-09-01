conn states
bulkCipherDictionary

	^ Dictionary new
		at: #ascii put: SSHAsciiSecurityState;
		at: #null put: SSHNullCipherSecurityState;
		at: '3des-cbc' put: SSHTripleDesCBCCipherSecurityState;
		yourself.
