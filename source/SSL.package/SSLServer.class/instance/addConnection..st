running
addConnection: conn

	conn when: #closed send: #removeConnection: to: self with: conn.
	self connections add: conn.
