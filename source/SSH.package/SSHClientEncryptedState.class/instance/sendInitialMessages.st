process
sendInitialMessages

	| requestMsg |
	requestMsg := SSHServiceRequestMessage new
		serviceName: 'ssh-userauth';
		yourself.
	self machine sendMsg: requestMsg.
