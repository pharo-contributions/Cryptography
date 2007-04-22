instance creation
newConnectionAddress: addr port: port

	| bottom |
	bottom := SocketEndpointBottom newConnectionAddress: addr port: port.
	^ self newOnStack: bottom duplexStack.
