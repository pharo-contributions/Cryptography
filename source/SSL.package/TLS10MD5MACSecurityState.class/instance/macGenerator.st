converting
macGenerator

	hMAC := MD5 new hmac key: self writeKey; yourself.
	^ super macGenerator