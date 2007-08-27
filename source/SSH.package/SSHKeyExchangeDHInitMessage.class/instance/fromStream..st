process
fromStream: stream

	super fromStream: stream.
	self e: (self fromMpintOnStream: stream).
