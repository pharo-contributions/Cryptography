secret
generateKeyBlock

	| totalLength keyBlock |
	totalLength := (2 * self securityParams hashSize) 
		+ (2 * self securityParams keyMaterialLength) 
		+ (2 * self securityParams ivSize).

	keyBlock := SSL30PseudoRandomFunction new
		keyBlockFromMasterSecret: self securityParams masterSecret 
		clientRandom: self securityParams clientRandom 
		serverRandom: self securityParams serverRandom 
		size: totalLength.
	^ keyBlock
