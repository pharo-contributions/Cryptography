as yet unclassified
bcrypt: password with: salt for: iterations


	"Returns the bcrypt encrypted password. use salt=  nil for random salt.    "
	| bcryptSalt  |
	
	bcryptSalt :='$2a$', (self generateBCryptIterations: iterations) , '$', (self generateBCryptSalt: salt).

	^self ffiCrypt: password with: bcryptSalt.
	