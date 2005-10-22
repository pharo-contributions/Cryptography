running
test40BitKey
	| key plaintext ciphertext |
	key := 16r01234567120000000000000000000000.
	plaintext := 16r0123456789ABCDEF.
	ciphertext := 16r7AC816D16E9B302E.
	self assert: ((CAST5 new setKey: key) encryptBlock: plaintext) = ciphertext.
	self assert: ((CAST5 new setKey: key) decryptBlock: ciphertext) = plaintext