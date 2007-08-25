instance creation
basicNewOnPipe: pipe

	| conn |
	conn := self new.
	conn connPipe: pipe.
	pipe connection: conn.
	^ conn
