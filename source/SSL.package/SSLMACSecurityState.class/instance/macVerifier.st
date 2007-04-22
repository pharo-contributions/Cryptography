converting
macVerifier

	^ SSLMACVerifier new
		macState: self;
		yourself