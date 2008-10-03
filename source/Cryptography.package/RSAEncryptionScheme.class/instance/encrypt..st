encryption scheme
encrypt: aByteArray
	| k em c |
	k := publicKey bits // 8.
	em := self encode: aByteArray parameter: encodingParameter length: k-1.
	c := publicKey crypt: em asInteger.
	^ c asByteArray