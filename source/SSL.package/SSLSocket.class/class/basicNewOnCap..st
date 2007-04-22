instance creation
basicNewOnCap: cap

	| conn |
	conn := self new.
	conn protocolCap: cap.
	cap connection: conn.
	^ conn
