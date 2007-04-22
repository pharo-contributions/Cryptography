converting
macVerifier

	hMAC := MD5 new hmac key: self readKey; yourself.
	^ super macVerifier