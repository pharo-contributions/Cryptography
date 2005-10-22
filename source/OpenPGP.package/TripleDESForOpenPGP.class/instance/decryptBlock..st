encryption/decryption
decryptBlock: anInteger
	^des1 decryptBlock: (des2 encryptBlock: (des3 decryptBlock: anInteger))