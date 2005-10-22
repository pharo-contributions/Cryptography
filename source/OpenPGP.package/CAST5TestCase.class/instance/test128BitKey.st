running
test128BitKey
	| key plaintext ciphertext |
	key := 16r0123456712345678234567893456789A.
	plaintext := 16r0123456789ABCDEF.
	ciphertext := 16r238B4FE5847E44B2.
	self assert: ((CAST5 new setKey: key) encryptBlock: plaintext) = ciphertext.
	self assert: ((CAST5 new setKey: key) decryptBlock: ciphertext) = plaintext