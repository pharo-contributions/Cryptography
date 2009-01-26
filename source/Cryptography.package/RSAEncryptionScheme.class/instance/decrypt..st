encryption scheme
decrypt: aByteArray
	| m |
	m _ privateKey crypt: aByteArray asInteger.
	^ self decode: m asByteArray parameter: encodingParameter.
	

	