process
fromStream: stream

	super fromStream: stream.
	self userName: (self fromStringOnStream: stream).
	self serviceName: (self fromStringOnStream: stream).
	self methodName: (self fromStringOnStream: stream).
