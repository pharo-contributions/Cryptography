instance creation
newOnSocket: socket

	| cap sshSocket |
	cap := SSHTransportCap newOnSocket: socket.
	sshSocket := self basicNewOnPipe: cap.
	sshSocket answerClient.
	sshSocket start.
	^ sshSocket
