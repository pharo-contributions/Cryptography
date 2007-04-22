initialize-release
validatePFXMAC

	| data salt iterations macValue calculatedMacValue hashMaterial hmac |
	data := self pfx authSafe content.
	salt := self pfx macData macSalt.
	iterations := self pfx macData iterations.
	macValue := self pfx macData mac digest.
	hashMaterial := Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 3
		fromPassword: self password
		salt: salt
		iterations: iterations
		size: 20.
	hmac := SHA1 new hmac.
	hmac key: hashMaterial.
	calculatedMacValue := hmac digestMessage: data.
	calculatedMacValue = macValue
		ifFalse: [self error: 'invalid MAC'].
	