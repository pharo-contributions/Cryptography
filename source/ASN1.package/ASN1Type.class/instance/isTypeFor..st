testing
isTypeFor: anObject

	^((self asn1Tag bitXor: anObject asn1Tag) bitAnd: 2r00011111) isZero