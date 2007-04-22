accessing
decryptBlock: aByteArray
	"One of the nice attributes of OFB is there is no difference between the encrypt and decrypt implementations."
	^ self encryptBlock: aByteArray