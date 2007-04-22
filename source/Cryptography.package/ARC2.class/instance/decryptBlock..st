encryption/decryption
decryptBlock: cipherText
	| result |
	result := self decryptBlock: cipherText key: self expandedKey.
	result withIndexDo: [:a :i |
		cipherText at: i put: a
	].
	^cipherText