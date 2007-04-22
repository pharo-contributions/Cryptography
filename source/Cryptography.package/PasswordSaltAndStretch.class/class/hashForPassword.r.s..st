instance creation
hashForPassword: aPassword r: aStretchInteger s: salt
	^self new
		r: aStretchInteger;
		s: salt;
		saltAndStretch: aPassword