conn states
macDictionary

	^ Dictionary new
		at: #null put: TLSNullMACSecurityState;
		at: #'MD5' put: SSL30MD5MACSecurityState;
		at: #'SHA' put: SSL30SHAMACSecurityState;
		yourself.
