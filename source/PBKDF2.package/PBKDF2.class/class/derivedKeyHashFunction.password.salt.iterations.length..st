instance creation
derivedKeyHashFunction: hashClass password: password salt: salt iterations: iterations length: length
	^ PBKDF2 new
		hashFunction: hashClass;
		password: password;
		salt: salt;
		iterations: iterations;
		length: length;
		deriveKey