instance creation
newOnConn: conn

	^ self new
		initializeOnConn: conn.
