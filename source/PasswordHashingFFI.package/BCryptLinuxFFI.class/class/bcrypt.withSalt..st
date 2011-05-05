as yet unclassified
bcrypt: password withSalt: salt
	"Returns the bcrypt encrypted password.  "
	^self ffiCrypt: password  with:   salt
	