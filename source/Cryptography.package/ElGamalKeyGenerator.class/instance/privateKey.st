accessing
privateKey
	^ ElGamalPrivateKey 
		setModulo: p 
		generator: alpha
		secretExponent: a
