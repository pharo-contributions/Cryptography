process
send

	| msg |
	msg := SSHNewKeysMessage new.
	self sendMsg: msg.
	self connection installWriteConnectionState.
