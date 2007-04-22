conn states
bulkCipherDictionary

	^ Dictionary new
		at: #null put: SSLNullCipherSecurityState;
		at: #'RC4_128' put: SSLRC4CipherSecurityState;
		at: #'DES_CBC' put: TLS11DesCipherSecurityState;
		at: #'3DES_EDE_CBC' put: TLS11TripleDesCipherSecurityState;
		yourself.
