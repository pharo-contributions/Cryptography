encryption scheme
encrypt: aByteArray
	| k em c |
	k _ publicKey bits // 8.
	em _ self encode: aByteArray parameter: encodingParameter length: k-1.
	c _ publicKey crypt: em asInteger.
	^ c asByteArray