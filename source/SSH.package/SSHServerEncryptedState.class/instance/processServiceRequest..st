process
processServiceRequest: msg

	| acceptMsg |
	acceptMsg := SSHServiceAcceptMessage new
		serviceName: msg serviceName;
		yourself.
	self machine sendMsg: acceptMsg.
	^ false