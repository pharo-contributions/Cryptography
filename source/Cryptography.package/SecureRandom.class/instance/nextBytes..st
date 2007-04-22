accessing
nextBytes: byteLength
	^ (self nextBits: byteLength*8) asByteArray