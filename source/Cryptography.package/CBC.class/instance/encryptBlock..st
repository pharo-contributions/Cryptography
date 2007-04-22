accessing
encryptBlock: aByteArray 
	1 
		to: aByteArray size
		do: 
			[ : i | 
			aByteArray 
				at: i
				put: ((vector at: i) bitXor: (aByteArray at: i)) ].
	cipher encryptBlock: aByteArray.
	self vector: aByteArray copy