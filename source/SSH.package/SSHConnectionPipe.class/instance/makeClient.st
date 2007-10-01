protocol
makeClient

	self send: (SSHChannelOpenMessage new
		channelType: 'session';
		senderChannel: 0;
		initialWindowSize: 65536;
		maximumPacketSize: 16384;
		yourself).
	self send: (SSHChannelRequestMessage new
		recipientChannel: 0;
		requestType: 'pty-req';
		wantReply: false;
		subMsg: (SSHChannelRequestPtySubMessage new
			termEnvironmentVariable: 'xterm';
			widthChars: 124;
			heightRows: 29;
			widthPixels: 744;
			heightPixels: 406;
			terminalModes: '';
			yourself);
		yourself).
	self send: (SSHChannelRequestMessage new
		recipientChannel: 0;
		requestType: 'shell';
		wantReply: false;
		yourself).
