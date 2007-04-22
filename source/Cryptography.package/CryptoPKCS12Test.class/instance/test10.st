testing
test10

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 1
		fromPassword: 'queeg' 
		salt: #(22 130 192 252 91 63 126 197)
		iterations: 1000
		size: 24) hex.
	self assert: key = '483DD6E919D7DE2E8E648BA8F862F3FBFBDC2BCB2C02957F'
