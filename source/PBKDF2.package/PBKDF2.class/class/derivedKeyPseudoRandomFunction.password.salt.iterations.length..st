instance creation
derivedKeyPseudoRandomFunction: prf password: password salt: salt iterations: iterations length: length
	^ PBKDF2 new
		prf: prf;
		password: password;
		salt: salt;
		iterations: iterations;
		length: length;
		deriveKey