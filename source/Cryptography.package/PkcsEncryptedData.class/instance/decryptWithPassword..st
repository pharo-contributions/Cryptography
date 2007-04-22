decrypting
decryptWithPassword: password

	^ self encryptedContentInfo decryptWithPassword: password.
