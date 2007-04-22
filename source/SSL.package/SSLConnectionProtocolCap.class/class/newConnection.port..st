instance creation
newConnection: host port: port

	| bottom |
	bottom := SocketEndpointBottom newConnection: host port: port.
	^ self newOnStack: bottom duplexStack.
