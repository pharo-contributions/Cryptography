converting
macGenerator

	hMAC := SHA1 new hmac key: self writeKey; yourself.
	^ super macGenerator