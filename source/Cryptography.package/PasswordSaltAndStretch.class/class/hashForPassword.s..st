instance creation
hashForPassword: aPassword s: salt
	^self new
		r: self defaultR;
		s: salt;
		saltAndStretch: aPassword