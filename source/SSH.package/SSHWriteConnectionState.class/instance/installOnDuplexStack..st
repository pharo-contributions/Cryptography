control
installOnDuplexStack: stack

	stack pushDown: self cipherState encryptor.
	stack pushDown: self macState macGenerator.
	stack pushDown: self compressionState compressor.
	stack pushDown: self packagerState packager.
