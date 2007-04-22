instance creation
newConnection: host port: port version: version

	| socket cap |
	cap := SSLConnectionProtocolCap newConnection: host port: port.
	socket := self basicNewOnCap: cap.
	socket setVersion: version.
	socket callServer.
	socket start.
	^ socket
