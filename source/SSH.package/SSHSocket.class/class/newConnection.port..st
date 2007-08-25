instance creation
newConnection: host port: port

	| cap socket |
	cap := SSHTransportCap newConnection: host port: port.
	socket := self basicNewOnPipe: cap.
	socket callServer.
	socket start.
	^ socket
