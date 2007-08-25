control
installOnDuplexStack: stack

	stack pushUp: self cipherState decryptor.
	stack pushUp: self packagerState unpackager.
