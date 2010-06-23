protocol
sendMessage
	secret := SecureRandom picker nextInt: prime-2.
	^ generator raisedTo: secret modulo: prime