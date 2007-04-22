converting
asHandshake

	| bytes |
	bytes := self asByteArray.
	^ SSLHandshake new
		body: bytes;
		length: bytes size;
		msgType: self type;
		yourself.
