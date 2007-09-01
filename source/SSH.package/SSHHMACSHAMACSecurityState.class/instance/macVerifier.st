converting
macVerifier

	hMAC := SHA1 new hmac key: self readKey; yourself.
	^ super macVerifier