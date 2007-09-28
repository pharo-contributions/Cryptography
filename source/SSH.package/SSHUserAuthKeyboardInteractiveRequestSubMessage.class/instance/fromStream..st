conversions
fromStream: stream

	self language: (self fromStringOnStream: stream).
	self subMethods: (self fromStringOnStream: stream).

