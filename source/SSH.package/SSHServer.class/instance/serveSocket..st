accessing
serveSocket: socket

	| conn |
	conn := SSHSocket newOnSocket: socket publicKey: self publicKey privateKey: self privateKey.
	self addConnection: conn.
