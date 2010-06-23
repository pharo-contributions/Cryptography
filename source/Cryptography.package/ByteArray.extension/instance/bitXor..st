*cryptography-core
bitXor: aByteArray
	| answer |
	answer _ self copy.
	1 to: (self size min: aByteArray size) do: 
		[ :each | 
		answer 
			at: each 
			put: ((self at: each) bitXor: (aByteArray at: each)) ].
	^ answer