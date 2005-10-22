encrypting
encryptBytes: aByteArray
	^aByteArray collect: [:i | self encrypt: i]