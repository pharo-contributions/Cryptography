process
fromStream: stream

	super fromStream: stream.
	self authentications: (self fromNameListOnStream: stream).
	self partialSuccess: (stream next > 0).
