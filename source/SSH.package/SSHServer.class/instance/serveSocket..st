accessing
serveSocket: socket

	| conn |
	conn := SSHSocket newOnSocket: socket.
	self addConnection: conn.
