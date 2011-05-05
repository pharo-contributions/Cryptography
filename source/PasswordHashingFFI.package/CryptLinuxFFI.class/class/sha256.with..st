as yet unclassified
sha256: password with: salt
	"Returns the sha256 hashed password.  "
	|cryptSalt|
	cryptSalt :='$5$',  (self prepareSalt:   salt) , '$'.
	^self ffiCrypt: password with: cryptSalt.
	