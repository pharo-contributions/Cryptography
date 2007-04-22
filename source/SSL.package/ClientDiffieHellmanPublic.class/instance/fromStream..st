converting
fromStream: stream

	self yClient: (stream next: (stream next: 2) asInteger).
