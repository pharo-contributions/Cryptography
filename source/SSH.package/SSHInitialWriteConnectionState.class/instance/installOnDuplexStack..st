control
installOnDuplexStack: stack

	stack pushDown: self cipherState encryptor.
	stack pushDown: self packagerState packager.
