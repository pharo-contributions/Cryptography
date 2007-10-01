process
sendPrompt: prompt

	| msg |
	msg := SSHChannelDataMessage new
		data: prompt asByteArray;
		yourself.
	self machine receiveMsg: msg.

