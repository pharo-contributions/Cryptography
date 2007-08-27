process
send

	| msg |
	msg := SSHKeyExchangeDHInitMessage new.
	self securityCoord setupClientDHInitMsg: msg.
self halt.
	self sendMsg: msg.
