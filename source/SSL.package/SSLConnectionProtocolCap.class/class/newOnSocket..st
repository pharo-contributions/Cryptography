instance creation
newOnSocket: socket

	| bottom |
	bottom := SocketEndpointBottom newOnSocket: socket.
	^ self newOnStack: bottom duplexStack.

