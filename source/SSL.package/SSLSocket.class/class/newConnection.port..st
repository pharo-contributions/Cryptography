instance creation
newConnection: host port: port

	| cap socket |
	cap := SSLConnectionProtocolCap newConnection: host port: port.
cap installMsgTracing.
	socket := self basicNewOnCap: cap.
	socket callServer.
	socket start.
	^ socket
