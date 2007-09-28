process
processChannelOpen: msg

	| newMsg |
	newMsg := SSHChannelOpenConfirmationMessage new
		recipientChannel: msg senderChannel;
		senderChannel: msg senderChannel;
		initialWindowSize: msg initialWindowSize;
		maximumPacketSize: msg maximumPacketSize;
		yourself.
	self send: newMsg.
