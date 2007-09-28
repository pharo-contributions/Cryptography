process
sendPasswordUserAuthRequest

	| requestMsg |
	requestMsg := SSHUserAuthRequestMessage new
		userName: self connection userName;
		serviceName: 'ssh-connection';
		methodName: 'password';
		subMsg: (SSHUserAuthPasswordRequestSubMessage new
			password: self connection password;
			yourself);
		yourself.
	self machine sendMsg: requestMsg.
