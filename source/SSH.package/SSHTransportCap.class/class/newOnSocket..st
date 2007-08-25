instance creation
newOnSocket: socket

	| bottom |
	bottom := SocketStreamEndpointBottom newOnSocket: socket.
	^ self newOnStack: bottom duplexStack.
