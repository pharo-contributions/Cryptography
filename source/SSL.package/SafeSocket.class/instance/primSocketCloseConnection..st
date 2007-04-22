primitives
primSocketCloseConnection: socketID
	"Close the connection on the given port. The remote end is informed that this end has closed and will do no further sends. This is an asynchronous call; query the socket status to discover if and when the connection is actually closed.  Overriden to avoid primitive fail error in superclass."

	<primitive: 'primitiveSocketCloseConnection' module: 'SocketPlugin'>