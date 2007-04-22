conn states
macDictionary

	^ Dictionary new
		at: #null put: SSLNullMACSecurityState;
		at: #'MD5' put: TLS10MD5MACSecurityState;
		at: #'SHA' put: TLS10SHAMACSecurityState;
		yourself.
