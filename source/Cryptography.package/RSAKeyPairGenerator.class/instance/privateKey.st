accessing
privateKey
	^ RSAKey exponent: self d modulo: self p * self q