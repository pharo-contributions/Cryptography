accessing
decryptBlock: aByteArray
	"One of the advantages of CTR mode is that the decrypt implementation is exactly like the encrypt."
	self encryptBlock: aByteArray