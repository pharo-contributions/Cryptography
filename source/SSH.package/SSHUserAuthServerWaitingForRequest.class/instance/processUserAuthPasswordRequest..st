as yet unclassified
processUserAuthPasswordRequest: msg

	| newMsg |
	newMsg := SSHUserAuthSuccessMessage new.
	self machine sendMsg: newMsg.
	self switchToConnectionPipe.
	^ false