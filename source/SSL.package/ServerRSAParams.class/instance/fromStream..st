converting
fromStream: stream

	self modulus: (stream next: (stream next: 2) asInteger).
	self exponent: (stream next: (stream next: 2) asInteger).
