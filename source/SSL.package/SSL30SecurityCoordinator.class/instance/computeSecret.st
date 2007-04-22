secret
computeSecret

	| preSecret master |
	preSecret := self keyExchangeProcessor secret asByteArray.
	master := SSL30PseudoRandomFunction new
		masterSecretFromPreMasterSecret: preSecret 
		clientRandom: self securityParams clientRandom 
		serverRandom: self securityParams serverRandom 
		size: 48.
	self securityParams masterSecret: master.
