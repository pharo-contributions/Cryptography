tests - base
testEqualsChecksType

	self deny: (ASN1ObjectId fromString: '1.3.6.1.5.5.7.8.5') = Object new
