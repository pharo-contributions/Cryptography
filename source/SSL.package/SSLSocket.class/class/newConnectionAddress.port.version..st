instance creation
newConnectionAddress: addr port: port version: version

	| cap socket |
	cap := SSLConnectionProtocolCap newConnectionAddress: addr port: port.
	socket := self basicNewOnCap: cap.
	socket setVersion: version.
	socket callServer.
	socket start.
	^ socket
