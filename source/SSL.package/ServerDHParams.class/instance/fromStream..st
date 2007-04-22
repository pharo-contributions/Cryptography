converting
fromStream: stream

	self p: (stream next: (stream next: 2) asInteger).
	self g: (stream next: (stream next: 2) asInteger).
	self yServer: (stream next: (stream next: 2) asInteger).
