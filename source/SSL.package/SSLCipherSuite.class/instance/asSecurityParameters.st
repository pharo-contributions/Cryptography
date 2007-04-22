converting
asSecurityParameters

	^ SSLSecurityParameters new
		makeServer;
		cipherSuite: self;
		yourself