instance creation
newConnectionAddress: addr port: port

	| s |
	Socket initializeNetwork.
	(s := Socket new)
		connectNonBlockingTo: addr port: port;
		waitForConnectionFor: Socket standardTimeout ifTimedOut: [].
	s isWaitingForConnection
		ifTrue: [s destroy. ^ nil].
	^ self newOnSocket: s.
