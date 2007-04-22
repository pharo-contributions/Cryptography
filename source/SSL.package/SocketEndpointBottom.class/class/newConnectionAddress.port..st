instance creation
newConnectionAddress: addr port: port

	| s |
	Socket initializeNetwork.
	(s := SafeSocket new)
		connectTo: addr port: port;
		waitForConnectionFor: Socket standardTimeout ifTimedOut: [].
	s isWaitingForConnection
		ifTrue: [s destroy. ^ nil].
	s name: addr asString.
	^ self newOnSocket: s.
