accessing
encryptBlock: plainText
	des1 encryptBlock: plainText.
	des2 decryptBlock: plainText.
	des3 encryptBlock: plainText