process
send

	| msg |
	msg := SSHIdentificationMessage new
		identification: 'SSH-2.0-version', String lf;
		yourself.
	self securityCoord setupIdentification: msg.
	self sendMsg: msg.
