process
fromStream: stream

	super fromStream: stream.
	self numResponses: (stream next: 4) asInteger.
	1 to: self numResponses do: [:index |
		self responses add: (self fromStringOnStream: stream)].
