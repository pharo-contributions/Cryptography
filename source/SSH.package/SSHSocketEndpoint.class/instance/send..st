process
send: data

	| msg |
	msg := SSHChannelDataMessage new
		data: data;
		yourself.
	self connPipe sendDataMsg: msg.
