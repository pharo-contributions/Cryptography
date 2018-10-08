tests - base
testByteArray

	| bytes obj newBytes testObj |
	bytes := #(4 5 3 21 55 43 76).
	testObj := #(3 21 55 43 76) asByteArray.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).
