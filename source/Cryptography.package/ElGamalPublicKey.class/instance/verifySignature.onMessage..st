actions
verifySignature: anArray onMessage: aByteArray
	| hm r s v1 v2 |
	hm _ (self hashFunction hashMessage: aByteArray) asInteger.
	r _ anArray at: 1.
	s _ anArray at: 2.
	(r between: 1 and: modulo-1) ifFalse: [^ false]. "signature rejected"

	v1 _ generatorRaisedToA raisedTo: r modulo: modulo.
	v1 _ v1 * (r raisedTo: s modulo: modulo) \\ modulo.
	v2 _ generator raisedTo: hm modulo: modulo.
	^ v1 = v2  "signature accepted if v1=v2"