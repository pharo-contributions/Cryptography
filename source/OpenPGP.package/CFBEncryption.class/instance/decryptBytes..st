encrypting
decryptBytes: aByteArray
	^aByteArray collect: [:i | self decrypt: i]