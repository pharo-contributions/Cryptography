converting
asPrivateKey

	| asn1 |
	asn1 := self asASN1Value.
	^ DSAPrivateKey p: (asn1 at: 2) q: (asn1 at: 3) g: (asn1 at: 4) x: (asn1 at: 6).
