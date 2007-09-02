instance creation
newConnection: host port: port

	| bottom |
	bottom := SocketStreamEndpointBottom newConnection: host port: port.
	^ self newOnStack: bottom duplexStack
