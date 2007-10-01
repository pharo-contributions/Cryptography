conversions
fromStream: stream

	self termEnvironmentVariable: (self fromStringOnStream: stream).
	self widthChars: (stream next: 4) asInteger.
	self heightRows: (stream next: 4) asInteger.
	self widthPixels: (stream next: 4) asInteger.
	self heightPixels: (stream next: 4) asInteger.
	self terminalModes: (self fromStringOnStream: stream).
