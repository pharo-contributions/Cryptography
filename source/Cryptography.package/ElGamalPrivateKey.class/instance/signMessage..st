actions
signMessage: aByteArray
	| hm k kinv r s |
	hm _ (self hashFunction hashMessage: aByteArray) asInteger.

	[k _ SecureRandom picker nextInt: modulo - 2.
	(k gcd: modulo-1) = 1] whileFalse.

	r _ generator raisedTo: k modulo: modulo.
	kinv _ k inverseModulo: (modulo-1).
	s _ kinv * (hm - (secretExponent*r)) \\ (modulo-1).
	^ Array with: r with: s