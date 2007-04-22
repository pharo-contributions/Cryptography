primitives
primSocketReceiveDataAvailable: socketID
	"Return true if data may be available for reading from the current socket.  Overridden to avoid primitive failure when the socket is closed asynchronously (or left open across snapshot and quit)."

	<primitive: 'primitiveSocketReceiveDataAvailable' module: 'SocketPlugin'>
	^false