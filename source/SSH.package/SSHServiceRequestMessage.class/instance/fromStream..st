process
fromStream: stream

	super fromStream: stream.
	self serviceName: (self fromStringOnStream: stream).
