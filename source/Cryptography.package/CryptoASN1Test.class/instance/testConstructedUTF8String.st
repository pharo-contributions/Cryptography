tests - BER
testConstructedUTF8String

	| bytes obj testObj |
	bytes := #(44 15 12 5 84 101 115 116 32 12 6 85 115 101 114 32 49).
	testObj := 'Test User 1'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
