accessing
encryptBlock: aByteArray 
	cipher encryptBlock: vector.
	1 
		to: aByteArray size
		do: 
			[ : i | 
			aByteArray 
				at: i
				put: ((vector at: i) bitXor: (aByteArray at: i)) ].
	self vector: aByteArray copy