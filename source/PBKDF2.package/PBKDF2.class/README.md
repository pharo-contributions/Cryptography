PBKDF2 implementation based on RFC 2898 (http://tools.ietf.org/html/rfc2898).

Usage (Detailed Form):

derivedKey := PBKDF2 new
		hashFunction: SHA1;
		password: 'password';
		salt: 'salt';
		iterations: 4096;
		length: 256;
		deriveKey.
		
You can also use some convenience class methods. E.g.:
 derivedKey := PBKDF2 derivedKeySHA1Password: password salt: salt.

Defaults:
	prf: HMAC-SHA-1
	iterations: 1000
	length: 16 Bytes
	
