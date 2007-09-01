key init
setupEncryptionChoices

	self securityParams serverHostKeyAlgorithm: (self securityParams clientKeyInit serverHostKeyAlgorithms
		detect: [:eachAlgorithm | self securityParams serverKeyInit serverHostKeyAlgorithms includes: eachAlgorithm]
		ifNone: [self error: 'no key exchange algorithm found']).
	self securityParams bulkCipherAlgorithm: (self securityParams clientKeyInit encryptionAlgorithmsClientToServer
		detect: [:eachAlgorithm | self securityParams serverKeyInit encryptionAlgorithmsClientToServer includes: eachAlgorithm]
		ifNone: [self error: 'no key exchange algorithm found']).
	self securityParams macAlgorithm: (self securityParams clientKeyInit macAlgorithmsClientToServer
		detect: [:eachAlgorithm | self securityParams serverKeyInit macAlgorithmsClientToServer includes: eachAlgorithm]
		ifNone: [self error: 'no key exchange algorithm found']).
	self securityParams compressionAlgorithm: (self securityParams clientKeyInit compressionAlgorithmsClientToServer
		detect: [:eachAlgorithm | self securityParams serverKeyInit compressionAlgorithmsClientToServer includes: eachAlgorithm]
		ifNone: [self error: 'no key exchange algorithm found']).
	self pendingReadState: self asReadSecurityState.
	self pendingWriteState: self asWriteSecurityState.
