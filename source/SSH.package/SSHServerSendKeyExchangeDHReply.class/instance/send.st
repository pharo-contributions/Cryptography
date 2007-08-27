process
send

	| msg |
	msg := SSHKeyExchangeDHReplyMessage new.
	self securityCoord setupServerDHReplyMsg: msg.
	self sendMsg: msg.
