testing
test9

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 1
		fromPassword: 'queeg' 
		salt: #(5 222 201 89 172 255 114 247)
		iterations: 1000
		size: 24) hex.
	self assert: key = 'ED2034E36328830FF09DF1E1A07DD357185DAC0D4F9EB3D4'
