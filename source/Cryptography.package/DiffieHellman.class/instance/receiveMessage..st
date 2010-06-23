protocol
receiveMessage: anInteger
	sharedKey := anInteger raisedTo: secret modulo: prime.
	^ sharedKey