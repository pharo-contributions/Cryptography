process
fromStream: stream

	super fromStream: stream.
	self name: (self fromStringOnStream: stream).
	self instruction: (self fromStringOnStream: stream).
	self language: (self fromStringOnStream: stream).
	self numPrompts: (stream next: 4) asInteger.
	1 to: self numPrompts do: [:index |
		self prompts add: (self fromStringOnStream: stream).
		self echos add: (stream next > 0)].
