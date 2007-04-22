testing
matchesTag: anInteger

	^((self asn1Tag bitXor: anInteger) bitAnd: 2r00011111) isZero