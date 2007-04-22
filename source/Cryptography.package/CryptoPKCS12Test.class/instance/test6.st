testing
test6

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 3 
		fromPassword: 'queeg' 
		salt: #(38 50 22 252 194 250 179 28)
		iterations: 1000
		size: 20) hex.
	self assert: key = '5EC4C7A80DF652294C3925B6489A7AB857C83476'
