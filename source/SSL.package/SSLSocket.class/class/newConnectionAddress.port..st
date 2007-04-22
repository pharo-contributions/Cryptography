instance creation
newConnectionAddress: addr port: port

	| cap socket |
	cap := SSLConnectionProtocolCap newConnectionAddress: addr port: port.
	socket := self basicNewOnCap: cap.
	socket callServer.
	socket start.
	^ socket
