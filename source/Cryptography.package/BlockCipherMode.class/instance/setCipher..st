initialization-release
setCipher: aCipher 
	cipher := aCipher.
	self initialVector: (ByteArray new: self blockSize)