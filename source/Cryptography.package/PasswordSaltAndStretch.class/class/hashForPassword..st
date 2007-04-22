instance creation
hashForPassword: aPassword
	"the default for r is way to small.  Once we have a primitive SHA256 this should be increased so that this method takes at least 1 second"
	^self hashForPassword: aPassword r: self defaultR
		