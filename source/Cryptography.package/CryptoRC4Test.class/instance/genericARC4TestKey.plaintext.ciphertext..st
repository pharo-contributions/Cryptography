as yet unclassified
genericARC4TestKey: key plaintext: plaintext ciphertext: ciphertext
	| vector rc4 |
	vector _ plaintext copy.
	rc4 _ ARC4 new.
	rc4 key: key.
	vector := rc4 encrypt: vector.
	self assert: vector = ciphertext