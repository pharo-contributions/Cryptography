instance creation
newOnConnection: conn

	^ self new
		initializeOnConnection: conn;
		yourself.
