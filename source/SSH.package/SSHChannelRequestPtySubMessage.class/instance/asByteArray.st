conversions
asByteArray

	^ (self stringOn: self termEnvironmentVariable),
		(self widthChars asByteArrayOfSize: 4),
		(self heightRows asByteArrayOfSize: 4),
		(self widthPixels asByteArrayOfSize: 4),
		(self heightPixels asByteArrayOfSize: 4),
		(self stringOn: self terminalModes).
