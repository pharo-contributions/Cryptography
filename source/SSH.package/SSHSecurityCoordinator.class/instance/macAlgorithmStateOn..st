conn states
macAlgorithmStateOn: connState

	^ ((self macDictionary at: self securityParams macAlgorithm) 
		newOnConnectionSecurityState: connState)
			hashSize: self securityParams hashSize;
			yourself
