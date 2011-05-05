as yet unclassified
bcrypt: password
	"Returns the bcrypt encrypted password.  "
	^self bcrypt: password with: self randomBCryptSaltData.   
	