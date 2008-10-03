testing
genericARC2TestKey: key effectiveKeyLength: aLength plaintext: plainText ciphertext: ciphertext
	| vector rc2 |
	vector := plainText copy.
	rc2 := ARC2 key: key effectiveKeyLength: aLength.
	rc2 encryptBlock: vector.
	self assert: vector = ciphertext.
	
	rc2 decryptBlock: vector.
	self assert: vector = plainText.
	rc2 destroy.