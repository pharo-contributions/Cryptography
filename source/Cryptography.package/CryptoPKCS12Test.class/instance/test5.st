testing
test5

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 3 
		fromPassword: 'smeg' 
		salt: #(61 131 192 228 84 106 193 64)
		iterations: 1
		size: 20) hex.
	self assert: key = '8D967D88F6CAA9D714800AB3D48051D63F73A312'
