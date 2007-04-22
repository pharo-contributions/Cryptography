secret
computeSecret

	| preSecret master |
	preSecret := self keyExchangeProcessor secret asByteArray.
	master := TLS10PseudoRandomFunction new
		hashFromSecret: preSecret
		label: 'master secret'
		seed: self securityParams clientRandom, self securityParams serverRandom
		size: 48.
	self securityParams masterSecret: master.
