process
fromStream: stream

	super fromStream: stream.
	self reasonCode: (stream next: 4) asInteger.
	self description: (self fromStringOnStream: stream).
	self language: (self fromStringOnStream: stream).