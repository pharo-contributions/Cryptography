conn states
packagerAlgorithmStateOn: connState

	^ (self packagerDictionary at: self securityParams packagerAlgorithm) 
		newOnConnectionSecurityState: connState
