process
processServiceAccept: msg

	| pipe upConn |
	pipe := SSHUserAuthPipe new.
	upConn := self connection connection.
	self connection connection: pipe.
	pipe transportCap: self connection.
	pipe socket: upConn.
	upConn connPipe: pipe.
	pipe makeClient.
	^ false