instance creation
newOnSocket: socket

	| cap sslSocket |
	cap := SSLConnectionProtocolCap newOnSocket: socket.
	sslSocket := self basicNewOnCap: cap.
	sslSocket start.
	^ sslSocket
