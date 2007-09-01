conn states
macDictionary

	^ Dictionary new
		at: #null put: SSHNullMACSecurityState;
		at: 'hmac-sha1' put: SSHHMACSHAMACSecurityState;
		yourself.
