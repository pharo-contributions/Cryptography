instance creation
newOnSocket: socket

	| socketCap |
	socketCap := self new
		socketStream: (SocketStream on: socket);
		yourself.
	DuplexProtocolStack new capBottomOfStack: socketCap.
	^ socketCap