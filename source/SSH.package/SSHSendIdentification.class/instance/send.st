process
send

	| msg |
	msg := SSHIdentificationMessage new
		identification: 'SSH-2.0-version';
		yourself.
	self securityCoord setupIdentification: msg.
	self sendMsg: msg.
