accessing
next
	| t |
	i := i + 1 \\ 256.
	j := j + (sbox at: i+1) \\ 256.
	sbox swap: i+1 with: j+1.
	t := (sbox at: i+1) + (sbox at: j+1) \\ 256.
	^ sbox at: t+1