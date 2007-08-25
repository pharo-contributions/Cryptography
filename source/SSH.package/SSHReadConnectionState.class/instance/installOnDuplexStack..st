control
installOnDuplexStack: stack

	stack pushUp: self cipherState decryptor.
	stack pushUp: self macState macVerifier.
	stack pushUp: self compressionState decompressor.
	stack pushUp: self packagerState unpackager.
