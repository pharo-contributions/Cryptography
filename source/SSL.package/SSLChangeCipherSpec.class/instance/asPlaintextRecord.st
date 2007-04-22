converting
asPlaintextRecord

	| bytes |
	bytes := self asByteArray.
	^ SSLPlaintext new
		type: 20;
		length: bytes size;
		fragment: bytes;
		yourself
