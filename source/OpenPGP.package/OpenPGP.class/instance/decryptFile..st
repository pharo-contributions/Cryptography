decryption
decryptFile: aFilename
	| str |
	str := FileStream readOnlyFileNamed: aFilename.
	[self handleStream: str visitor: OpenPGPDecryption new] ensure: [str close]