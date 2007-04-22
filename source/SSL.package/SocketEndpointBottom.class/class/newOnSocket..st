instance creation
newOnSocket: socket

	| socketCap |
	socketCap := self new
		socket: socket;
		yourself.
	DuplexProtocolStack new capBottomOfStack: socketCap.
	^ socketCap