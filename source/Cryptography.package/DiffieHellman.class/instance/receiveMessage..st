protocol
receiveMessage: anInteger
	sharedKey _ anInteger raisedTo: secret modulo: prime.
	^ sharedKey