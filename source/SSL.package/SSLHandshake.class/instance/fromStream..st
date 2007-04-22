converting
fromStream: stream

	self msgType: stream next.
	self length: (stream next: 3) asInteger.
	self body: (stream next: self length).
