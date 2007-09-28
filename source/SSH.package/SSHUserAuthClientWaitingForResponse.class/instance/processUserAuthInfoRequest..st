process
processUserAuthInfoRequest: msg

	| newMsg |
	newMsg := SSHUserAuthInfoResponseMessage new.
	newMsg numResponses: 1.
	newMsg responses add: self connection password.
	self machine sendMsg: newMsg.
	^ false