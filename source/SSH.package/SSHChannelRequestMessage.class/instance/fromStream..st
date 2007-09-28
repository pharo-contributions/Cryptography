process
fromStream: stream

	super fromStream: stream.
	self recipientChannel: (stream next: 4) asInteger.
	self requestType: (self fromStringOnStream: stream).
	self wantReply: (stream next > 0).
