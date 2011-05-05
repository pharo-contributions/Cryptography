as yet unclassified
bcrypt: password with: salt
	"Returns the bcrypt encrypted password.  "
	^self bcrypt: password with: salt  for: self defaultRounds.   
	