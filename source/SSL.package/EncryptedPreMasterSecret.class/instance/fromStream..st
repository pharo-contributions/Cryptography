converting
fromStream: stream

	self preMasterSecret: (stream next: (stream next: 2) asInteger).
