process
processChannelRequest: msg

	msg wantReply ifTrue: [self send: SSHChannelSuccessMessage new].
