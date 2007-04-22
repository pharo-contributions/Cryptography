initialization-release
setCipher: aCipher 
	cipher _ aCipher.
	self initialVector: (ByteArray new: self blockSize)