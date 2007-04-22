instance creation
newConnection: host port: port version: version suite: suite

	| socket cap |
	cap := SSLConnectionProtocolCap newConnection: host port: port.
	socket := self basicNewOnCap: cap.
	socket setVersion: version.
	socket callServerWithSuite: suite.
	socket start.
	^ socket
