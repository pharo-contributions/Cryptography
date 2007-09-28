process
sendInitialMessages

	| requestMsg |
	requestMsg := SSHUserAuthRequestMessage new
		userName: self connection userName;
		serviceName: 'ssh-connection';
		methodName: 'none';
		yourself.
	self machine sendMsg: requestMsg.
