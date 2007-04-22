protocol
sendMessage
	secret _ SecureRandom picker nextInt: prime-2.
	^ generator raisedTo: secret modulo: prime