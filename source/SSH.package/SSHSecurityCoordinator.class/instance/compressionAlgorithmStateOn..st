conn states
compressionAlgorithmStateOn: connState

	^ (self compressionDictionary at: self securityParams compressionAlgorithm) 
		newOnConnectionSecurityState: connState
