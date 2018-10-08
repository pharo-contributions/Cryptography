as yet unclassified
assertDerivedKey: pbkdf2 iterations: iterations equals: aString
	| expected |
	expected := ByteArray fromHexString: aString.
	self
		assert:
			(pbkdf2
				iterations: iterations;
				length: expected size;
				deriveKey)
		equals: expected