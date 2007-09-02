process
sendInitialMessages

	self connection sendServiceRequest: 'ssh-userauth'.
