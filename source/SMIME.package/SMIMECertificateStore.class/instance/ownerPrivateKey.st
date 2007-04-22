accessing
ownerPrivateKey

	^ (self storeData ownerPrivateKey decryptWithPassword: self password) asPrivateKey.
