instance creation
newOnSocket: socket

	| cap sslSocket |
	cap := SSHTransportCap newOnSocket: socket.
	sslSocket := self basicNewOnPipe: cap.
	sslSocket start.
	^ sslSocket
