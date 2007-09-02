instance creation
newOnSocket: socket publicKey: publicKey privateKey: privateKey

	| cap sshSocket |
	cap := SSHTransportCap newOnSocket: socket.
	sshSocket := self basicNewOnPipe: cap.
	sshSocket publicKey: publicKey privateKey: privateKey.
	sshSocket answerClient.
	sshSocket start.
	^ sshSocket
