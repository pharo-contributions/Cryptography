testing
test8

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 1
		fromPassword: 'smeg' 
		salt: #(100 43 153 171 68 251 75 31)
		iterations: 1
		size: 24) hex.
	self assert: key = 'F3A95FEC48D7711E985CFE67908C5AB79FA3D7C5CAA5D966'
