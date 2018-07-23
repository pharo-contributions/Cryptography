tests - base
testNull

	| bytes obj newBytes |
	bytes := #(5 0).
	obj := ASN1Stream decodeBytes: bytes.
	self assert: obj isNil.
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).
