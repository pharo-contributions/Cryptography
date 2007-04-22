instance creation
hashForPassword: aPassword r: aStretchInteger
	^self hashForPassword: aPassword r: aStretchInteger s: (SecureRandom new nextBytesNonZero: 32)