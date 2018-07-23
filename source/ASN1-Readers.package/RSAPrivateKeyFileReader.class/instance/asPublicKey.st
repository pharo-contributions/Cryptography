converting
asPublicKey

	| asn1 |
	asn1 := self asASN1Value.
	^ RSAPublicKey exponent: (asn1 at: 3) modulo: (asn1 at: 2)