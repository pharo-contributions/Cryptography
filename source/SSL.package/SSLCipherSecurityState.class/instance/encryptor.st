accessing
encryptor

	^ SSLEncryptor new
		cipherState: self;
		yourself