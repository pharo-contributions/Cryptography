hashing
hashFinishedMsgsWithLabel: label

	| bytes seed hash |
	bytes := self securityParams messagesProcessedAsByteArray.
	seed := (MD5 hashMessage: bytes), (SHA1 hashMessage: bytes).
	hash := TLS10PseudoRandomFunction new
		hashFromSecret: self securityParams masterSecret
		label: label
		seed: seed
		size: 12.
	^ hash
