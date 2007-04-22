accessing
nonce: anInteger
	vector
		uint: self nonceBits
		at: self positionOfNonce
		put: anInteger.
	self counter: 0