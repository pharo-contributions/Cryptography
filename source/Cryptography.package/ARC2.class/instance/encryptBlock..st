encryption/decryption
encryptBlock: plainText
	| result |
	result := self encryptBlock: plainText key: self expandedKey.
	result withIndexDo: [:a :i |
		plainText at: i put: a
	].
	^plainText