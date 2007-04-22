secret
generateKeyBlock

	| totalLength keyBlock |
	totalLength := (2 * self securityParams hashSize) 
		+ (2 * self securityParams keyMaterialLength) 
		+ (2 * self securityParams ivSize).
	keyBlock := TLS10PseudoRandomFunction new
		hashFromSecret: self securityParams masterSecret
		label: 'key expansion'
		seed: self securityParams serverRandom, self securityParams clientRandom
		size: totalLength.
	^ keyBlock
