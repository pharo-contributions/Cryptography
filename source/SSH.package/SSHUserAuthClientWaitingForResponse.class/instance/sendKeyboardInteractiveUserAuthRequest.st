process
sendKeyboardInteractiveUserAuthRequest

	| requestMsg |
	requestMsg := SSHUserAuthRequestMessage new
		userName: self connection userName;
		serviceName: 'ssh-connection';
		methodName: 'keyboard-interactive';
		subMsg: (SSHUserAuthKeyboardInteractiveRequestSubMessage new
			language: '';
			subMethods: '';
			yourself);
		yourself.
	self machine sendMsg: requestMsg.
