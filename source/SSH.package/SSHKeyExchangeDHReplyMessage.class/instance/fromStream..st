process
fromStream: stream

	super fromStream: stream.
	self publicHostKeyAndCertificates: (self fromStringOnStream: stream).
	self f: (self fromMpintOnStream: stream).
	self signature: (self fromStringOnStream: stream).
