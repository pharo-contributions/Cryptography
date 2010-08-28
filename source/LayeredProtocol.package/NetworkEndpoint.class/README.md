I am an endpoint for network communication.  I am also a ProtocolLayer and I therefore expect to be inserted as the lowest element in a LayeredProtocol stack.

Structure:

	socket			(Socket)	-- the socket on which I communicate.
