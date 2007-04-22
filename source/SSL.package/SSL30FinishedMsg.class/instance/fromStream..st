converting
fromStream: stream

	self md5Hash: (stream next: 16).
	self shaHash: (stream next: 20).
