accessing
nonce
	^ vector
		uint: self nonceBits
		at: self positionOfNonce