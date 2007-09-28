process
fromStream: stream

	super fromStream: stream.
	self channelType: (self fromStringOnStream: stream).
	self senderChannel: (stream next: 4) asInteger.
	self initialWindowSize: (stream next: 4) asInteger.
	self maximumPacketSize: (stream next: 4) asInteger.
