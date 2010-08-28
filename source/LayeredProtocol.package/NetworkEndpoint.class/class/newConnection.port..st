examples
newConnection: host port: port

	| s addr |
	Socket initializeNetwork.
	(addr := NetNameResolver addressForName: host) isNil
		ifTrue: [^nil].
	(s := Socket new)
		connectTo: addr port: port waitForConnectionFor: 5.
	s isWaitingForConnection
		ifTrue: [s destroy. ^nil].
	^self new socket: s