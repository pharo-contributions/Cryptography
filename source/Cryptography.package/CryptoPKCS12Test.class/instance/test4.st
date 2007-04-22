testing
test4

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 2 
		fromPassword: 'queeg' 
		salt: #(22 130 192 252 91 63 126 197)
		iterations: 1000
		size: 8) hex.
	self assert: key = '9D461D1B00355C50'
