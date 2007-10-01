process
fromStream: stream

	super fromStream: stream.
	self recipientChannel: (stream next: 4) asInteger.
	self bytesToAdd: (stream next: 4) asInteger.
