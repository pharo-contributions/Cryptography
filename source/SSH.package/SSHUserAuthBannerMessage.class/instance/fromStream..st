process
fromStream: stream

	super fromStream: stream.
	self message: (self fromStringOnStream: stream).
	self language: (self fromStringOnStream: stream).
