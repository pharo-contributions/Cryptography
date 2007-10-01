process
processChannelClose: msg

	self send: SSHChannelCloseMessage new.
	self close.