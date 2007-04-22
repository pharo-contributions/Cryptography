converting
asPlaintextRecord

	| bytes |
	bytes := self asByteArray.
	^ SSLPlaintext new
		type: 21;
		length: bytes size;
		fragment: bytes;
		yourself
