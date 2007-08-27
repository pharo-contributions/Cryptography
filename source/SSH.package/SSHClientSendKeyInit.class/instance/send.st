process
send

	| msg |
	msg := SSHKeyInitMessage new.
	self securityCoord setupKeyInit: msg.
	self sendMsg: msg.
