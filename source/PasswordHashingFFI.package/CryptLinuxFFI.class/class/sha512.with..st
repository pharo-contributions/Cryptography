as yet unclassified
sha512: password with: salt
	"Returns thesha512 hashed password.  "
	|cryptSalt|
	cryptSalt :='$6$',  (self prepareSalt:   salt) , '$'.
	^self ffiCrypt: password with: cryptSalt.
	