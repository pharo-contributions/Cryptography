instance creation
derivedKeyHashFunction: hashClass password: password salt: salt
	^ PBKDF2 new
		hashFunction: hashClass;
		password: password;
		salt: salt;
		deriveKey