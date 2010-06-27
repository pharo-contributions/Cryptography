instance creation
newConnection: host port: port

	| cap socket |
	cap := SSLConnectionProtocolCap newConnection: host port: port.
	socket := self basicNewOnCap: cap.
	socket callServer.
	socket start.
	^ socket
