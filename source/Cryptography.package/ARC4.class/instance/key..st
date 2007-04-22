accessing
key: aByteArray
	| k other |
	sbox _ (0 to: 255) asByteArray.
	k _ (0 to: 255) collect: [ :each | aByteArray at: each \\ aByteArray size + 1].
	other _ 0.
	1 to: 256 do: [ :each |
		other _ other + (sbox at: each) + (k at: each) \\ 256.
		sbox swap: each with: other+1].
	i _ j _ 0