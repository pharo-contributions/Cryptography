testing
test7

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 1
		fromPassword: 'smeg' 
		salt: #(10 88 207 100 83 13 130 63)
		iterations: 1
		size: 24) hex.
	self assert: key = '8AAAE6297B6CB04642AB5B077851284EB7128F1A2A7FBCA3'
