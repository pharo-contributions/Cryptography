private
highestNonce
	^ (1 bitShift: self nonceBits) - 1