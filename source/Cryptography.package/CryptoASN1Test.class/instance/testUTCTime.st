tests - base
testUTCTime

	| bytes obj newBytes testObj |
	bytes := #(23 13 48 55 48 51 50 50 49 53 53 56 49 55 90).
	obj := ASN1Stream decodeBytes: bytes.
	testObj := DateAndTime fromString: '2007-03-22T15:58:17+00:00'.	
	self assert: obj rounded equals: testObj rounded.
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).
