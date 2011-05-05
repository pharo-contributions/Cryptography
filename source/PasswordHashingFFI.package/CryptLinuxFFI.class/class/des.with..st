as yet unclassified
des: password with: salt
	"Returns the DES encrypted password.  "

	^self ffiCrypt: password with: (self prepareSalt:   salt).
	