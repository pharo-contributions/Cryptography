converting
macVerifier

	^ SSHMACVerifier new
		macState: self;
		yourself