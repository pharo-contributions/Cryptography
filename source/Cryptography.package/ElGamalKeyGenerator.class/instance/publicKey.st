accessing
publicKey
	^ ElGamalPublicKey 
		setModulo: p 
		generator: alpha 
		generatorRaisedToA: (alpha raisedTo: a modulo: p)
