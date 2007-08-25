instance creation
newConnection: host port: port

	| addr |
	Socket initializeNetwork.
	(addr := NetNameResolver addressForName: host) isNil
		ifTrue: [^ nil].
	^ self newConnectionAddress: addr port: port
