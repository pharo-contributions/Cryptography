encryption/decryption
encryptBlock: anInteger
	^des3 encryptBlock: (des2 decryptBlock: (des1 encryptBlock: anInteger))