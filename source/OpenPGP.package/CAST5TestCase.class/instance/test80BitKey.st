running
test80BitKey
	| key plaintext ciphertext |
	key := 16r01234567123456782345000000000000.
	plaintext := 16r0123456789ABCDEF.
	ciphertext := 16rEB6A711A2C02271B.
	self assert: ((CAST5 new setKey: key) encryptBlock: plaintext) = ciphertext.
	self assert: ((CAST5 new setKey: key) decryptBlock: ciphertext) = plaintext