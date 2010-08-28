stack
upcall: anObject
	"Receive anObject from my low protocol.  Default is to pass it on to my high protocol unmodified (in other words, I am transparent)."

	up upcall: anObject