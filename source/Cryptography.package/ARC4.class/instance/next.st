accessing
next
	| t |
	i _ i + 1 \\ 256.
	j _ j + (sbox at: i+1) \\ 256.
	sbox swap: i+1 with: j+1.
	t _ (sbox at: i+1) + (sbox at: j+1) \\ 256.
	^ sbox at: t+1