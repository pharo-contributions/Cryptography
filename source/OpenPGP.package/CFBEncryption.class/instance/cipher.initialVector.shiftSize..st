initialize-release
cipher: aBlockCipher initialVector: aByteArray shiftSize: anInteger
	cipher := aBlockCipher.
	iv := aByteArray copy.
	shiftData := ByteArray new: anInteger.
	shiftIndex := 0