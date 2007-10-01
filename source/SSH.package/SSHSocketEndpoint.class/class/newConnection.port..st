instance creation
newConnection: hostName port: port

	| cap conn |
	cap := SSHTransportCap newConnection: hostName port: port.
	conn := self new.
	conn connPipe: cap.
	cap connection: conn.
	^ conn
