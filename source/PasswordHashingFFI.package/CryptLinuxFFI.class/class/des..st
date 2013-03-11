as yet unclassified
des: password 
	"Returns the DES encrypted password.  "

	^self des: password with: self randomSalt 