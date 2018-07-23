testing
test3

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 2 
		fromPassword: 'queeg' 
		salt: #(5 222 201 89 172 255 114 247)
		iterations: 1000
		size: 8) hex.
	self assert: key = '11dedad7758d4860'
