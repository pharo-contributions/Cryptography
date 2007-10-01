as yet unclassified
switchToConnectionPipe

	| pipe cap socket |
	pipe := SSHConnectionPipe new.
	cap := self connection transportCap.
	socket := self connection socket.
	cap connection: pipe.
	pipe transportCap: cap.
	pipe socket: socket.
	socket connPipe: pipe.
	pipe makeClient.
