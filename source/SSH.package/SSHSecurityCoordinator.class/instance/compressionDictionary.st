conn states
compressionDictionary

	^ Dictionary new
		at: 'none' put: SSHNullCompressionSecurityState;
		yourself.
