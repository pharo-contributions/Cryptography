tests - base
testBoolean

	| bytes obj newBytes testObj |
	bytes := #(1 1 255).
	testObj := true.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).
