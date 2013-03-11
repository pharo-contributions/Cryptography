as yet unclassified
sha512: password
	"Returns thesha512 hashed password.  "
	^self sha512: password with: self randomSalt 