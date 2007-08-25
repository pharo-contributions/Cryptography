instance creation
newOnConnection: conn

	^ self new
		connection: conn;
		yourself