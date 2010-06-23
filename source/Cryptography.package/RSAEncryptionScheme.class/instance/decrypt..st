encryption scheme
decrypt: aByteArray
	| m |
	m := privateKey crypt: aByteArray asInteger.
	^ self decode: m asByteArray parameter: encodingParameter.
	

	