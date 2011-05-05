as yet unclassified
md5: password with: salt
	"Returns the md5 hashed password.  "
	|cryptSalt|
	cryptSalt :='$1$',  (self prepareSalt:   salt) , '$'.
	^self ffiCrypt: password with: cryptSalt.
	