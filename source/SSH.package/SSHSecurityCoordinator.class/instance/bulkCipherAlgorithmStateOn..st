conn states
bulkCipherAlgorithmStateOn: connState

	^ (self bulkCipherDictionary at: self securityParams bulkCipherAlgorithm) 
		newOnConnectionSecurityState: connState
