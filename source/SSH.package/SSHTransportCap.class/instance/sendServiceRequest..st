process
sendServiceRequest: serviceName

	| requestMsg |
	requestMsg := SSHServiceRequestMessage new
		serviceName: serviceName;
		yourself.
	self handshakeStateMachine sendMsg: requestMsg.
