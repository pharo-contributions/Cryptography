private
asRSAPublicKey

	| keys |
	keys := self subjectPublicKeyDecoded.
	^ (RSAPublicKey exponent: (keys at: 2) asInteger modulo: (keys at: 1) asInteger).
