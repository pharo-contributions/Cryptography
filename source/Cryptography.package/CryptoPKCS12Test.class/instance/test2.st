testing
test2

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 2 
		fromPassword: 'smeg' 
		salt: #(100 43 153 171 68 251 75 31)
		iterations: 1
		size: 8) hex.
	self assert: key = 'C0A38D64A79BEA1D'
