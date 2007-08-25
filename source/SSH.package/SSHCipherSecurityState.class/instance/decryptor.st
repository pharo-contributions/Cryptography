converting
decryptor

	^ SSHDecryptor new
		cipherState: self;
		yourself