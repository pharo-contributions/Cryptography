instance creation
derivedKeySHA1Password: password salt: salt
	^ PBKDF2 new
		password: password;
		salt: salt;
		deriveKey