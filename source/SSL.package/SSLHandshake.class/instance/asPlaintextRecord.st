converting
asPlaintextRecord

	| bytes |
	bytes := self asByteArray.
	^ SSLPlaintext new
		type: 22;
		length: bytes size;
		fragment: bytes;
		yourself
