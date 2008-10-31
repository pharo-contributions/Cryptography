converting
fromStream: stream

	self certificateTypes: (stream next: stream next).
	self certificateAuthorities: (stream next: (stream next: 2) asInteger).
