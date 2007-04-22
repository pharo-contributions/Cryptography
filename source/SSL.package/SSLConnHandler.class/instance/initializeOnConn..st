initialize-release
initializeOnConn: aConn

	conn := aConn.
	conn when: #closed send: #stop to: self.
	self start.