accessing
decryptor

	^ SSLDecryptor new
		cipherState: self;
		yourself