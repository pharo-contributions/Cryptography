examples
newConnectionAddress: addr port: port

	| s |
	Socket initializeNetwork.
	(s := Socket new)
		connectTo: addr 
		port: port 
		waitForConnectionFor: 5.
	^self new socket: s