conn states
bulkCipherDictionary

	^ Dictionary new
		at: #null put: SSLNullCipherSecurityState;
		at: #'RC4_128' put: SSLRC4CipherSecurityState;
		at: #'DES_CBC' put: SSL30DesCipherSecurityState;
		at: #'3DES_EDE_CBC' put: SSL30TripleDesCipherSecurityState;
		yourself.
